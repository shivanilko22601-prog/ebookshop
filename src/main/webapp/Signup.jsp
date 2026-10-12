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




<%!

	String[] squest={"What is your first school name?","What is your favourite movie?","Your favourite writer name?"};

%>



<form method="post" action="SignupConfirm.jsp" onsubmit="return crossCheckPassword();">


<table cellpadding="10" cellspacing="0" border="0" width="70%" bgcolor="lightyellow">


	<tr bgcolor="blue"><th><font color="white">SIGN UP FORM</font></th></tr>
	
	
	<tr><td><input type="text" name="txt_name" placeholder="ENTER THE NAME" required="required"></td></tr>

	<tr><td><input type="email" name="txt_email" placeholder="ENTER THE EMAIL" onkeyup="sendData(this.value)" required="required" /><br><b id="info"></b></td></tr>
	
	<tr><td><input type="text" name="txt_address" placeholder="ENTER THE ADDRESS" required="required"></td></tr>
	
	

	<tr>	<td>
	
	
			<select name="cmb_quest" required>
			
				<option value="" selected>-select security quest-</option>
				
				
				<%
				
					for(String value:squest)
						{
						
						
				%>
				
				<option value="<%=value%>"><%=value%></option>
				
				
				<%
						
						
						
						}
				
				
				%>
			
			</select>
	
	
	
	
	</td></tr>


	<tr><td><input type="text" name="txt_answer" placeholder="ENTER THE SECURITY ANSWER" required="required"></td></tr>
	
	<tr><td><input type="password" name="txt_pass" placeholder="ENTER THE PASSWORD" id="pass" required="required"/></td></tr>
	<tr><td><input type="password" name="txt_pass1" placeholder="CONFIRM PASSWORD" id="repass" required="required" /></td></tr>
	
	<tr>	<td><input type="submit" value="SIGN UP"></td></tr>

</table>







</form>
























</td>  			</tr>








</table>




</body>
</html>
