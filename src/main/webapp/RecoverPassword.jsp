<%@page import="java.sql.ResultSet"%>
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


	String uid=request.getParameter("txt_uid");
	String answer=request.getParameter("txt_answer");
	
	
	Connection cn=(Connection)application.getAttribute("CONN");
	
	
	PreparedStatement ps=cn.prepareStatement("select * from user_info where emailid=? and security_ans=?");
	ps.setString(1, uid);
	ps.setString(2, answer);
	
	
	ResultSet rs=ps.executeQuery();
	
	
	if(rs.next())
		{
		
		
%>
		
		
		<form method="post" action="ConfirmPasswordUpdate.jsp">
		
		
		
			<table cellpadding="10" cellspacing="0" border="0" width="70%" bgcolor="lightyellow">
			
			
				<tr bgcolor="blue"><th><font color="white">RESET PASSWORD</font></th></tr>
				
				<tr>	<td>
				
				<input type="hidden" name="hid_uid" value="<%=rs.getString(1)%>" />
				<input type="password" name="txt_pass" placeholder="ENTER PASSWORD">	</td></tr>
				<tr>	<td><input type="password" name="txt_repass" placeholder="CONFIRM PASSWORD">	</td></tr>
			
				<tr>	<td><input type="submit" value="Reset Password"></td></tr>
			
			
			</table>
		
		
		
		
		
		
		
		
		</form>
		
		
		
		
		
		
		
		
		
		
		
		
		
	<%
		
		
		
		
		
		
		
		}
	else
		{
		
		
			out.println("Answer Invalid!");
		
		}






%>


	














</td>  			</tr>








</table>




</body>
</html>
