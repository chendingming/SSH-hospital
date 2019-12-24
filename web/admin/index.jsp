<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/23 0023
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta charset="utf-8">
    <link rel="Bookmark" href="../admin/favicon.ico">
    <link rel="Shortcut Icon" href="../admin/favicon.ico" />
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
    <title>Hospital.admin v3.1</title>
    <style type="text/css">
        a {
            cursor: default;
        }
    </style>

</head>

<body>
<header class="navbar-wrapper">
    <div class="navbar navbar-fixed-top">
        <div class="container-fluid cl">
            <a class="logo navbar-logo f-l mr-10 hidden-xs" href="#>Hospital.Admin</a>
					<a class="logo navbar-logo-m f-l mr-10 visible-xs" href="#">Hospital</a>
            <span class="logo navbar-slogan f-l mr-10 hidden-xs">v3.1</span>
            <a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
            <nav class="nav navbar-nav">
                <ul class="cl">
                    <li class="dropDown dropDown_hover">
                        <a href="javascript:;" class="dropDown_A"><i class="Hui-iconfont">&#xe600;</i> 新增 <i class="Hui-iconfont">&#xe6d5;</i></a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li>
                                <a href="javascript:;" onclick="article_add('添加公告','article-add.html')"><i class="Hui-iconfont">&#xe616;</i> 公告</a>
                            </li>
                            <li>
                                <a href="javascript:;" onclick="member_add('管理员','member-add.html','','510')"><i class="Hui-iconfont">&#xe62d;</i> 管理员</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
                <ul class="cl">
                    <li>管理员</li>
                    <li class="dropDown dropDown_hover">
                        <a href="#" class="dropDown_A">${sessionScope.admin.userName} <i class="Hui-iconfont">&#xe6d5;</i></a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li>
                                <a href="javascript:;" onClick="myselfinfo()">个人信息</a>
                            </li>
                            <li>
                                <a href="AdminAction_logout">退出</a>
                            </li>
                        </ul>
                    </li>
                    <li id="Hui-msg">
                        <a href="#" title="消息"><span class="badge badge-danger">1</span><i class="Hui-iconfont" style="font-size:18px">&#xe68a;</i></a>
                    </li>
                    <li id="Hui-skin" class="dropDown right dropDown_hover">
                        <a href="javascript:;" class="dropDown_A" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li>
                                <a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a>
                            </li>
                            <li>
                                <a href="javascript:;" data-val="blue" title="蓝色">蓝色</a>
                            </li>
                            <li>
                                <a href="javascript:;" data-val="green" title="绿色">绿色</a>
                            </li>
                            <li>
                                <a href="javascript:;" data-val="red" title="红色">红色</a>
                            </li>
                            <li>
                                <a href="javascript:;" data-val="yellow" title="黄色">黄色</a>
                            </li>
                            <li>
                                <a href="javascript:;" data-val="orange" title="橙色">橙色</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</header>
