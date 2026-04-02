
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
%>
<!DOCTYPE html>
<html>
<head>
<title>Forgot Password</title>
<link rel="stylesheet" href="./css/style.css">
</head>

<body class="signup-bg">

<div class="container">

    <h2>Reset Password 🔑</h2>

    
    <%
        String msg = request.getParameter("msg");
        if(msg != null){
    %>
        <p class="message <%= msg.contains("success") ? "success" : "error" %>">
            <%= msg %>
        </p>
    <%
        }
    %>

    <form action="ForgotPassword" method="post">

        <div class="input-group">
            <input type="text" name="uname" required>
            <label>Enter Username</label>
        </div>

        <div class="input-group">
        <input type="password" name="pass" required
	    pattern="^(?=.*[A-Z])(?=.*[0-9])(?=.*[@#$%^&+=!]).{8,}$"
	    title="Min 8 chars, 1 Capital, 1 Number, 1 Symbol">
            <label>New Password</label>
        </div>

        <button type="submit">Update Password</button>
    </form>

    <a href="login.jsp" class="back-link">Back to Login</a>

</div>

</body>
</html>