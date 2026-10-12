<%@page import="java.sql.ResultSet"%><%@page import="java.sql.PreparedStatement"%><%@page import="java.sql.Connection"%><%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Vector cart = (Vector)session.getAttribute("mycart");
if (cart == null) { cart = new Vector(); session.setAttribute("mycart", cart); }
Connection cn = (Connection)application.getAttribute("CONN");
double total = 0;
%>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>My Cart - E-Book Shop</title><link rel="stylesheet" href="css/style.css"></head><body>
<jsp:include page="banner.jsp"/><jsp:include page="menu.jsp"/>
<main class="content-card"><h2>My Cart</h2>
<% if (cart.isEmpty()) { %><p>Your cart is empty. Browse an engineering category to add books.</p>
<% } else if (cn == null || cn.isClosed()) { %><p class="error">Database is not connected. Check the setup steps in README.md.</p>
<% } else { %><table class="catalog"><thead><tr><th>Book</th><th>Price</th></tr></thead><tbody>
<% for (Object id : cart) { try (PreparedStatement ps = cn.prepareStatement("SELECT bid,bname,bcost FROM books WHERE bid=?")) { ps.setInt(1, Integer.parseInt(id.toString())); try (ResultSet rs = ps.executeQuery()) { if (rs.next()) { total += rs.getDouble("bcost"); %>
<tr><td><%=rs.getString("bname")%></td><td>₹<%=String.format("%.2f", rs.getDouble("bcost"))%></td></tr>
<% } } } } %>
</tbody><tfoot><tr><th>Total</th><th>₹<%=String.format("%.2f", total)%></th></tr></tfoot></table>
<p class="notice">This is a college demo. Order placement and payment are not enabled.</p><% } %>
<a class="button-link" href="UserPage.jsp">Continue browsing</a></main></body></html>
