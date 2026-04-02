<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
%>

<!DOCTYPE html>
<html>
<head>
<title>Login</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family: 'Poppins', sans-serif;
}

body{
    height:100vh;
    background: linear-gradient(135deg,#667eea,#764ba2);
    display:flex;
    justify-content:center;
    align-items:center;
}

.container{
    backdrop-filter: blur(15px);
    background: rgba(255,255,255,0.1);
    padding:40px;
    border-radius:15px;
    box-shadow:0 8px 32px rgba(0,0,0,0.2);
    width:320px;
    text-align:center;
    color:white;
    animation: fadeIn 1s ease;
}

@keyframes fadeIn{
    from{opacity:0; transform:translateY(20px);}
    to{opacity:1; transform:translateY(0);}
}

h2{
    margin-bottom:20px;
}


.error-msg{
    color:#ff4b5c;
    background:rgba(0,0,0,0.3);
    padding:8px;
    border-radius:6px;
    margin-bottom:10px;
    font-size:14px;
}

.success-msg{
    color:#00ffb3;
    background:rgba(0,0,0,0.3);
    padding:8px;
    border-radius:6px;
    margin-bottom:10px;
    font-size:14px;
}

.input-group{
    position:relative;
    margin:20px 0;
}

.input-group input{
    width:100%;
    padding:10px;
    border:none;
    outline:none;
    border-radius:8px;
    background:rgba(255,255,255,0.2);
    color:white;
}

.input-group label{
    position:absolute;
    left:10px;
    top:10px;
    font-size:14px;
    color:#ddd;
    transition:0.3s;
}

.input-group input:focus + label,
.input-group input:valid + label{
    top:-15px;
    font-size:12px;
    color:#fff;
}

button{
    width:100%;
    padding:10px;
    border:none;
    border-radius:8px;
    background:#00c6ff;
    color:white;
    font-size:16px;
    cursor:pointer;
    transition:0.3s;
}

button:hover{
    background:#0072ff;
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
<h2>Login</h2>

<%
String error = request.getParameter("error");
String success = request.getParameter("success");

if(error != null){
%>
    <p class="error-msg"><%= error %></p>
<%
}

if(success != null){
%>
    <p class="success-msg"><%= success %></p>
<%
}
%>

<form action="Login" method="post">

    <div class="input-group">
        <input type="text" name="uname" required>
        <label>Username</label>
    </div>

    <div class="input-group">
        <input type="password" name="pass" required>
        <label>Password</label>
        <p><a href="forgot.jsp">Forgot Password?</a></p>
    </div>

    <button type="submit">Login</button>
</form>

<p>New user? <a href="Signup.jsp">Signup</a></p>

</div>

</body>
</html>