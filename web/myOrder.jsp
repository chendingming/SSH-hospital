<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/20 0020
  Time: 8:17
  To change this template use File | Settings | File Templates.
--%>
<style>
    .auto{
        width: 80%;
        align-content: center;
        margin: auto;
    }
</style>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>我的预约</title>
</head>
<link rel="shortcut icon" href="images/favicon.ico" >
<link rel="stylesheet" type="text/css" href="css/index.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script src="js/jquery-1.11.2.min.js"></script>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand">Hospital</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-left">
                <li><a href="index.jsp">首页</a></li>
                <li><a href="${pageContext.request.contextPath}/DoctorAction_list">医生列表</a></li>
                <li><a href="${pageContext.request.contextPath}/OrderAction_myOrder">我的预约</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">





                <li><a>当前用户：${sessionScope.user.user_name}</a></li>






            </ul>
        </div>
    </div>
</nav>
<br>
<br>
<br>

<div class="panel panel-primary auto">
    <div class="panel-heading">
        <h3>我的预约单</h3>
    </div>
    <div class="panel-body">
        <div class="table-responsive">
            <table class="table">
                <thead>
                <tr>
                    <th>医生姓名</th>
                    <th>预约日期</th>
                    <th>病状</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${orderList==''||orderList==null}">
                    <tr>
                        <td><font color="red">您当前没有预约记录</font> </td>
                    </tr>
                </c:if>
                <c:forEach items="${orderList}" var="order">
                    <tr>
                        <td>${order.doctor_name}</td>
                        <td>${order.date}</td>
                        <td>${order.sickness}</td>
                        <c:if test="${order.state==0}">
                            <td><a href="javascript:(0);" style="text-decoration: none" onclick="del(this,${order.order_id})"><span class="label label-danger radius">取消预约</span></a></td>
                            <td></td>
                        </c:if>
                        <c:if test="${order.state==1}">
                            <td><span class="label label-default ">已就诊</span></td>
                            <td><a href="javascript:(0);" style="text-decoration: none" onclick="comment('医生评价','comment.jsp?doctor_id=${order.doctor.id}','600','270')"><span class="label label-success radius">评价医生</span></a>
                            &nbsp;&nbsp;<a href="javascript:(0);" style="text-decoration: none" onclick="showRecord('查看病历','RecordAction_getByOrderId?order_id=${order.order_id}','600','270')"><span class="label label-success radius">查看病历</span></a></td>
                        </c:if>
                        <c:if test="${order.state==2}">
                            <td><span class="label label-danger ">爽约</span> </td>
                            <td></td>
                        </c:if>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </div>
</div>




<footer id="footer-three" class="footer-box footer-three clear path" data-src="http://dpp.bdimg.com/static/pc/201604261639/asset" data-href="" data-api="http://yi.baidu.com" data-passport="https://passport.baidu.com">
    <div class="footer-con">
        <div class="footer-info-url">
            <dd class="fo-link">
                <a href="#" target="_blank"><span>帮助</span>|</a>
                <a href="#" target="_blank"><span>用户协议</span>|</a>
                <a href="#" target="_blank"><span>意见反馈</span></a>
                <a href="#" target="_blank"><span>©2016 Mstanford &nbsp;&nbsp;隐私条款</span></a>
            </dd>
        </div>
    </div>
</footer>




</body>
<script src="admin/lib/layer/2.4/layer.js"></script>
<script src="js/layershow.js"></script>
<script>
    function del(obj,id) {
        layer.confirm('确定取消预约？',function (index) {
            $.ajax({
               url:"OrderAction_deleteOrder",
                method:"post",
                data:{order_id:id},
                dataType:"text",
                success:function (reslut) {
                    $(obj).parents("tr").remove();
                    $(obj).remove();
                    layer.msg('已取消!',{icon:1,time:1000});

                }
            });
        })
    }
    function comment(title,url,w,h) {
        layer_show(title,url,w,h);
    }
    function showRecord(title,url,w,h) {
        layer_show(title,url,w,h);
    }
</script>
</html>
