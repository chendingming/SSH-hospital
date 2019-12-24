<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/8 0008
  Time: 16:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>医生登录</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/doctorLogin.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" />
<body>
<form action="${pageContext.request.contextPath}/DoctorAction_docLogin" method="post">
    <div class="">
        <div class="input-group">
            <div id="logo">
                <img src="${pageContext.request.contextPath}/images/timg.jpg" width="250px" height="250px" />
            </div>
            <div>
                <i class="fa fa-user-circle-o fa-fw"></i>
                <input type="text" name="doctor_name" class="input" placeholder="Doctor name"/><br><br>
            </div>
            <div>
                <i class="fa fa-key fa-fw"></i>
                <input type="password" name="doctor_pw" class="input" placeholder="Password"/><br><br>
            </div>
            <div>
                <input type="submit" class="login-button" value="登录"/><br><br>

            </div>
            <div>
                <button onclick="" class="left"><i class="fa fa-arrow-circle-left fa-5x"></i></button>
            </div>
        </div>

    </div>
</form>

</body>
</html>
