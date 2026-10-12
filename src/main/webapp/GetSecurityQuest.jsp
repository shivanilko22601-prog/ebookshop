<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%

	String uid=request.getParameter("uid");
	
	Connection cn=(Connection)application.getAttribute("CONN");
	
	PreparedStatement ps=cn.prepareStatement("select security_quest from user_info where emailid=?");
	ps.setString(1, uid);
	
	
	ResultSet rs=ps.executeQuery();
	
	
	if(rs.next())
		{
		
%>


<font color="red"><b><%=rs.getString(1)%></b></font>
<hr>

<input type="text" name="txt_answer" placeholder="ENTER ANSWER">
<hr>

<input type="submit" value="VALIDATE & RESET"/>


<%
		}
	else
		{
			out.println("<font color=blue>User Not Found!</font>");
		
		}
	

%>