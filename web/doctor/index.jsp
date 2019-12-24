<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/4 0004
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Home</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <!-- Google fonts - Popppins for copy-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,800">
    <!-- orion icons-->
    <link rel="stylesheet" href="css/orionicons.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/favicon.png?3">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>
<body>
<!-- navbar-->
<header class="header">
    <nav class="navbar navbar-expand-lg px-4 py-2 bg-white shadow"><a href="#" class="sidebar-toggler text-gray-500 mr-4 mr-lg-5 lead"><i class="fas fa-align-left"></i></a><a href="index.html" class="navbar-brand font-weight-bold text-uppercase text-base">Bubbly Dashboard</a>
        <ul class="ml-auto d-flex align-items-center list-unstyled mb-0">
            <li class="nav-item">
                <form id="searchForm" class="ml-auto d-none d-lg-block">
                    <div class="form-group position-relative mb-0">
                        <button type="submit" style="top: -3px; left: 0;" class="position-absolute bg-white border-0 p-0"><i class="o-search-magnify-1 text-gray text-lg"></i></button>
                        <input type="search" placeholder="Search ..." class="form-control form-control-sm border-0 no-shadow pl-4">
                    </div>
                </form>
            </li>
            <li class="nav-item dropdown mr-3"><a id="notifications" href="http://example.com" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle text-gray-400 px-1"><i class="fa fa-bell"></i><span class="notification-icon"></span></a>
                <div aria-labelledby="notifications" class="dropdown-menu"><a href="#" class="dropdown-item">
                    <div class="d-flex align-items-center">
                        <div class="icon icon-sm bg-violet text-white"><i class="fab fa-twitter"></i></div>
                        <div class="text ml-2">
                            <p class="mb-0">You have 2 followers</p>
                        </div>
                    </div></a><a href="#" class="dropdown-item">
                    <div class="d-flex align-items-center">
                        <div class="icon icon-sm bg-green text-white"><i class="fas fa-envelope"></i></div>
                        <div class="text ml-2">
                            <p class="mb-0">You have 6 new messages</p>
                        </div>
                    </div></a><a href="#" class="dropdown-item">
                    <div class="d-flex align-items-center">
                        <div class="icon icon-sm bg-blue text-white"><i class="fas fa-upload"></i></div>
                        <div class="text ml-2">
                            <p class="mb-0">Server rebooted</p>
                        </div>
                    </div></a><a href="#" class="dropdown-item">
                    <div class="d-flex align-items-center">
                        <div class="icon icon-sm bg-violet text-white"><i class="fab fa-twitter"></i></div>
                        <div class="text ml-2">
                            <p class="mb-0">You have 2 followers</p>
                        </div>
                    </div></a>
                    <div class="dropdown-divider"></div><a href="#" class="dropdown-item text-center"><small class="font-weight-bold headings-font-family text-uppercase">View all notifications</small></a>
                </div>
            </li>
            <li class="nav-item dropdown ml-auto"><a id="userInfo" href="http://example.com" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle"><img src="${doctor.image}" alt="Jason Doe" style="max-width: 2.5rem;" class="img-fluid rounded-circle shadow"></a>
                <div aria-labelledby="userInfo" class="dropdown-menu"><a href="#" class="dropdown-item"><small>姓名</small><strong class="d-block text-uppercase headings-font-family">${doctor.doctor_name}</strong></a>
                    <div class="dropdown-divider"></div><a href="DoctorAction_logout" class="dropdown-item">Logout</a>
                </div>
            </li>
        </ul>
    </nav>
