<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires", 0);

if(session.getAttribute("username")==null){
    response.sendRedirect("login.jsp");
    return;   
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Welcome</title>
<style>
body{
    margin:0;
    font-family:Arial;
    background:linear-gradient(135deg,#43cea2,#185a9d);
    color:white;
    display:flex;
    justify-content:center;
    align-items:center;
    height:100vh;
}

.box{
    text-align:center;
    background:rgba(255,255,255,0.1);
    padding:40px;
    border-radius:15px;
    backdrop-filter: blur(10px);
}

h1{
    margin-bottom:20px;
}

button{
    padding:10px 20px;
    border:none;
    border-radius:8px;
    background:#ff5e62;
    color:white;
    cursor:pointer;
}
</style>
</head>

<body class="welcome-bg">

<div class="box">
    <h1>Welcome ${username}</h1>

    <form action="Logout">
        <button type="submit">Logout</button>
    </form>
</div>

</body>
</html>



