<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户注册</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/Layout.css" rel="stylesheet"> 
    <script type="text/javascript">
    	function checkpassword(){
    		var ps1=document.getElementById("rpassword");
    		var ps2=document.getElementById("repassword");		
    	 	if(ps1.value != ps2.value){
    			alert("两次输入的密码不一致，请重新输入！");
    		}
    	}
    	function checkUser(id,infor){
    		var uValue=document.getElementById(id).value;
    		if(uValue==""){
    			document.getElementById(id+"span").innerHTML="<font color='red'>"+infor+"</font>";
    		}
    		else{
    			document.getElementById(id+"span").innerHTML="";
    		}
    	}
    	function returnlogin(){
            window.location.href="login.jsp";
        }
    </script>
    <style>
		.body{
				background: url("/images/back3.jpg");
				height:100%;
				width:100%;
				overflow: hidden;
				background-size:cover;
			}
	</style>
</head>
<body class="body">
<br><br><br><br><br><br>
	<div id="loginF" align="center">
	<form class="form-signin" action="${pageContext.request.contextPath}/UserAction_add" method="post" onsubmit="return checkpassword()">
	    <div><h3 class="form-signin-heading">注册</h3></div>
	    <div>
	        <div>
				<lable for="user_name" class="sr-only">请输入您所要用的用户名</lable>
				<input type="text" name="user_name" id="user_name" class="form-control" placeholder="注册的用户名" onblur="checkUser('user_name','用户名不能为空')"/><span id="user_namespan"></span>
			</div><br>

			<div>
				<lable for="rpassword" class="sr-only">请输入您所要用的密码</lable>
				<input type="password" name="user_pw" id="rpassword" class="form-control" placeholder="注册的密码" />

			</div><br>

			<div>

				<lable for="repassword" class="sr-only">确认密码</lable>
				<input type="password" name="repassword" id="repassword" class="form-control" placeholder="确认密码" />

			</div><br>

			<div>
				<lable for="realname" class="sr-only">真实姓名</lable>
				<input type="text" name="user_realname" id="realname" class="form-control" placeholder="真实姓名" />

			</div><br>

			<div>
				<lable for="user_address" class="sr-only">地址</lable>
				<input type="text" name="user_address" id="user_address" class="form-control" placeholder="地址" />

			</div><br>

			<div>
				<lable for="user_tel" class="sr-only">联系电话</lable>
				<input type="text" name="user_tel" id="user_tel" class="form-control" placeholder="联系电话" />

			</div><br>

			<div>
				<lable for="user_email" class="sr-only">邮箱</lable>
				<input type="text" name="user_email" id="user_email" class="form-control" placeholder="邮箱" />

			</div><br>



			<table>
	            
	            <tr>
	                <td><button type="submit" id="register" name="register" class="btn btn-lg btn-primary btn-block">注册</button></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><button type="button" onclick="returnlogin()" class="btn btn-lg btn-primary btn-block">返回</button></td>
	            </tr>
	        </table>
	    </div>


   </form>
</div>
</body>
</html>