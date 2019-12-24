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
                    <div class="float-left"><a href="#doctor_evaluate">就诊评价</a></div>
                </div>
                <div class="tab_con">
                    <div id="doctor_index" class="doctor_pane active">
                        <table border="0" cellspacing="0" cellpadding="0" class="doctor_table" width="1200">
                            <tr>
                                <td class="tb_header">时间地点</td>
                                <td colspan="9"><div>福建省立医院</div></td>
                            </tr>
                            <tr>
                                <td class="tb_header">时段</td>
                                <td rowspan="4" class="arrow_left"><div><img src="images/left.png"></div></td>
                                <td rowspan="4" class="arrow_right right_active"><div><img src="images/right_active.png"></div></td>
                            </tr>
                            <tr>
                                <td class="tb_header">上午</td>
                            </tr>
                            <tr>
                                <td class="tb_header">下午</td>
                            </tr>
                            <tr>
                                <td class="tb_header">夜诊</td>
                            </tr>
                        </table>
                    </div>
                    <div id="doctor_evaluate" class="doctor_pane">

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
<script>
    $(function() {
        var d = 7;//需要显示的预约天数
        //获取几天后（前）的日期以及周几
        var x,y;
        function fun_date(aa) {

            var date1 = new Date(),
                time1 = date1.getFullYear() + "-" + (date1.getMonth() + 1) + "-" + date1.getDate(); //time1表示当前时间
            var date2 = new Date(date1);
            date2.setDate(date1.getDate()+1 + aa);
            var time2 = date2.getFullYear()+"-"+(date2.getMonth() + 1) + "-" + date2.getDate();
            var w = "";
            switch(date2.getDay()) {
                case 0:
                    w = "周日"
                    break;
                case 1:
                    w = "周一"
                    break;
                case 2:
                    w = "周二"
                    break;
                case 3:
                    w = "周三"
                    break;
                case 4:
                    w = "周四"
                    break;
                case 5:
                    w = "周五"
                    break;
                case 6:
                    w = "周六"
                    break;
                default:
                    w = ""
            }
            var dd = {};
            dd.day = time2;
            dd.week = w
            return dd;
        }
        var doctor_order = '<td rowspan="4" class="doctor_order"><table border="0"><tr>';
        for(var i = 0; i < d; i++) {
            if(i == 0) {
                doctor_order += '<td><div class="time">' + fun_date(i).day + '</div><div class="week">明天</div></td>'
            }
            else {
                doctor_order += '<td><div class="time">' + fun_date(i).day + '</div><div class="week">' + fun_date(i).week + '</div></td>'
            }

        }
        for(var i = 0; i < d; i++){
            if(fun_date(i).week=="周六"){
                x=i;
            }
            else if(fun_date(i).week=="周日"){
                y=i;
            }
        }


        function getQueryString(key){
            var reg = new RegExp("(^|&)"+key+"=([^&]*)(&|$)");
            var result = window.location.search.substr(1).match(reg);
            return result?decodeURIComponent(result[2]):null;
        }



        doctor_order+='</tr>';

        var doctor_name="${doctor.doctor_name}";
        var doctor_id="${doctor.id}";

        var mon1="上午";
        var mon2="下午";
        var mon3="晚上";
        if(y!=0){
            for (var j = 0;j<3;j++) {
                doctor_order+="<tr>";
                if(j==0){
                    for (var k = 0;k<x;k++) {
                        doctor_order += "<td><a href='OrderAction_goToSelectTime?date="+fun_date(k).day+"&mon="+mon1+"&doctor_name="+doctor_name+"&doctor_id="+doctor_id+"' class='btn-primary btn'>一键预约</a></td>";
                    }
                    for(var k=x;k<y+1;k++){
                        doctor_order += "<td></td>";
                    }
                    for(var k=y+1;k<d;k++){
                        doctor_order += "<td><a href='OrderAction_goToSelectTime?date="+fun_date(k).day+"&mon="+mon1+"&doctor_name="+doctor_name+"&doctor_id="+doctor_id+"' class='btn-primary btn'>一键预约</a></td>";
                    }
                }else if(j==1){
                    for (var k = 0;k<x;k++) {
                        doctor_order += "<td><a href='OrderAction_goToSelectTime?date="+fun_date(k).day+"&mon="+mon2+"&doctor_name="+doctor_name+"&doctor_id="+doctor_id+"' class='btn-primary btn'>一键预约</a></td>";
                    }
                    for(var k=x;k<y+1;k++){
                        doctor_order += "<td></td>";
                    }
                    for(var k=y+1;k<d;k++){
                        doctor_order += "<td><a href='OrderAction_goToSelectTime?date="+fun_date(k).day+"&mon="+mon2+"&doctor_name="+doctor_name+"&doctor_id="+doctor_id+"' class='btn-primary btn'>一键预约</a></td>";
                    }
                }else{
                    for (var k = 0;k<x;k++) {
                        doctor_order += "<td><a href='OrderAction_goToSelectTime?date="+fun_date(k).day+"&mon="+mon3+"&doctor_name="+doctor_name+"&doctor_id="+doctor_id+"' class='btn-primary btn'>一键预约</a></td>";
                    }
                    for(var k=x;k<y+1;k++){
                        doctor_order += "<td></td>";
                    }
                    for(var k=y+1;k<d;k++){
                        doctor_order += "<td><a href='OrderAction_goToSelectTime?date="+fun_date(k).day+"&mon="+mon3+"&doctor_name="+doctor_name+"&doctor_id="+doctor_id+"' class='btn-primary btn'>一键预约</a></td>";
                    }
                }
                doctor_order+="</tr>";
            }
        }
        else{
            for (var j = 0;j<3;j++) {
                doctor_order+="<tr>";
                if(j==0){
                    for (var k = 0;k<1;k++) {
                        doctor_order += "<td></td>";
                    }
                    for(var k=1;k<x;k++){
                        doctor_order += "<td><a href='OrderAction_goToSelectTime?date="+fun_date(k).day+"&mon="+mon1+"&doctor_name="+doctor_name+"&doctor_id="+doctor_id+"' class='btn-primary btn'>一键预约</a></td>";
                    }
                    for(var k=x;k<x+1;k++){
                        doctor_order += "<td></td>";
                    }
                }else if(j==1){
                    for (var k = 0;k<1;k++) {
                        doctor_order += "<td></td>";
                    }
                    for(var k=1;k<x;k++){
                        doctor_order += "<td><a href='OrderAction_goToSelectTime?date="+fun_date(k).day+"&mon="+mon1+"&doctor_name="+doctor_name+"&doctor_id="+doctor_id+"' class='btn-primary btn'>一键预约</a></td>";
                    }
                    for(var k=x;k<x+1;k++){
                        doctor_order += "<td></td>";
                    }
                }else{
                    for (var k = 0;k<1;k++) {
                        doctor_order += "<td></td>";
                    }
                    for(var k=1;k<x;k++){
                        doctor_order += "<td><a href='OrderAction_goToSelectTime?date="+fun_date(k).day+"&mon="+mon1+"&doctor_name="+doctor_name+"&doctor_id="+doctor_id+"' class='btn-primary btn'>一键预约</a></td>";
                    }
                    for(var k=x;k<x+1;k++){
                        doctor_order += "<td></td>";
                    }
                }
                doctor_order+="</tr>";
            }
        }

        doctor_order+='</table></td>';
        $(".arrow_left").after(doctor_order);
        $(".doctor_order>table").width(d*140);
        //选项卡
        $(".tab_hd div").click(function() {
            var _this = $(this);
            var i = _this.index();
            _this.addClass("active");
            _this.siblings().removeClass("active");
            $(".doctor_pane").eq(i).addClass("active");
            $(".doctor_pane").eq(i).siblings().removeClass("active");
        })
        //点击左右箭头
        //动画执行完为true
        var type = true;
        function change(c){
            var left = parseInt($(".doctor_order table").css("left"));
            console.log("位移是"+left);
            left = left + (-c*140);
            if(left >0 ){
                console.log("左边没有了")
                $(".arrow_left div img").attr("src","images/left.png");
                $(".arrow_left").removeClass("left_active");
            }else if(left< (d-7)*-140){
                console.log("右边没有了")
                $(".arrow_right div img").attr("src","images/right.png");
                $(".arrow_right").removeClass("right_active");
            }else{
                console.log("aaaaaaaaaaaaaaa")
                $(".arrow_left div img").attr("src","images/left_active.png");
                $(".arrow_right div img").attr("src","images/right_active.png");
                $(".arrow_left").addClass("left_active");
                $(".arrow_right").addClass("right_active");
                $(".doctor_order table").animate({left:left+"px"},1000);
                type = true;
                console.log(type)
            }
        }

        var time = 0;
        $(".arrow_left").click(function(){
            if (time == 0) {
                time = 1; //设定间隔时间（秒）
                //启动计时器，倒计时time秒后自动关闭计时器。
                var index = setInterval(function(){
                    time--;
                    if (time == 0) {
                        clearInterval(index);
                    }
                }, 1000);
                change(-1);
            }else{
                // alert('目前按钮事件不允许被触发');
            }


        })

        $(".arrow_right").click(function(){
            if (time == 0) {
                time = 1; //设定间隔时间（秒）
                //启动计时器，倒计时time秒后自动关闭计时器。
                var index = setInterval(function(){
                    time--;
                    if (time == 0) {
                        clearInterval(index);
                    }
                }, 1000);
                change(1);
            }else{
                // alert('目前按钮事件不允许被触发');
            }

        })
        $.ajax({
            url:'CommentAction_getByDoctorId',
            type:'get',
            dataType:'json',
            data:{doctor_id:${doctor.id}},
            success:function (result) {
                var commentList=eval(result);
                var html="";
                for (var i=0;i<commentList.length;i++){
                    var comment=commentList[i];
                    html+='<p>'+comment.body+'</p>'
                }
                $("#doctor_evaluate").append(html);
            }
        })
    })
</script>
</html>
