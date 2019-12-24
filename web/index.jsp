<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>医院挂号系统</title>
  <link rel="shortcut icon" href="images/favicon.ico" >
  <link rel="stylesheet" href="css/index.css" >
  <link rel="stylesheet" href="css/Layout.css">
  <link href="css/font-awesome.min.css" rel="stylesheet">
  <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
</head>
<script>
    $(function () {
        $.ajax({
            url:'NoticeAction_list',
            dataType:'json',
            type:'get',
            success:function (result) {
                var noticeList=eval(result);
                var html='';
                for(var i=0;i<noticeList.length;i++){
                    var notice=noticeList[i];
                    html+='<tr>'
                        +'<td><li class="fa fa-at fa-fw"></li></td>'
                        +'<td width="90%"><a href="NoticeAction_showById?id='+notice.id+'">'+notice.biaoti+'</a></td>'
                        +'<td width="10%">'+notice.time+'</td>'
                        +'</tr>'
                }
                $("#noticeList").append(html);
            }
        });
        $.ajax({
            url:'DoctorAction_adminGetDocCount',
            type:'get',
            dataType:'text',
            success:function (result) {
                $("#doctorNum").append(result);
            }
        });
        $.ajax({
            url:'UserAction_adminGetCount',
            type:'get',
            dataType:'text',
            success:function (result) {
                $("#userNum").append(result);
            }
        })
    })
</script>
<body>

<nav class="navbar navbar-default navbar-static-top">
  <div class="containerx">
    <div class="navbar-header">
      <a class="navbar-brand" href="#"><i class="fa fa-hospital-o fa-fw"></i>&nbsp;医院在线预约系统</a>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <li class="active"><a href="${pageContext.request.contextPath}/index.jsp"><i class="fa fa-home fa-fw"></i>&nbsp;首页</a></li>
        <li><a href="${pageContext.request.contextPath}/DoctorAction_list"><i class="fa fa-stethoscope fa-fw"></i>&nbsp;找医生</a></li>
        <li><a href="Tele.jsp"><i class="fa fa-address-book fa-fw"></i>&nbsp;电话黄页</a></li>
        <li><a href="#contact"><i class="fa fa-newspaper-o fa-fw"></i>&nbsp;新闻动态</a></li>
        <li><a href="#about"><i class="fa fa-circle fa-fw"></i>&nbsp;关于</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">

      <c:if test="${sessionScope.user.user_name==null}">
        <li></a><a href="${pageContext.request.contextPath}/login.jsp"><font color="red">登录</font> </a></li>
      </c:if>
        <c:if test="${sessionScope.user.user_name!=null}">
          <li><a href="updateInfo.jsp"><i class="fa fa-user fw"></i>&nbsp;${sessionScope.user.user_realname}</a></li>&nbsp&nbsp
          <li><a href="UserAction_logOut"><i class="fa fa-arrow-circle-o-left fw"></i>&nbsp退出</a></li>
        </c:if>









      </ul>
    </div><!--/.nav-collapse -->
  </div>
</nav>

