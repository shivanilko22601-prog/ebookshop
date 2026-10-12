<%@page import="java.sql.ResultSet"%><%@page import="java.sql.PreparedStatement"%><%@page import="java.sql.Connection"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Connection cn = (Connection)application.getAttribute("CONN");
%>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Magazines - E-Book Shop</title><link rel="stylesheet" href="css/style.css"><script src="js/prog1.js"></script></head><body>
<jsp:include page="banner.jsp"/><jsp:include page="menu.jsp"/>
<main class="content-card"><h2>Magazines</h2>
<% if (cn == null || cn.isClosed()) { %><p class="error">Database is not connected. Follow README.md setup steps.</p>
<% } else { try (PreparedStatement ps = cn.prepareStatement("SELECT bid,bname,bpublication,bdetail,bcost FROM books WHERE bcategory='Magazines' ORDER BY bname"); ResultSet rs = ps.executeQuery()) { if (!rs.isBeforeFirst()) { %><p>No magazines have been added yet. The admin can add one from the book entry form.</p><% } while (rs.next()) { %>
<article class="book-card"><h3><%=rs.getString("bname")%></h3><p><%=rs.getString("bpublication")%></p><p><%=rs.getString("bdetail")%></p><p>₹<%=String.format("%.2f", rs.getDouble("bcost"))%></p><a href="javascript:addToCart('<%=rs.getInt("bid")%>')">Add to cart</a></article>
<% } } } %>
</main></body></html>
