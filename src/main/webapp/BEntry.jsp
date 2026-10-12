<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<% if (!"Admin".equals(session.getAttribute("usertype"))) { response.sendRedirect("index.jsp"); return; } %>
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
		
			PreparedStatement ps=cn.prepareStatement("select distinct category_name from cat_subcat");
			ResultSet rs=ps.executeQuery();
		
		%>





		<form method="post" action="UploadServlet" enctype="multipart/form-data">
		
		
		
			<table cellpadding="10" cellspacing="0" border="0" width="70%" bgcolor="lightyellow">
			
			
					<tr bgcolor="blue"><th><font color="white">BOOK ENTRY FORM</font></th></tr>
					
					<tr><td><input type="text" name="txt_bname" placeholder="ENTER BOOK NAME" required></td></tr>
					<tr><td>
					
							<select name="cmb_category" onchange="populateSubCategory(this.value)">
							
									<option value="" selected>-select category-</option>
									
									<%
									
										while(rs.next())
											{
											
									%>
									<option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
									
									<%
											
											
											}
									
									
									%>
							
							
							
							</select>
					
					
					
					</td></tr>
					
					<tr><td>
					
							<select name="cmb_scategory" id="info">
							
									<option value="" selected>-select sub category-</option>
							
							
							
							</select>
					
					
					
					</td></tr>
					
					
				<tr>	<td></td></tr>
				
				
				
				
				<tr><td><input type="text" name="txt_publication" placeholder="ENTER PUBLICATION NAME" required></td></tr>
				
				
				<tr><td><input type="text" name="txt_details" placeholder="ENTER DETAILS" required></td></tr>
				<tr><td><input type="number" min="0" step="0.01" name="txt_cost" placeholder="ENTER BOOK COST" required></td></tr>
				<tr><td>UPLOAD  IMAGE &nbsp;&nbsp;<input type="file" name="file_upload"></td></tr>
				<tr><td><input type="submit" value="Upload Record"></td></tr>
			
			
			
			
			</table>
		
		
		
		
		
		
		
		
		</form>
























</td>  			</tr>








</table>




</body>
</html>
