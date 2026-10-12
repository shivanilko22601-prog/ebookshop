<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String name = request.getParameter("txt_name");
String email = request.getParameter("txt_email");
String address = request.getParameter("txt_address");
String question = request.getParameter("cmb_quest");
String answer = request.getParameter("txt_answer");
String password = request.getParameter("txt_pass");
String confirm = request.getParameter("txt_pass1");
String message = null;
boolean success = false;
Connection cn = (Connection)application.getAttribute("CONN");
if (name == null || email == null || address == null || question == null || answer == null || password == null ||
    name.isBlank() || email.isBlank() || address.isBlank() || question.isBlank() || answer.isBlank() || password.isBlank()) {
    message = "Please fill in every field.";
} else if (!password.equals(confirm)) {
    message = "The passwords do not match. Please go back and try again.";
} else if (cn == null || cn.isClosed()) {
    message = "The database is not connected. Please check the setup instructions in README.md.";
} else {
    try {
        cn.setAutoCommit(false);
        try (PreparedStatement user = cn.prepareStatement("INSERT INTO user_info(emailid,name,address,security_quest,security_ans) VALUES(?,?,?,?,?)");
             PreparedStatement login = cn.prepareStatement("INSERT INTO login(userid,password,usertype) VALUES(?,?,'Normal')")) {
            user.setString(1, email.trim()); user.setString(2, name.trim()); user.setString(3, address.trim());
            user.setString(4, question); user.setString(5, answer.trim()); user.executeUpdate();
            login.setString(1, email.trim()); login.setString(2, password); login.executeUpdate();
            cn.commit(); success = true;
        } catch (SQLException e) {
            cn.rollback();
            message = e.getErrorCode() == 1062 ? "That email is already registered. Please log in or use another email." : "Could not create the account: " + e.getMessage();
        } finally { cn.setAutoCommit(true); }
    } catch (Exception e) { message = "Could not create the account: " + e.getMessage(); }
}
%>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Sign Up - E-Book Shop</title><link rel="stylesheet" href="css/style.css"></head><body>
<jsp:include page="banner.jsp"/><jsp:include page="menu.jsp"/>
<main class="content-card">
<% if (success) { %><h2>Account created!</h2><p>You can now log in with <strong><%=email%></strong>.</p><a class="button-link" href="index.jsp">Go to login</a>
<% } else { %><h2>Sign up could not be completed</h2><p class="error"><%=message%></p><a class="button-link" href="Signup.jsp">Back to sign up</a><% } %>
</main></body></html>
