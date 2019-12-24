<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/14 0014
  Time: 21:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>

<html>
<head>
    <title>Title</title>
</head>
<body>
病症诊断：
<p>${requestScope.record.body}</p>
药方：
<p>${requestScope.record.medical}</p>
</body>
</html>
