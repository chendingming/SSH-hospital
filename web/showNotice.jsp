<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/16 0016
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<head>
    <title>公告详情</title>
</head>
<body>
    <div class="container">
        <c:forEach items="${notice}" var="notice">
            <div class="jumbotron">
                <div><h2><li class="fa fa-tags fa-fw"></li>${notice.biaoti}</h2></div>
                <p>${notice.neirong}</p>
                <div><a href="javascript:(0);" onclick="history.go(-1)" class="c-primary">&lt; 返回上一页</a></div>
            </div>
        </c:forEach>

    </div>
</body>
</html>