<aside class="Hui-aside">
    <div class="menu_dropdown bk_2">
        <dl id="menu-article">
            <dt><i class="Hui-iconfont">&#xe616;</i> 公告管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <c:if test="${admin.role.id==1||admin.role.id==2}">
                        <li>
                            <a data-href="NoticeAction_adminGetList" data-title="公告管理" href="javascript:void(0)">公告管理</a>
                        </li>
                    </c:if>
                    <c:if test="${admin.role.id!=1&&admin.role.id!=2}">
                        <li>
                            <button class="btn btn-danger" onclick="noJurisdiction()">没有该权限</button>
                        </li>
                    </c:if>

                </ul>
            </dd>
        </dl>
        <dl id="menu-comments">
            <dt><i class="Hui-iconfont">&#xe622;</i> 评论管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <c:if test="${admin.role.id==1}">
                        <li>
                            <a data-href="CommentAction_getAllCom" data-title="评论列表" href="javascript:;">评论列表</a>
                        </li>
                    </c:if>
                    <c:if test="${admin.role.id==3}">
                        <li>
                            <a data-href="CommentAction_getAllCom" data-title="评论列表" href="javascript:;">评论列表</a>
                        </li>
                    </c:if>
                    <c:if test="${admin.role.id!=1&&admin.role.id!=3}">
                        <li>
                            <button class="btn btn-danger" onclick="noJurisdiction()">没有该权限</button>
                        </li>
                    </c:if>
                </ul>
            </dd>
        </dl>
        <dl id="menu-member">
            <dt><i class="Hui-iconfont">&#xe60d;</i> 医生管理管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <c:if test="${admin.role.id==1||admin.role.id==4}">
                        <li>
                            <a data-href="DoctorAction_adminGetDoctorList" data-title="医生列表" href="javascript:;">医生列表</a>
                        </li>
                    </c:if>
                    <c:if test="${admin.role.id!=1&&admin.role.id!=4}">
                        <li>
                            <button class="btn btn-danger" onclick="noJurisdiction()">没有该权限</button>
                        </li>
                    </c:if>

                </ul>
            </dd>
        </dl>
        <dl id="menu-kehsi">
            <dt><i class="Hui-iconfont">&#xe62d;</i> 科室管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <c:if test="${admin.role.id==1}">
                        <li>
                            <a data-href="KeshiAction_adminGetInfo" data-title="科室列表" href="javascript:void(0)">科室列表</a>
                        </li>
                    </c:if>
                    <c:if test="${admin.role.id!=1}">
                        <li><button class="btn btn-danger" onclick="noJurisdiction()">没有该权限</button></li>
                    </c:if>
                </ul>
            </dd>
        </dl>
        <dl id="menu-admin">
            <dt><i class="Hui-iconfont">&#xe62d;</i> 管理员管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <c:if test="${admin.role.id==1}">
                        <li>
                            <a data-href="RoleAction_list" data-title="角色管理" href="javascript:void(0)">角色管理</a>
                        </li>
                        <li>
                            <a data-href="AdminAction_list" data-title="管理员列表" href="javascript:void(0)">管理员列表</a>
                        </li>
                    </c:if>
                    <c:if test="${admin.role.id!=1}">
                        <li><button class="btn btn-danger" onclick="noJurisdiction()">没有该权限</button></li>
                    </c:if>
                </ul>
            </dd>
        </dl>
        <dl id="menu-tongji">
            <dt><i class="Hui-iconfont">&#xe61a;</i> 系统统计<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li>
                        <a data-href="annual.jsp" data-title="折线图" href="javascript:void(0)">折线图</a>
                    </li>

                </ul>
            </dd>
        </dl>
        <dl id="menu-system">
            <dt><i class="Hui-iconfont">&#xe62e;</i> 系统管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li>
                        <a data-href="change-password.jsp" data-title="修改密码" href="javascript:void(0)">修改密码</a>
                    </li>
                </ul>
            </dd>
        </dl>
    </div>
</aside>
<div class="dislpayArrow hidden-xs">
    <a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a>
</div>
<section class="Hui-article-box">
    <div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
        <div class="Hui-tabNav-wp">
            <ul id="min_title_list" class="acrossTab cl">
                <li class="active">
                    <span title="我的桌面" data-href="welcome.jsp">我的桌面</span>
                    <em></em>
                </li>
            </ul>
        </div>
        <div class="Hui-tabNav-more btn-group">
            <a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a>
            <a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a>
        </div>
    </div>
    <div id="iframe_box" class="Hui-article">
        <div class="show_iframe">
            <div style="display:none" class="loading"></div>
            <iframe scrolling="yes" frameborder="0" src="welcome.jsp"></iframe>
        </div>
    </div>
</section>

<div class="contextMenu" id="Huiadminmenu">
    <ul>
        <li id="closethis">关闭当前 </li>
        <li id="closeall">关闭全部 </li>
    </ul>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
<script type="text/javascript">
    $(function() {
        /*$("#min_title_list li").contextMenu('Huiadminmenu', {
         bindings: {
         'closethis': function(t) {
         console.log(t);
         if(t.find("i")){
         t.find("i").trigger("click");
         }
         },
         'closeall': function(t) {
         alert('Trigger was '+t.id+'\nAction was Email');
         },
         }
         });*/
    });
    /*个人信息*/
    function myselfinfo() {
        layer.open({
            type: 1,
            area: ['300px', '200px'],
            fix: false, //不固定
            maxmin: true,
            shade: 0.4,
            title: '查看信息',
            content: '<div>账户 : ${sessionScope.admin.userName}</div><div>密码 : ${sessionScope.admin.userPw}</div>'
        });
    }

    /*资讯-添加*/
    function article_add(title, url) {
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    /*用户-添加*/
    function member_add(title, url, w, h) {
        layer_show(title, url, w, h);
    }

    function noJurisdiction(){
        alert('您没有该权限!');
    }
</script>

</body>

</html>
