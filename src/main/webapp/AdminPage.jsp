<% if (!"Admin".equals(session.getAttribute("usertype"))) { response.sendRedirect("index.jsp"); return; } %>
<html>


<head>


	<link  type="text/css" rel="stylesheet" href="css/style.css" />
</head>
<body>

<table cellpadding="10" cellspacing="0" border="0" width="100%" bgcolor="lightyellow">


<tr>	<td colspan="2"><jsp:include page="banner.jsp"/> </td>			</tr>





<tr>	<td colspan="2" align="center"><jsp:include page="menu.jsp"/></td>		</tr>
<tr>	<td colspan="2" align="center">


			

<table cellpadding="10" cellspacing="0" border="0" width="90%" bgcolor="lightyellow">


	<tr bgcolor="blue"><th><font color="white">ADMIN FORMS</font></th></tr>
	<tr><td align="center">	Demo administrator: <b>admin@ebookshop.local</b></td></tr>
	<tr><td align="center">	<a href="BEntry.jsp"> BOOK ENTRY FORM</a></td></tr>
	<tr><td align="center">	<hr></td></tr>




</table>















</td></tr>






</table>




</body>
</html>
