/**
 * 
 */



function makeRequestObject()
	{
		var xmlHttp=false;		
		try
			{				
				
				xmlHttp=new ActiveXObject('Msxml2.XMLHTTP');
				
			}
			catch(e)
				{
					try
						{
							xmlHttp=new ActiveXObject('Microsoft.XMLHTTP');							
							
						}
					catch(E)
						{
							
							xmlHttp=false;
							
						}				
					
					
				}
		
		if(!xmlHttp && typeof(XMLHttpRequest)!='undefined')
				{
					xmlHttp=new XMLHttpRequest();
					
					
					
				}
		return xmlHttp;
		
	}
	
function sendData(val)
	{
		
		var xmlHttp=makeRequestObject();
		var _url='CrossCheckId.jsp?uid='+val;
		
		xmlHttp.open('GET',_url,true);
		
		xmlHttp.onreadystatechange=function()
											{
												
												if(xmlHttp.readyState==4 && xmlHttp.status==200)
														{
															var content=xmlHttp.responseText;
															
															
															
															if(content)
																	{
																		
																		document.getElementById("info").innerHTML=content;
																		
																		
																	}
															
															
															
															
														}
												
												
												
											}
		
		
		
		
		xmlHttp.send(null);
		
	}
	
	
	
	
	function securityQuestFound()
		{
			var xmlHttp=makeRequestObject();			
			var _url='GetSecurityQuest.jsp?uid='+document.getElementById("uid").value;	
			
			xmlHttp.open('GET',_url,true);
			
			xmlHttp.onreadystatechange=function()
												{
													
													if(xmlHttp.readyState==4 && xmlHttp.status==200)
															{
																var content=xmlHttp.responseText;
																
																
																if(content)
																		{
																			document.getElementById("info").innerHTML=content;
																			
																			
																		}
																
																
																
															}
													
													
													
													
												};
			
			
			
			xmlHttp.send(null);
			
		}
	
	
	function crossCheckPassword()
		{
			
			
				if(document.getElementById("pass").value !=document.getElementById("repass").value)
						{
							alert("Password Mismatch!");
							
							return false;
							
						}
				else
						{
							
							return true;
							
						}
			
			
			
		}
		
		
		
		function populateSubCategory(val)
			{
				
				var xmlHttp=makeRequestObject();
				var _url='SubCategory.jsp?cname='+val;
			
				
				xmlHttp.open('GET',_url,true);
				
				xmlHttp.onreadystatechange=function()
													{
														
														if(xmlHttp.readyState==4 && xmlHttp.status==200)
																{
																	var content=xmlHttp.responseText;
																	
																	
																	
																	if(content)
																			{
																				
																				document.getElementById("info").innerHTML=content;
																				
																				
																			}
																	
																	
																	
																	
																}
														
														
														
													}
				
				
				
				
				xmlHttp.send(null);
				
			}
			
			
			
			function addToCart(val)
				{
					
					var xmlHttp=makeRequestObject();
					var _url='AddToCart.jsp?bid='+val;				
					
					xmlHttp.open('GET',_url,true);
					
					xmlHttp.onreadystatechange=function()
														{
															
															if(xmlHttp.readyState==4 && xmlHttp.status==200)
																	{
																		var content=xmlHttp.responseText;
																		
																		
																		
																		if(content)
																				{
																					
																					alert(content);
																					
																					
																				}
																		
																		
																		
																		
																	}
															
															
															
														}
					
					
					
					
					xmlHttp.send(null);
					
				}
				
			
			
		
