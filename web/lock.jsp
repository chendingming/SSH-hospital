<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/18 0018
  Time: 16:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="admin/lib/html5shiv.js"></script>
    <script type="text/javascript" src="admin/lib/respond.min.js"></script>
    <![endif]-->
    <link href="admin/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
    <link href="admin/static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="admin/static/h-ui.admin/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
    <!--[if IE 6]>
    <script type="text/javascript" src="admin/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <title>error</title>
</head>
<body>
<section class="container-fluid page-404 minWP text-c">
    <p class="error-title"><i class="Hui-iconfont va-m" style="font-size:80px">&#xe688;</i>
        <span class="va-m"> Sorry</span>
    </p>
    <p class="error-description">该账号已被停用</p>
    <p class="error-info">您可以：
        <a href="javascript:(0);" onclick="history.go(-1)" class="c-primary">&lt; 返回上一页</a>
        <span class="ml-20">|</span>
        <a href="javascript:(0);" onclick="closeThis()" class="c-primary ml-20">确定 &gt;</a>
    </p>
</section>
</body>
<script>
    function closeThis() {
        window.opener=null;
        window.open('','_self');
        window.close();
    }
</script>
</html>
