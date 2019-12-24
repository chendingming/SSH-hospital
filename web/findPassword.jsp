<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/2 0002
  Time: 8:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<style>
    .myForm{
        width: 300px;
        height: 200px;
    }
    .box{
        width:100%;
        height:100%;
        text-align:center;
    }
</style>
<body>
<br><br><br><br><br><br><br>
<div class="container">

    <form class="form-signin" action="UserAction_findPassword">
        <h2 class="form-signin-heading">找回密码</h2>
        <label for="inputEmail" class="sr-only">请输入绑定的邮箱地址</label>
        <input type="email" name="user_email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
        <br>
        <button class="btn btn-lg btn-primary" onclick="backToLogin()" type="button">返回登录</button>
        <button class="btn btn-lg btn-primary" type="submit">找回密码</button>
    </form>

</div> <!-- /container -->
</body>
<script>
    function backToLogin() {
        window.location.href='login.jsp';
    }
</script>
</html>
