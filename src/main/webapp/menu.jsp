<nav class="site-nav" aria-label="Main navigation">
  <div class="nav-inner">
    <a href="index.jsp">Home</a>
    <a href="magazines.jsp">Magazines</a>
    <a href="civil.jsp">Civil</a>
    <a href="computer.jsp">Computer</a>
    <a href="mechanical.jsp">Mechanical</a>
    <a href="cart.jsp">My Cart</a>
    <a href="about.jsp">About</a>
    <a href="contact.jsp">Contact</a>
    <% if (session.getAttribute("uid") != null) { %>
      <a href="logout.jsp">Logout</a>
    <% } else { %>
      <a href="Signup.jsp">Create account</a>
    <% } %>
  </div>
</nav>
