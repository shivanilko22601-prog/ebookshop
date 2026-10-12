<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Welcome | E-Book Shop</title>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
  <jsp:include page="banner.jsp" />
  <jsp:include page="menu.jsp" />
  <main class="page-shell">
    <% if ("database".equals(request.getParameter("error")) || application.getAttribute("DB_ERROR") != null) { %>
      <div class="notice">Database is not connected. Run <b>database/setup.sql</b>, then check the MySQL settings in <b>README.md</b>.</div>
    <% } %>
    <section class="hero">
      <span class="eyebrow">Your campus book corner</span>
      <h1>Find the right book for your next big idea.</h1>
      <p>Browse useful engineering books and magazines, keep your selections in one cart, and get started with your E-Book Shop account.</p>
    </section>
    <section class="form-card">
      <h2>Welcome back</h2>
      <p>Sign in to explore the collection.</p>
      <form method="post" action="ValidateLogin.jsp">
        <label for="login-email">Email address</label>
        <input id="login-email" type="email" name="txt_uid" placeholder="you@example.com" autocomplete="username" required>
        <label for="login-password">Password</label>
        <input id="login-password" type="password" name="txt_pass" placeholder="Enter your password" autocomplete="current-password" required>
        <input type="submit" value="Sign in">
      </form>
      <p>New here? <a href="Signup.jsp"><b>Create an account</b></a></p>
      <p><a href="forget.jsp">Forgot your password?</a></p>
    </section>
  </main>
  <footer>E-Book Shop · College project demo</footer>
</body>
</html>
