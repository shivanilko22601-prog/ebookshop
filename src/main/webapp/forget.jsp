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





		<form method="post" action="RecoverPassword.jsp">
		
		
		
			<table cellpadding="10" cellspacing="0" border="0" width="70%" bgcolor="lightyellow">
			
				<tr bgcolor="blue"><th colspan="2"><font color="white">Forget Password Form</font></th></tr>
				
				<tr><td><input type="text" name="txt_uid" placeholder="ENTER USER ID" id="uid"></td><td align="center"><a href="javascript: securityQuestFound()">Get Question</a></td></tr>
				
			
				<tr><td colspan="2" align="center" id="info"></td></tr>
			
			
			
			
			
			
			</table>
		
		
		
		
		
		
		
		
		
		
		
		
		</form>















</td>  			</tr>








</table>




</body>
</html>
