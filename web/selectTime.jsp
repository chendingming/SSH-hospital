<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/18 0018
  Time: 10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title>医生坐诊时间表</title>
    <link rel="shortcut icon" href="images/favicon.ico" >
    <link rel="stylesheet" type="text/css" href="css/order.css">
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/doctor_detail.css" />

</head>

<body>

<div>
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
</div>
<div>
    <br>
</div>
<div>
    <div class="wrap">

        <div class="ys-doctor-detail">
            <div class="ys-util-bg-gray container-box">
                <article class="container-frame">
                    <section class="container-summary">
                        <div class="summary-img ys-util-img"><a class="ys-img-lazy-frame" href="javascript:void(0);">
                            <img class="" src="${doctor.image}" data-img-lazy-src="images/images/yisheng1.png" style="height: 100%;"></a></div>
                        <div class="summary-list">
                            <div>
                                <h3>姓名：${doctor.doctor_name}</h3>
                            </div>
                            <div>
                                <h6 class="ys-util-text-normal ys-util-text-secondary">擅长：</h6>
                                <label class="ys-util-text-normal" id="goodat-label">${doctor.shanchang }</label>
                            </div>
                        </div>
                    </section>
                </article>

            </div>
        </div>
    </div>


    <div class="line"></div>

    <div class="doctor_con">
        <div class="con">
            <div class="tab">
                <div class="tab_hd clearfix text-center">
                    <div class="active float-left"><a href="#doctor_index">医生首页</a></div>
                </div>
                <div class="panel panel-primary auto">
                    <div class="panel-heading">
                        <h3>选择时间段</h3>
                    </div>
                    <div class="panel-body">

                        <table>
                            <c:if test="${mon=='上午'}">
                                <tr>
                                    <c:forEach items="${numberStateList}" var="numberState">
                                        <c:if test="${numberState.state==0}">
                                            <td><a href="OrderAction_index?doctor_name=${doctor_name}&doctor_id=${doctor_id}&date=${date}&time=${numberState.time}&number=${numberState.number}" class="btn btn-info">${numberState.time}</a> &nbsp;</td>
                                        </c:if>
                                        <c:if test="${numberState.state==1}">
                                            <td><button type="button" class="btn btn-info" disabled="disabled">${numberState.time}</button> &nbsp;</td>
                                        </c:if>
                                    </c:forEach>
                                    <%--<td><a href="OrderAction_index?doctor_name=${doctor_name}&doctor_id=${doctor_id}&date=${date}&time=09:00&number=1" class="btn btn-info">09:00-09:15</a> &nbsp;</td>
                                    <td><a href="OrderAction_index?doctor_name=${doctor_name}&doctor_id=${doctor_id}&date=${date}&time=09:15&number=2" class="btn btn-info">09:15-09:30</a> &nbsp;</td>
                                    <td><a href="OrderAction_index?doctor_name=${doctor_name}&doctor_id=${doctor_id}&date=${date}&time=09:30&number=3" class="btn btn-info">09:30-09:45</a> &nbsp;</td>
                                    <td><a href="OrderAction_index?doctor_name=${doctor_name}&doctor_id=${doctor_id}&date=${date}&time=09:45&number=4" class="btn btn-info">09:45-10:00</a> &nbsp;</td>
                                    <td><a href="OrderAction_index?doctor_name=${doctor_name}&doctor_id=${doctor_id}&date=${date}&time=10:00&number=5" class="btn btn-info">10:00-10:15</a> &nbsp;</td>
                                    <td><a href="OrderAction_index?doctor_name=${doctor_name}&doctor_id=${doctor_id}&date=${date}&time=10:15&number=6" class="btn btn-info">10:15-10:30</a> &nbsp;</td>
                                    <td><a href="OrderAction_index?doctor_name=${doctor_name}&doctor_id=${doctor_id}&date=${date}&time=10:30&number=7" class="btn btn-info">10:30-10:45</a> &nbsp;</td>
                                    <td><a href="OrderAction_index?doctor_name=${doctor_name}&doctor_id=${doctor_id}&date=${date}&time=10:45&number=8" class="btn btn-info">10:45-11:00</a> &nbsp;</td>
                                    <td><a href="OrderAction_index?doctor_name=${doctor_name}&doctor_id=${doctor_id}&date=${date}&time=11:00&number=9" class="btn btn-info">11:00-11:15</a> &nbsp;</td>
                                    <td><a href="OrderAction_index?doctor_name=${doctor_name}&doctor_id=${doctor_id}&date=${date}&time=11:15&number=10" class="btn btn-info">11:15-11:30</a> &nbsp;</td>--%>
                                </tr>
                            </c:if>
                            <c:if test="${mon=='下午'}">
                                <tr>
                                    <c:forEach items="${numberStateList}" var="numberState">
                                        <c:if test="${numberState.state==0}">
                                            <td><a href="OrderAction_index?doctor_name=${doctor_name}&doctor_id=${doctor_id}&date=${date}&time=${numberState.time}&number=${numberState.number}" class="btn btn-info">${numberState.time}</a> &nbsp;</td>
                                    </c:if>
                                        <c:if test="${numberState.state==1}">
                                            <td><button type="button" class="btn btn-info" disabled="disabled">${numberState.time}</button> &nbsp;</td>
                                        </c:if>
                                    </c:forEach>
                                    <%--<td><a href="OrderAction_index?doctor_name=${doctor_name}&doctor_id=${doctor_id}&date=${date}&time=14:30&number=11" class="btn btn-info">14:30-14:45</a> &nbsp;</td>
                                    <td><a href="OrderAction_index?doctor_name=${doctor_name}&doctor_id=${doctor_id}&date=${date}&time=14:45&number=12" class="btn btn-info">14:45-15:00</a> &nbsp;</td>
                                    <td><a href="OrderAction_index?doctor_name=${doctor_name}&doctor_id=${doctor_id}&date=${date}&time=15:00&number=13" class="btn btn-info">15:00-15:15</a> &nbsp;</td>
                                    <td><a href="OrderAction_index?doctor_name=${doctor_name}&doctor_id=${doctor_id}&date=${date}&time=15:15&number=14" class="btn btn-info">15:15-15:30</a> &nbsp;</td>
                                    <td><a href="OrderAction_index?doctor_name=${doctor_name}&doctor_id=${doctor_id}&date=${date}&time=15:30&number=15" class="btn btn-info">15:30-15:45</a> &nbsp;</td>
                                    <td><a href="OrderAction_index?doctor_name=${doctor_name}&doctor_id=${doctor_id}&date=${date}&time=15:45&number=16" class="btn btn-info">15:45-16:00</a> &nbsp;</td>
                                    <td><a href="OrderAction_index?doctor_name=${doctor_name}&doctor_id=${doctor_id}&date=${date}&time=16:00&number=17" class="btn btn-info">16:00-16:15</a> &nbsp;</td>
                                    <td><a href="OrderAction_index?doctor_name=${doctor_name}&doctor_id=${doctor_id}&date=${date}&time=16:15&number=18" class="btn btn-info">16:15-16:30</a> &nbsp;</td>
                                    <td><a href="OrderAction_index?doctor_name=${doctor_name}&doctor_id=${doctor_id}&date=${date}&time=16:30&number=19" class="btn btn-info">16:30-16:45</a> &nbsp;</td>
                                    <td><a href="OrderAction_index?doctor_name=${doctor_name}&doctor_id=${doctor_id}&date=${date}&time=16:45&number=20" class="btn btn-info">16:45-17:00</a> &nbsp;</td>--%>
                                </tr>
                            </c:if>
                            <c:if test="${mon=='晚上'}">
                                <tr>
                                    <c:forEach items="${numberStateList}" var="numberState">
                                        <c:if test="${numberState.state==0}">
                                            <td><a href="OrderAction_index?doctor_name=${doctor_name}&doctor_id=${doctor_id}&date=${date}&time=${numberState.time}&number=${numberState.number}" class="btn btn-info">${numberState.time}</a> &nbsp;</td>
                                        </c:if>
                                        <c:if test="${numberState.state==1}">
                                            <td><button type="button" class="btn btn-info" disabled="disabled">${numberState.time}</button> &nbsp;</td>
                                    </c:if>
                                    </c:forEach>
                                    <%--<td><a href="OrderAction_index?doctor_name=${doctor_name}&doctor_id=${doctor_id}&date=${date}&time=19:00&number=21" class="btn btn-info">19:00-19:15</a> &nbsp;</td>
                                    <td><a href="OrderAction_index?doctor_name=${doctor_name}&doctor_id=${doctor_id}&date=${date}&time=19:15&number=22" class="btn btn-info">19:15-19:30</a> &nbsp;</td>
                                    <td><a href="OrderAction_index?doctor_name=${doctor_name}&doctor_id=${doctor_id}&date=${date}&time=19:30&number=23" class="btn btn-info">19:30-19:45</a> &nbsp;</td>
                                    <td><a href="OrderAction_index?doctor_name=${doctor_name}&doctor_id=${doctor_id}&date=${date}&time=19:45&number=24" class="btn btn-info">19:45-20:00</a> &nbsp;</td>
                                    <td><a href="OrderAction_index?doctor_name=${doctor_name}&doctor_id=${doctor_id}&date=${date}&time=20:00&number=25" class="btn btn-info">20:00-20:15</a> &nbsp;</td>
                                    <td><a href="OrderAction_index?doctor_name=${doctor_name}&doctor_id=${doctor_id}&date=${date}&time=20:15&number=26" class="btn btn-info">20:15-20:30</a> &nbsp;</td>--%>
                                </tr>
                            </c:if>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="js/jquery.min.js"></script>




    <script type="text/javascript" src="js/jquery.min.js"></script>

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
</div>
</body>
<%--<script>
    $(function () {
        var data={doctor_id:${doctor_id},date:${date},mon:${mon}}
        $.ajax({
           url:'OrderAction_getOrderNumber',
            dataType:'json',
            type:'get',
            data:data,
            success:function (result) {
                var orderList=eval(result);
                for (var i=0;i<orderList.length;i++){

                }
            }
        });
    })
</script>--%>
</html>
