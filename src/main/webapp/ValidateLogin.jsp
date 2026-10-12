<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
		String uid=request.getParameter("txt_uid");
		String pass=request.getParameter("txt_pass");
				
		Connection cn=(Connection)application.getAttribute("CONN");
		if(cn == null || cn.isClosed()) { response.sendRedirect("index.jsp?error=database"); return; }
			
		PreparedStatement ps=cn.prepareStatement("select * from login where userid=? and password=?");
		ps.setString(1, uid);
		ps.setString(2, pass);
		
		
		ResultSet rs=ps.executeQuery();
		
		if(rs.next())
			{
			
				session.setAttribute("uid", uid);
				session.setAttribute("usertype", rs.getString(3));
			       
				if(rs.getString(3).equals("Admin"))
					{
					
						response.sendRedirect("AdminPage.jsp");
					
					}
				else
					{
						response.sendRedirect("UserPage.jsp");
					}		
			
			
			}
		else
			{
			
			
			response.sendRedirect("ErrorPage.jsp");
			}



%>