</header>
<div class="d-flex align-items-stretch">
    <div id="sidebar" class="sidebar py-3">
        <div class="text-gray-400 text-uppercase px-3 px-lg-4 py-4 font-weight-bold small headings-font-family">MAIN</div>
        <ul class="sidebar-menu list-unstyled">
            <li class="sidebar-list-item"><a href="index.jsp" class="sidebar-link text-muted active"><i class="o-home-1 mr-3 text-gray"></i><span>Home</span></a></li>
            <li class="sidebar-list-item"><a href="OrderAction_getByDoctor" class="sidebar-link text-muted"><i class="o-sales-up-1 mr-3 text-gray"></i><span>总预约</span></a></li>
            <li class="sidebar-list-item"><a href="OrderAction_doctorGetByDay" class="sidebar-link text-muted"><i class="o-table-content-1 mr-3 text-gray"></i><span>今日预约病人名单</span></a></li>
            <li class="sidebar-list-item"><a href="CommentAction_commentList" class="sidebar-link text-muted"><i class="o-table-content-1 mr-3 text-gray"></i><span>用户评论表</span></a></li>
            <li class="sidebar-list-item"><a href="changePw.jsp" class="sidebar-link text-muted"><i class="o-survey-1 mr-3 text-gray"></i><span>修改密码</span></a></li>
        </ul>
    </div>
    <div class="page-holder w-100 d-flex flex-wrap">
        <div class="container-fluid px-xl-5">
            <section class="py-5">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="bg-white shadow roundy px-4 py-3 d-flex align-items-center justify-content-between mb-4">
                            <div class="flex-grow-1 d-flex align-items-center">
                                <div class="dot mr-3 bg-violet"></div>
                                <div class="text">
                                    <h6 class="mb-0">评论</h6><span class="text-gray" id="commentCount"></span>
                                </div>
                            </div>
                            <div class="icon bg-violet text-white"><i class="fas fa-clipboard-check"></i></div>
                        </div>
                        <div class="bg-white shadow roundy px-4 py-3 d-flex align-items-center justify-content-between mb-4">
                            <div class="flex-grow-1 d-flex align-items-center">
                                <div class="dot mr-3 bg-green"></div>
                                <div class="text">
                                    <h6 class="mb-0">New Quotes</h6><span class="text-gray">214 new quotes</span>
                                </div>
                            </div>
                            <div class="icon bg-green text-white"><i class="fas fa-dollar-sign"></i></div>
                        </div>
                        <div class="bg-white shadow roundy px-4 py-3 d-flex align-items-center justify-content-between mb-4">
                            <div class="flex-grow-1 d-flex align-items-center">
                                <div class="dot mr-3 bg-blue"></div>
                                <div class="text">
                                    <h6 class="mb-0">今日病人数</h6><span class="text-gray" id="tadayOrderCount"></span>
                                </div>
                            </div>
                            <div class="icon bg-blue text-white"><i class="fas fa-user-friends"></i></div>
                        </div>
                        <div class="card px-5 py-4">
                            <h2 class="mb-0 d-flex align-items-center"><span>86.4</span><span class="dot bg-red d-inline-block ml-3"></span></h2><span class="text-muted">Server time</span>
                            <div class="chart-holder">
                                <canvas id="lineChart3" style="max-height: 7rem !important;" class="w-100">      </canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <footer class="footer bg-white shadow align-self-end py-3 px-xl-5 w-100">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6 text-center text-md-left text-primary">
                        <p class="mb-2 mb-md-0"></p>
                    </div>
                    <div class="col-md-6 text-center text-md-right text-gray-400">
                        <p class="mb-0">Copyright &copy; 2019.Company name All rights reserved.More Templates </p>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>
<!-- JavaScript files-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/popper.js/umd/popper.min.js"> </script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
<script src="vendor/chart.js/Chart.min.js"></script>
<script src="js/js.cookie.min.js"></script>
<script src="js/charts-home.js"></script>
<script src="js/front.js"></script>
<script>
    $(function () {
        $.ajax({
            url:'OrderAction_getTadayCount',
            type:'get',
            success:function (data) {
                var html=data+'  位病人待就诊';
                $("#tadayOrderCount").append(html);
            }
        });
        $.ajax({
            url:'CommentAction_getCount',
            type:'get',
            success:function (data) {
                var html=data+'  条评论';
                $("#commentCount").append(html);
            }
        })
    })
</script>
</body>
</html>