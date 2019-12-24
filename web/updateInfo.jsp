<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>用户信息修改</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/Layout.css" rel="stylesheet">
    <script type="text/javascript">
        function returnlogin(){
            window.location.href="login.jsp";
        }
    </script>
    <style>
        .body{
            background: url("/images/loginBag.jpg");
            height:100%;
            width:100%;
            overflow: hidden;
            background-size:cover;
        }
    </style>
</head>
<body class="body">
<br><br><br><br><br><br>
<div id="loginF" align="center">
    <form class="form-signin" action="${pageContext.request.contextPath}/UserAction_update" method="post">
        <div><h3 class="form-signin-heading">信息修改</h3></div>
        <div>
            <input type="hidden" name="user_id" value="${sessionScope.user.user_id}">
            <div>
                <lable for="user_name" class="sr-only">用户名</lable>
                <input type="text" name="user_name" value="${sessionScope.user.user_name}" id="user_name" class="form-control" placeholder="注册的用户名" readonly="readonly"/>
            </div><br>

            <div>
                <lable for="rpassword" class="sr-only">密码</lable>
                <input type="password" value="${sessionScope.user.user_pw}" name="user_pw" id="rpassword" class="form-control" placeholder="注册的密码" />

            </div><br>


            <div>
                <lable for="realname" class="sr-only">真实姓名</lable>
                <input type="text" value="${sessionScope.user.user_realname}" name="user_realname" id="realname" class="form-control" placeholder="真实姓名" />

            </div><br>

            <div>
                <lable for="user_address" class="sr-only">地址</lable>
                <input type="text" value="${sessionScope.user.user_address}" name="user_address" id="user_address" class="form-control" placeholder="地址" />

            </div><br>

            <div>
                <lable for="user_tel" class="sr-only">联系电话</lable>
                <input type="text" value="${sessionScope.user.user_tel}" name="user_tel" id="user_tel" class="form-control" />

            </div><br>

            <div>
                <lable for="user_email" class="sr-only">邮箱</lable>
                <input type="text" value="${sessionScope.user.user_email}" name="user_email" id="user_email" class="form-control" placeholder="邮箱" />

            </div><br>



            <table>

                <tr>
                    <td><button type="submit" id="register" name="register" class="btn btn-lg btn-primary btn-block">确认修改</button></td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td><button type="button" onclick="returnlogin()" class="btn btn-lg btn-primary btn-block">返回</button></td>
                </tr>
            </table>
        </div>


    </form>
</div>
</body>
</html>