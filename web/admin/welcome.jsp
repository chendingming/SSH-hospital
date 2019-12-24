<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/29 0029
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="lib/html5shiv.js"></script>
    <script type="text/javascript" src="lib/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
    <!--[if IE 6]>
    <script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <title>我的桌面</title>
</head>
<body>
<div class="page-container">
    <p class="f-20 text-success">欢迎使用后台管理系统 <span class="f-14">v3.1</span></p>
    <table class="table table-border table-bordered table-bg">
        <thead>
        <tr>
            <th colspan="7" scope="col">信息统计</th>
        </tr>
        <tr class="text-c">
            <th>统计</th>
            <th>资讯库</th>
            <th>目前医生人数</th>
            <th>预约量</th>
            <th>用户</th>
            <th>科室</th>
        </tr>
        </thead>
        <tbody>
        <tr class="text-c">
            <td>总数</td>
            <td id="notice"></td>
            <td id="doctor"></td>
            <td id="order"></td>
            <td id="user"></td>
            <td id="keshi"></td>
        </tr>

        </tbody>
    </table>
</div>
<footer class="footer mt-20">
    <div class="container">
        <p>©2019 Hospital 使用前必读 意见反馈 京ICP证030173号  京公网安备11000002000001号 </p>
    </div>
</footer>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script>
    $(function () {
        $.ajax({
            url:'NoticeAction_adminGetNoticeCount',
            type:'get',
            success:function (data) {
                $("#notice").append(data)
            }
        });
        $.ajax({
            url:'DoctorAction_adminGetDocCount',
            type:'get',
            success:function (data) {
                $("#doctor").append(data)
            }
        });
        $.ajax({
            url:'OrderAction_adminGetCount',
            type:'get',
            success:function (data) {
                $("#order").append(data)
            }
        });
        $.ajax({
            url:'UserAction_adminGetCount',
            type:'get',
            success:function (data) {
                $("#user").append(data)
            }
        });
        $.ajax({
            url:'KeshiAction_adminGetCount',
            type:'get',
            success:function (data) {
                $("#keshi").append(data)
            }
        });

    })

</script>
</body>
</html>
