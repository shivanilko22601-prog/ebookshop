<%@page import="java.util.Vector"%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);

	if(session.getAttribute("uid")==null)
		{
		
			response.sendRedirect("ErrorPage.jsp");
		}


%>


<%

	if (session.getAttribute("mycart") == null) {
		Vector cart = new Vector();
		session.setAttribute("mycart", cart);
	}
	


%>



<html>


<head>


	<link  type="text/css" rel="stylesheet" href="css/style.css" />
</head>
<body>

<table cellpadding="10" cellspacing="0" border="0" width="100%" bgcolor="lightyellow">


<tr>	<td colspan="2"><jsp:include page="banner.jsp"/> </td>			</tr>





<tr>	<td colspan="2" align="center"><jsp:include page="menu.jsp"/></td>		</tr>
<tr>	<td colspan="2" align="center">


			
		<h2>Welcome, <%= session.getAttribute("uid") %>!</h2>
		<p>Browse a category above, add books to your cart, and review your selections before checkout.</p>














</td></tr>






</table>




</body>
</html>
