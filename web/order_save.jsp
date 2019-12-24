<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/19 0019
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>预约信息</title>
</head>
<script>
    function success() {
        alert("预约成功");
    }
</script>
<link rel="shortcut icon" href="images/favicon.ico" >
<link rel="stylesheet" type="text/css" href="css/index.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/doctor_detail.css" />
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





                <li><a>当前用户：${requestScope.user_name}</a></li>






            </ul>
        </div>
    </div>
</nav>
<div class="wrap">

    <div class="ys-doctor-detail">


        <div class="map-layer" id="map-layer">
            <div class="container-tab-content">
                <article class="container-main">

                    <div id="doctorInfo" class="tab-doctorInfo">
                        <div class="doctor-time">
                            <article class="select-card">
                                <h3 class="ys-util-text-medium" id="schedule-anchor">将个人信息填写完整（并仔细阅读右侧挂号规则）</h3>
                                <br><br>
                                <form action="${pageContext.request.contextPath}/OrderAction_add" method="post">
                                    <div class="form-group">
                                        <label for="inputNumber"><h4>号数</h4></label>
                                        <input type="text" class="form-control" name="number" id="inputNumber" placeholder="预约时间" value="${number}">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputUser_realname"><h4>患者姓名</h4></label>
                                        <input type="text" class="form-control" name="user_realname" id="inputUser_realname" placeholder="患者姓名" value="${sessionScope.user.user_realname}">
                                    </div>
                                    <div class="form-group" style="display: none">
                                        <label for="inputDoctor_id"><h4>医生编号</h4></label>
                                        <input type="text" class="form-control" name="doctor_id" id="inputDoctor_id" placeholder="医生编号" value="${doctor_id}">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputDoctor_name"><h4>医生姓名</h4></label>
                                        <input type="text" class="form-control" name="doctor_name" id="inputDoctor_name" placeholder="医生姓名" value="${doctor_name}">
                                    </div>
                                    <div class="form-group" style="display: none">
                                        <label for="inputUser_id"><h4>用户编号</h4></label>
                                        <input type="text" class="form-control" name="user_id" id="inputUser_id" placeholder="用户编号" value="${sessionScope.user.user_id}">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputDate"><h4>日期</h4></label>
                                        <input type="text" class="form-control" name="date" id="inputDate" placeholder="预约时间" value="${date}">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputTime"><h4>时间段</h4></label>
                                        <input type="text" class="form-control" name="time" id="inputTime" placeholder="预约时间" value="${time}">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputSickness"><h4>疾病</h4></label>
                                        <input type="text" class="form-control" name="sickness" id="inputSickness" placeholder="疾病">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputUser_tel"><h4>联系电话</h4></label>
                                        <input type="text" class="form-control" name="user_tel" id="inputUser_tel" placeholder="联系电话" value="${sessionScope.user.user_tel}">
                                    </div>
                                    <div class="form-group">
                                        <input type="submit" class="btn btn-primary" value="提交" onclick="success()">
                                        <input type="reset" class="btn-primary btn" value="清空">
                                    </div>
                                </form>

                            </article>
                        </div>
                    </div>
                </article>


                <aside class="container-aside">
                    <article class="broad" style="border-bottom: none; margin-bottom: 0px;">
                        <div class="title"><font color="red">挂号规则</font> </div>
                        <div class="ct">
                            <p class="depics"><span class="sq">1.&nbsp;</span><span class="text">医生开诊时间为每天早上9点</span></p>
                            <p class="depics"><span class="sq">2.&nbsp;</span><span class="text">可预约当天和未来6天号源</span></p>
                            <p class="depics"><span class="sq">3.&nbsp;</span><span class="text">请参考短信提示，到医院就诊</span></p>
                            <p class="depics"><span class="sq">4.&nbsp;</span><span class="text">上午时间为：9:00-11:30</span></p>
                            <p class="depics"><span class="sq">5.&nbsp;</span><span class="text">下午时间为：3:00-6:00</span></p>
                            <p class="depics"><span class="sq">6.&nbsp;</span><span class="text">夜诊时间为：7:30-8:40</span></p>
                            <p class="depics"><span class="sq">7.&nbsp;</span><span class="text">请各位用户按参考时间预约</span></p>
                        </div>
                    </article>
                    <article class="broad" style="margin-bottom: 0px;">
                        <div class="title">帮助中心<a class="more a-hover" target="_blank" href="#">更多&gt;</a></div>
                        <div class="ct">
                            <p class="depics"><span class="sq">1.&nbsp;</span><a target="_blank" href="#">如何选择医生？</a></p>
                            <p class="depics"><span class="sq">2.&nbsp;</span><a target="_blank" href="#">如何预约医生？</a></p>
                            <p class="depics"><span class="sq">3.&nbsp;</span><a target="_blank" href="#">如何评价医生？</a></p>
                        </div>
                    </article>

                </aside>
            </div>
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



<script src="js/jquery-1.11.2.min.js"></script>
<script type="text/javascript">

</script>
</body>
</html>
