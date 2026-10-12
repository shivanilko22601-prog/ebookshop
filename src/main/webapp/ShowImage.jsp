<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%

	int code=Integer.parseInt(request.getParameter("bid"));

	Connection cn=(Connection)application.getAttribute("CONN");
	
	
	PreparedStatement ps=cn.prepareStatement("select cover_image from books where bid=?");
	ps.setInt(1, code);
	
	ResultSet rs=ps.executeQuery();
	
	if (!rs.next() || rs.getBlob(1) == null) { response.sendRedirect("blank.gif"); return; }
	
	
	Blob _image_in_blob=rs.getBlob(1);
	
	byte[] _image_in_bits=(byte[])_image_in_blob.getBytes(1, (int)_image_in_blob.length());
	
	OutputStream ous=response.getOutputStream();
	
	response.setContentType("image/jpg");
	
	
	ous.write(_image_in_bits);
	ous.flush();
	ous.close();
	


%>
