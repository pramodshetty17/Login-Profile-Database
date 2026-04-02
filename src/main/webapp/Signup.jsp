<%@ page language="java" %>
<!DOCTYPE html>
<html>
<head>
<title>Signup</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins', sans-serif;
}

body{
    height:100vh;
    background: linear-gradient(135deg,#ff9a9e,#fad0c4);
    display:flex;
    justify-content:center;
    align-items:center;
}

.container{
    backdrop-filter: blur(15px);
    background: rgba(255,255,255,0.15);
    padding:40px;
    border-radius:15px;
    box-shadow:0 8px 32px rgba(0,0,0,0.2);
    width:320px;
    text-align:center;
    color:white;
}

.input-group{
    position:relative;
    margin:20px 0;
}

.input-group input{
    width:100%;
    padding:10px;
    border:none;
    border-radius:8px;
    background:rgba(255,255,255,0.3);
    color:white;
}

.input-group label{
    position:absolute;
    left:10px;
    top:10px;
    transition:0.3s;
}

.input-group input:focus + label,
.input-group input:valid + label{
    top:-15px;
    font-size:12px;
}

button{
    width:100%;
    padding:10px;
    border:none;
    border-radius:8px;
    background:#ff758c;
    color:white;
}

.error{
    color:#ff4b5c;
    background:rgba(0,0,0,0.3);
    padding:8px;
    border-radius:6px;
    margin-bottom:10px;
    font-size:14px;
    margin-top:15px
}
p{
    margin-top:15px;
}
a{
    color:#fff;
    text-decoration:none;
    font-weight:bold;
}
</style>
</head>

<body>

<div class="container">
<h2>Create Account</h2>

<%
String msg = request.getParameter("msg");
if(msg != null){
%>
<div class="error"><%= msg %></div>
<%
}
%>

<form action="Signup" method="post">

    <div class="input-group">
        <input type="text" name="uname" required>
        <label>Username</label>
    </div>

    <div class="input-group">
        <input type="password" name="pass" required
        pattern="^(?=.*[A-Z])(?=.*[0-9])(?=.*[@#$%^&+=!]).{8,}$"
        title="Min 8 chars, 1 Capital, 1 Number, 1 Symbol">
        <label>Password</label>
    </div>

    <button type="submit">Signup</button>
</form>

<p>Already have account? <a href="login.jsp">Login</a></p>

</div>
</body>
</html>