<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/14 0014
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="layui/css/layui.css" rel="stylesheet">
    <script src="layui/layui.js" type="text/javascript"></script>
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <link href="doctor/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/Layout.css" rel="stylesheet">
    <link href="admin/static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="admin/static/h-ui.admin/css/H-ui.login.css" rel="stylesheet" type="text/css" />
    <link href="admin/static/h-ui.admin/css/style.css" rel="stylesheet" type="text/css" />
    <link href="admin/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
</head>
<body background="images/loginBag.jpg" style="background-repeat:no-repeat ;background-size:100% 100%;background-attachment: fixed;">
<script type="text/javascript">
    function btToadd(){
        window.location.href="${pageContext.request.contextPath}/register.jsp";
    }
    function btToMain(){
        window.location.href="${pageContext.request.contextPath}/index.jsp";
    }
</script>

<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
    <ul class="layui-tab-title">
        <li class="layui-this">用户登录</li>
        <li>医生登录</li>
        <li>管理员登录</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <div id="cen"><h1><strong>欢迎使用预约系统</strong></h1></div>
            <br><br><br><br><br><br>
            <div id="loginF" align="center">
                <form class="form-signin" action="${pageContext.request.contextPath}/UserAction_login" method="post">


                    <div>
                        <label for="inputUsername" class="sr-only">用户名</label>
                        <input type="text" name="user_name" id="inputUsername" class="form-control" placeholder="UserName" required autofocus>
                    </div><br>
                    <div>
                        <label for="inputPassword" class="sr-only">密码</label>
                        <input type="password" name="user_pw" id="inputPassword" class="form-control" placeholder="Password" required autofocus>
                    </div><br>



                    <div >
                        <button type="submit" id="login" name="login" class="btn btn-lg btn-primary btn-block">登录</button><br>
                        <table>
                            <tr>
                                <td><button type="button" id="add" name="add" onclick="btToadd()" class="btn btn-lg btn-primary btn-block">注&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;册</button></td>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td><button type="button" id="" name="add" onclick="btToMain()" class="btn btn-lg btn-primary btn-block">返回首页</button></td>
                            </tr>
                            <a href="javascript:(0);" onclick="findPassword()" class="c-primary ml-20">忘记密码 &gt;</a>

                        </table>
                        <div>
                            <font size="10" color="red" id="getexception"><s:property value="exception.message"/></font>
                        </div>


                    </div>



                </form>
            </div>
        </div>
        <div class="layui-tab-item">
            <div class="page-holder d-flex align-items-center" id="doctorLogin">
                <div class="container">
                    <div class="row align-items-center py-5">
                        <div class="col-5 col-lg-7 mx-auto mb-5 mb-lg-0">
                            <%--<div class="pr-lg-5"><img src="images/timg.jpg" alt="" class="img-fluid"></div>--%>
                        </div>
                        <div class="col-lg-5 px-lg-4">
                            <h1 class="text-base text-primary text-uppercase mb-4">Hospital doctor Login</h1>
                            <h2 class="mb-4">Welcome doctor!</h2>
                            <p class="text-muted">please input your name and password</p>
                            <form id="loginForm" action="DoctorAction_docLogin" method="post" class="mt-4">
                                <div class="form-group mb-4">
                                    <input type="text" name="doctor_name" placeholder="doctor_name" class="form-control border-0 shadow form-control-lg">
                                </div>
                                <div class="form-group mb-4">
                                    <input type="password" name="doctor_pw" placeholder="Password" class="form-control border-0 shadow form-control-lg text-violet">
                                </div>
                                <div class="form-group mb-4">
                                    <div class="custom-control custom-checkbox">
                                        <input id="customCheck1" type="checkbox" checked class="custom-control-input">
                                        <label for="customCheck1" class="custom-control-label">Remember Me</label>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary shadow px-5">Log in</button>
                            </form>
                        </div>
                    </div>
                    <p class="mt-5 mb-0 text-gray-400 text-center">Copyright &copy; 2019.Company name All rights reserved.More Templates </p>
                    <!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)                 -->
                </div>
            </div>
        </div>
        <div class="layui-tab-item">
            <div class="header"><h1>管理员登录</h1></div>
            <div class="">
                <div id="" class="loginBox">
                    <form class="form form-horizontal" action="AdminAction_adminLogin" method="post">
                        <div class="row cl">
                            <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
                            <div class="formControls col-xs-8">
                                <input id="adname" name="userName" type="text" placeholder="账户" class="input-text size-L">
                            </div>
                        </div>
                        <div class="row cl">
                            <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
                            <div class="formControls col-xs-8">
                                <input id="password" name="userPw" type="password" placeholder="密码" class="input-text size-L">
                            </div>
                        </div>
                        <div class="row cl">
                            <div class="formControls col-xs-8 col-xs-offset-3">
                                <input class="input-text size-L" type="text" placeholder="验证码" onblur="if(this.value==''){this.value='验证码:'}" onclick="if(this.value=='验证码:'){this.value='';}" value="验证码:" style="width:150px;">
                                <img src=""> <a id="kanbuq" href="javascript:;">看不清，换一张</a> </div>
                        </div>
                        <div class="row cl">
                            <div class="formControls col-xs-8 col-xs-offset-3">
                                <input name="" type="submit" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
                                <input name="" type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="footer">医院预约管理系统</div>
        </div>
    </div>
</div>

<script>
    //注意：选项卡 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function(){
        var element = layui.element;

        //…
    });
    
    function findPassword() {
        window.location.href='findPassword.jsp'
    }
</script>

</body>
</html>
