<% if (session.getAttribute("uid") == null) { response.sendRedirect("index.jsp"); return; } %>
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

		Connection cn=(Connection)application.getAttribute("CONN");

		String category="Engineering";
		String scategory="Civil Engineering";
		
		
		PreparedStatement ps=cn.prepareStatement("select * from books where bcategory=? and bsubcategory=?");
		ps.setString(1, category);
		ps.setString(2, scategory);
		
		ResultSet rs=ps.executeQuery();
		
		




%>


	
<table cellpadding="5" cellspacing="0" border="0" width="80%" bgcolor="lightyellow">



	<tr bgcolor="blue"><th colspan="4"><font color="white">CIVIL ENGINEERING BOOKS</font></th></tr>

	<%
	
			while(rs.next())
				{
				
	%>
	
	
	<tr>	<td width="25%"></td><td><font face="courier" color="brown"><b>Book Name</b></font></td><td><%=rs.getString(2)%></td>
	<td width="25%" rowspan="2">
	
			<img src="ShowImage.jsp?bid=<%=rs.getString(1)%>" width="120" height="120" />
	
	
	</td>	</tr>
	<tr bgcolor="#dffbfa">	<td width="25%"></td><td><font face="courier" color="brown"><b>Publication Name</b></font></td><td><%=rs.getString(3)%></td>	</tr>
	<tr>	<td width="25%"></td><td><font face="courier" color="brown"><b>Book Details</b></font></td><td><%=rs.getString(4)%></td><td width="25%"></td>	</tr>
	<tr bgcolor="#dffbfa">	<td width="25%" ></td><td><font face="courier" color="brown"><b>Book Cost</b></font></td><td><%=rs.getString(5)%></td><td width="25%"></td>	</tr>
	
	
	<tr><td colspan="4"><hr/></td></tr>
	<tr bgcolor="pink"><td colspan="4" align="center"><a href="javascript: addToCart('<%=rs.getString(1)%>')">Add To Cart</a></td></tr>
	<tr><td colspan="4"><hr/></td></tr>
	
	
	<%	
				
				
				}
	
	
	%>




</table>






















</td>  			</tr>








</table>




</body>
</html>