<div class="opacity"></div>
<div class="carousel-infos">
  <div id="slideBox" class="slideBox">
    <div class="hd car-item">
      <ul><li class=""></li><li class=""></li><li class="on"></li></ul>
    </div>
    <div class="bd">
      <ul>
        <li style="display: none;"><a href="#" target="_blank"><img src="images/banner1.jpg"></a></li>
        <li style="display: none;"><a href="#" target="_blank"><img src="images/banner2.jpg"></a></li>
        <li style="display: list-item;"><a href="#" target="_blank"><img src="images/banner3.jpg"></a></li>
      </ul>
    </div>
  </div>

  <div class="wrap">
    <div class="container">

      <div class="hot-department">
        <h3>公告</h3>
        <div class="content">
          <table id="noticeList">
          </table>
        </div>
      </div>


      <div id="excel-doctor-div" class="excel-doctor">
        <h3>名师名医<a href="${pageContext.request.contextPath}/DoctorAction_list" target="_blank"><span>更多名医<img src="images/arrow_normal.png"></span></a></h3>
        <div class="content slideBox2">
          <div id="pre-arrow" class="pre-arrow prev">
            <img data-gray="images/pre_disable.png" data-srchover="images/pre_hover.png" data-src="images/pre_normal.png" src="images/pre_disable.png">
          </div>
          <div class="doctail-detail bd">
            <ul id="dictor-list-ul">


              <li class="doctor-first" style="background-color: rgb(249, 249, 249);">
                <a href="#" target="_blank">
                  <img src="images/yisheng1.png">
                </a>
                <p><a target="_blank" href="#"><span>林文思</span></a>&nbsp;<span class="doctor-level">主任医师</span></p>
                <p>心血管内科</p>
                <p title="沙雕医院">沙雕医院</p>
                <p class="btn-appoint"><a target="_blank" href="#"><span style="border-color: rgb(1, 151, 241); color: rgb(255, 255, 255); background-color: rgb(1, 151, 241);">一键预约</span></a></p>
              </li>

              <li class="doctor-first" style="background-color: rgb(249, 249, 249);">
                <a href="#" target="_blank">
                  <img src="images/yisheng1.png">
                </a>
                <p><a target="_blank" href="#"><span>张升</span></a>&nbsp;<span class="doctor-level">副主任医师</span></p>
                <p>消化内科</p>
                <p title="沙雕医院">沙雕医院</p>
                <p class="btn-appoint"><a target="_blank" href="#"><span style="border-color: rgb(1, 151, 241); color: rgb(255, 255, 255); background-color: rgb(1, 151, 241);">一键预约</span></a></p>
              </li>

              <li class="doctor-first" style="background-color: rgb(249, 249, 249);">
                <a href="#" target="_blank">
                  <img src="images/yisheng1.png">
                </a>
                <p><a target="_blank" href="#"><span>施宏</span></a>&nbsp;<span class="doctor-level">副主任医师</span></p>
                <p>骨关节科</p>
                <p title="沙雕医院">沙雕医院</p>
                <p class="btn-appoint"><a target="_blank" href="#"><span style="border-color: rgb(1, 151, 241); color: rgb(255, 255, 255); background-color: rgb(1, 151, 241);">一键预约</span></a></p>
              </li>

              <li class="doctor-first" style="background-color: rgb(249, 249, 249);">
                <a href="#" target="_blank">
                  <img src="images/yisheng1.png">
                </a>
                <p><a target="_blank" href="#"><span>林昊</span></a>&nbsp;<span class="doctor-level">副主任医师</span></p>
                <p>泌尿外科</p>
                <p title="沙雕医院">沙雕医院</p>
                <p class="btn-appoint"><a target="_blank" href="#"><span style="border-color: rgb(1, 151, 241); color: rgb(255, 255, 255); background-color: rgb(1, 151, 241);">一键预约</span></a></p>
              </li>

            </ul>
          </div>
          <div id="next-arrow" class="next-arrow next">
            <img data-gray="images/arrow_disable.png" data-srchover="images/arrow_hover.png" data-src="images/arrow_normal.png" src="images/arrow_disable.png">
          </div>
        </div>
      </div>





    </div>
    <div class="right-sidebar-info">
      <!-- 右侧统计信息 -->
      <div class="res-info">
        <div class="city-info">
          <h3 class="res-title">累计</h3>
        </div>
        <div class="num-info">
          <h3 class="res-title">可预约医生数</h3>
          <!-- 循环可预约医生数量 -->

          <div class="img-container">
            <img src="images/number_bg.png" class="number-bg "><i class="num" id="doctorNum"></i>
          </div>

        </div>
        <div class="num-info">
          <h3 class="res-title">累计服务人数</h3>
          <!-- 累计服务人数 -->

          <div class="img-container">
            <img src="images/number_bg.png" class="number-bg "><i class="num" id="userNum"></i>
          </div>

        </div>
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

<script src="js/uni_login_wrapper.js"></script>

<script src="js/jquery.SuperSlide.2.1.1.js"></script>

<script type="text/javascript">
    jQuery(".slideBox").slide({ mainCell: ".bd ul", autoPlay: true});

    jQuery(".slideBox2").slide({ mainCell: ".bd ul", vis: 4, scroll: 4, effect: "left", autoPlay: false ,pnLoop:false});




</script>
</body>
</html>
