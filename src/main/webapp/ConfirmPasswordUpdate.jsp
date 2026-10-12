<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<html>


<head>


	<link  type="text/css" rel="stylesheet" href="css/style.css" />
	
	<script lang="JavaScript" type="text/javascript" src="js/prog1.js"></script>
</head>
<body>

<table cellpadding="10" cellspacing="0" border="0" width="100%" bgcolor="lightyellow">


<tr>	<td colspan="2"><jsp:include page="banner.jsp"/> </td>			</tr>





<tr>	<td colspan="2" align="center"><jsp:include page="menu.jsp"/></td>		</tr>
<tr>	<td colspan="2" align="center">





<%

				String uid=request.getParameter("hid_uid");
				String pass=request.getParameter("txt_pass");
				
				String confirm=request.getParameter("txt_repass");
				Connection cn=(Connection)application.getAttribute("CONN");
				if(pass == null || !pass.equals(confirm) || pass.isBlank()) { out.println("<p class='error'>Passwords do not match. Please go back and try again.</p>"); return; }
				if(cn == null) { out.println("<p class='error'>Database is not connected. Check README.md.</p>"); return; }
				
				PreparedStatement ps=cn.prepareStatement("update login set password=? where userid=?");
				ps.setString(1, pass);
				ps.setString(2, uid);
				
				int a=ps.executeUpdate();
				
				if(a>0)
					{
					
					
%>
		<h3 align="center">Password Updated <a href="index.jsp">Click Here</a> to Login</h3>



<%
					
					
					
					}




%>














</td>  			</tr>








</table>




</body>
</html>
