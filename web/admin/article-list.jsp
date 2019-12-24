<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/5 0005
  Time: 16:46
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
    <script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
    <!--[if IE 6]>
    <script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <title>资讯列表</title>
</head>
<script>
    $(function () {

    })
</script>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 资讯管理 <span class="c-gray en">&gt;</span> 资讯列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <a class="btn btn-primary radius" data-title="添加资讯" data-href="article-add.jsp" onclick="Hui_admin_tab(this)" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加资讯</a></span> <span class="r">共有数据：<strong>54</strong> 条</span> </div>
<div class="mt-20">
    <table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
        <thead>
        <tr class="text-c">
            <th width="25"><input type="checkbox" name="" value=""></th>
            <th width="80">ID</th>
            <th>标题</th>
            <th width="120">更新时间</th>
            <th width="60">发布状态</th>
            <th width="120">操作</th>
        </tr>
        </thead>
        <tbody id="articleList">
            <c:forEach items="${articleList}" var="article">
                <tr class="text-c">
                    <td><input type="checkbox" value="" name=""></td>
                    <td>${article.id}</td>
                    <td class="text-l"><u style="cursor:pointer" class="text-primary" onClick="article_edit('查看','article-show.jsp?body=${article.neirong}','10001','400','300')" title="查看">${article.biaoti}</u></td>
                    <td>${article.time}</td>
                    <c:if test="${article.state==0}">
                        <td class="td-status"><span class="label label-success radius">已发布</span></td>
                        <td class="f-14 td-manage"><a style="text-decoration:none" onClick="article_stop(this,${article.id})" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a> <a style="text-decoration:none" class="ml-5" onClick="article_edit('资讯编辑','${pageContext.request.contextPath}/NoticeAction_adminToEditPage?id=${article.id}',${article.id})" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a> <a style="text-decoration:none" class="ml-5" onClick="article_del(this,${article.id})" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
                    </c:if>
                    <c:if test="${article.state==1}">
                        <td class="td-status"><span class="label label-defaunt radius">已下架</span></td>
                        <td class="f-14 td-manage"><a style="text-decoration:none" onClick="article_start(this,${article.id})" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a> <a style="text-decoration:none" class="ml-5" onClick="article_edit('资讯编辑','${pageContext.request.contextPath}/NoticeAction_adminToEditPage?id=${article.id}',${article.id})" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a> <a style="text-decoration:none" class="ml-5" onClick="article_del(this,${article.id})" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
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
                {"orderable":false,"aTargets":[0,5]}// 制定列不参与排序
            ]
        });

    });

    /*资讯-添加*/
    function article_add(title,url,w,h){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }
    /*资讯-编辑*/
    function article_edit(title,url,id,w,h){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }
    /*资讯-删除*/
    function article_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            $.ajax({
                type: 'POST',
                url: 'NoticeAction_delete',
                data:{id:id},
                dataType: 'text',
                success: function(data){
                    $(obj).parents("tr").remove();
                    layer.msg('已删除!',{icon:1,time:1000});
                },
                error:function(data) {
                    console.log(data.msg);
                },
            });
        });
    }

    /*资讯-下架*/
    function article_stop(obj,id){
        layer.confirm('确认要下架吗？',function(index){
            $.ajax({
               url:"NoticeAction_stop",
                dataType:"text",
                data:{id:id},
                method:"post",
                success:function (result) {
                   if(result>0){
                       $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="article_start(this,'+id+')" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a>');
                       $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已下架</span>');
                       $(obj).remove();
                       layer.msg('已下架!',{icon: 5,time:1000});
                   }else {
                       layer.msg('下架失败!',{icon: 5,time:1000});
                   }

                }
            });

        });
    }

    /*资讯-发布*/
    function article_start(obj,id){
        layer.confirm('确认要发布吗？',function(index){
            $.ajax({
               url:"NoticeAction_start",
                dataType:"text",
                data:{id:id},
                method:"post",
                success:function (result) {
                   if(result>0){
                       $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="article_stop(this,'+id+')" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>');
                       $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
                       $(obj).remove();
                       layer.msg('已发布!',{icon: 6,time:1000});
                   }else{
                       layer.msg('发布失败!',{icon: 6,time:1000});
                   }

                }
            });

        });
    }

</script>
</body>
</html>
