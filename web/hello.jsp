<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/10 0010
  Time: 19:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        String date=request.getParameter("date");
        String mon=request.getParameter("mon");
        String doctor_name=request.getParameter("doctor_name");
    %>
<%=date%><br>
<%=mon%><br>
<%=doctor_name%>
</body>
</html>
