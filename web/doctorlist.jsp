<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
</head>
<link href="css/bootstrap.min.css" rel="stylesheet"/>
<link href="css/dashboard.css" rel="stylesheet"/>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand">Hospital</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-left">
					<li><a href="index.jsp">首页</a> </li>
					<li><a href="${pageContext.request.contextPath}/DoctorAction_list">医生列表</a></li>
					<li><a href="${pageContext.request.contextPath}/OrderAction_myOrder">我的预约</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">





					<li><a>当前用户：${sessionScope.user.user_name}</a></li>






				</ul>
				<div class="nav navbar-form navbar-right">
					<input type="text" id="search" class="form-control" style="width: 200px;height:35px;radio:10%" placeholder="Search...">
					<button class="btn radio btn-primary" onclick="search()" id="commitSearch">搜索</button>
				</div>
			</div>
		</div>
	</nav>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li class="active"><a href="#">科室列表</a></li>
				<li ><a href="${pageContext.request.contextPath}/DoctorAction_list">全部</a> </li>

					<c:forEach items="${keshiList}" var="keshi">
						<li ><a href="${pageContext.request.contextPath}/DoctorAction_listd?keshiId=${keshi.keshi_id}">${keshi.keshi_name}</a> </li>
					</c:forEach>

			</ul>
		</div>
		<c:if test="${!empty sessionScope.user}">
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h2 class="panel-title"><strong>医院医师列表</strong></h2>
					</div>
					<div class="panel-body" id="">
						<table class="table table-responsive" id="doctorList">
							<tbody id="box">
							<c:forEach items="${pageBean.doctorList}" var="doc">
								<tr>
									<td></td><td></td><td></td><td></td><td></td><td></td>
									<td><img src="${doc.image}" alt="" class="img-rounded img-responsive" width="100" height="100"></img></td>
									<td class=""><br>
										<p>${doc.leixing}</p>
										<p>姓名：${doc.doctor_name}</p>
										<p>擅长：${doc.shanchang}</p>
									</td>
									<td></td><td></td><td></td><td></td>
									<td><br><br><a href="OrderAction_orderSave?doctor_id=${doc.id}" class="btn btn-primary">一键预约</a></td>
								</tr>
							</c:forEach>
							</tbody>

						</table>
						<div style="width: 380px; margin: 0 auto; margin-top: 50px;" id="page">
							<ul class="pagination" style="text-align: center; margin-top: 10px;">

								<c:if test="${pageBean.currentPage==1 }">
									<li class="disabled">
										<a href="javascript:void(0);" aria-label="Previous">
											<span aria-hidden="true">上一页</span>
										</a>
									</li>
								</c:if>
								<c:if test="${pageBean.currentPage!=1 }">
									<li>
										<a href="${pageContext.request.contextPath }/DoctorAction_list?currentPage=${pageBean.currentPage-1}" aria-label="Previous">
											<span aria-hidden="true">上一页</span>
										</a>
									</li>
								</c:if>




								<%--<c:forEach begin="1" end="${pageBean.totalPage }" var="page">
									<!-- 判断当前页 -->
									<c:if test="${pageBean.currentPage==page }">
										<li class="active"><a href="javascript:void(0);">${page}</a></li>
									</c:if>
									<c:if test="${pageBean.currentPage!=page }">
										<li><a href="${pageContext.request.contextPath }/DoctorAction_list?currentPage=${page}">${page}</a></li>
									</c:if>

								</c:forEach>--%>

								<!-- 判断当前页是否是最后一页 -->
								<c:if test="${pageBean.currentPage==pageBean.totalPage }">
									<li class="disabled">
										<a href="javascript:void(0);" aria-label="Next">
											<span aria-hidden="true">下一页</span>
										</a>
									</li>
								</c:if>
								<c:if test="${pageBean.currentPage!=pageBean.totalPage }">
									<li>
										<a href="${pageContext.request.contextPath }/DoctorAction_list?currentPage=${pageBean.currentPage+1}" aria-label="Next">
											<span aria-hidden="true">下一页</span>
										</a>
									</li>
								</c:if>

							</ul>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${empty sessionScope.user}">
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h2 class="panel-title"><strong>预约前请先<a href="login.jsp" style="color: red">登录</a> </strong></h2>
					</div>

				</div>
			</div>
		</c:if>
	</div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function search() {
		var data={doctor_name:$("#search").val()};
		$.ajax({
			url:'DoctorAction_findByName',
			data:data,
			dataType:'json',
			type:'post',
			success:function (data) {
				var doctorList=eval(data);
				var html='';
				for (var i=0;i<doctorList.length;i++){
				    var doc=doctorList[i];
				    html+='<tr> <td></td><td></td><td></td><td></td><td></td><td></td>'
                        +'<td><img src="'+doc.image+'" alt="" class="img-rounded img-responsive" width="100" height="100"></img></td>'
                        +'<td class=""><br>'
                        +'<p>'+doc.leixing+'</p>'
                        +'<p>姓名：'+doc.doctor_name+'</p>'
						+'<p>擅长：'+doc.shanchang+'</p>'
                    	+'</td>'
                    	+'<td></td><td></td><td></td><td></td>'
                    	+'<td><br><br><a href="OrderAction_orderSave?doctor_id='+doc.id+'" class="btn btn-primary">一键预约</a></td>'
                        +'</tr>'
				}
                $("#box").remove();
                $("#page").remove();
				$("#doctorList").append(html);
            }
		});
    }
</script>
</body>
</html>
