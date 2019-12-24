<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/29 0029
  Time: 16:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
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
    <title>医生管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 医生中心 <span class="c-gray en">&gt;</span> 医生管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"> <a href="javascript:;" onclick="doctor_add('添加医生','doctor-add.jsp','','510')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加医生</a></span>  </div>
    <div class="mt-20">
        <table class="table table-border table-bordered table-hover table-bg table-sort">
            <thead>
            <tr class="text-c">
                <th width="25"></th>
                <th width="80">证件照</th>
                <th width="80">医生编号</th>
                <th width="80">姓名</th>
                <th width="40">性别</th>
                <th width="150">年龄</th>
                <th width="">擅长</th>
                <th width="80">科室</th>
                <th width="130">类型</th>
                <th width="70">状态</th>
                <th width="100">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${doctorlist}" var="doc">
                <tr class="text-c">
                    <td><input type="checkbox" value="1" name=""></td>
                    <td><img src="${doc.image}" width="60" height="60"></td>
                    <td>${doc.id}</td>
                    <td><u style="cursor:pointer" class="text-primary" onclick="member_show('${doc.doctor_name}','member-show.html','${doc.id}','360','400')">${doc.doctor_name}</u></td>
                    <td>${doc.doctor_sex}</td>
                    <td>${doc.doctor_age}</td>
                    <td class="text-l">${doc.shanchang}</td>
                    <td>${doc.keshi.keshi_name}</td>
                    <td>${doc.leixing}</td>
                    <c:if test="${doc.doctor_del==0}">
                        <td class="td-status"><span class="label label-success radius">已启用</span></td>
                        <td class="td-manage"><a style="text-decoration:none" onClick="doctor_stop(this,${doc.id})" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>
                            <a title="编辑" href="javascript:;" onclick="doctor_edit('编辑','DoctorAction_goToEditPage?id=${doc.id}','4','','510')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
                            <a title="删除" href="javascript:;" onclick="doctor_del(this,${doc.id})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
                        </td>
                    </c:if>
                    <c:if test="${doc.doctor_del==1}">
                        <td class="td-status"><span class="label label-danger radius">已停用</span></td>
                        <td class="td-manage"><a style="text-decoration:none" onClick="doctor_start(this,${doc.id})" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe6ff;</i></a>
                            <a title="编辑" href="javascript:;" onclick="doctor_edit('编辑','DoctorAction_goToEditPage?id=${doc.id}','4','','510')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
                            <a title="删除" href="javascript:;" onclick="doctor_del(this,${doc.id})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
                        </td>
                    </c:if>

                </tr>
            </c:forEach>
            
            </tbody>
        </table>
    </div>
    <footer class="footer mt-20">
        <div class="container">
            <p>©2019 Hospital 使用前必读 意见反馈 京ICP证030173号  京公网安备11000002000001号 </p>
        </div>
    </footer>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
    $(function(){
        $('.table-sort').dataTable({
            "aaSorting": [[ 1, "desc" ]],//默认第几个排序
            "bStateSave": true,//状态保存
            "aoColumnDefs": [
                //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                {"orderable":false,"aTargets":[0,10,9]}// 制定列不参与排序
            ]
        });

    });
    /*医生-添加*/
    function doctor_add(title,url,w,h){
        layer_show(title,url,w,h);
    }
    /*医生-查看*/
    function doctor_show(title,url,id,w,h){
        layer_show(title,url,w,h);
    }

    /*医生-停用*/
    function doctor_stop(obj,id){
           layer.confirm('确认要停用吗？',function(index){
        $.ajax({
            type: 'POST',
            url: 'DoctorAction_stop',
            dataType: 'text',
            data:{doctor_id:id},
            success: function(data){
                $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a>');
                $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
                $(obj).remove();
                layer.msg('已停用!',{icon: 5,time:1000});
            },
            error:function(data) {
                layer.msg('失败!',{icon: 5,time:1000});
            },
        });
    });
    }

    /*医生-启用*/
    function doctor_start(obj,id){
        layer.confirm('确认要启用吗？',function(index){
            $.ajax({
                type: 'POST',
                url: 'DoctorAction_start',
                dataType: 'text',
                data:{doctor_id:id},
                success: function(data){
                    $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
                    $(obj).remove();
                    layer.msg('已启用!',{icon: 6,time:1000});
                },
                error:function(data) {
                    layer.msg('失败!',{icon: 6,time:1000});
                },
            });
        });
    }
    /*医生-编辑*/
    function doctor_edit(title,url,id,w,h){
        layer_show(title,url,w,h);
    }
    /*密码-修改*/
    function change_password(title,url,id,w,h){
        layer_show(title,url,w,h);
    }
    /*用户-删除*/
    function doctor_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            $.ajax({
                type: 'POST',
                url: 'DoctorAction_delete',
                dataType: 'text',
                data:{doctor_id:id},
                success: function(data){
                    $(obj).parents("tr").remove();
                    layer.msg('已删除!',{icon:1,time:1000});
                },
                error:function(data) {
                    layer.msg('删除失败!',{icon:1,time:1000});
                },
            });
        });
    }
</script>
</body>
</html>
