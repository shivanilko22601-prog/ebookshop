
<%@page import="java.util.Vector"%>
<%

	if (session.getAttribute("uid") == null) { out.print("Please log in before adding books to your cart."); return; }
	int bid=Integer.parseInt(request.getParameter("bid"));


	Vector values=(Vector)session.getAttribute("mycart");
	if (values == null) { values = new Vector(); session.setAttribute("mycart", values); }
	
	
	if(values.contains(bid))
		{
		
			out.println("Already Exist!");
		
		}
	else
		{		
			
			out.println("Item Added!");
			values.add(bid);
		
		
		}
	



%>




