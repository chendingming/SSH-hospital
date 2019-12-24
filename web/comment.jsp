<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/13 0013
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>医生评价</title>
</head>
<link href="css/bootstrap.min.css" rel="stylesheet">
<body>
    <div class="form-group">
        <textarea name="body" id="body" cols="30" rows="5" class="form-control" placeholder="在此填写评价内容"></textarea>
    </div>
    <div>
        <button type="button" onclick="commit()" class="btn btn-primary">提交</button>
    </div>
</body>
<script src="js/jquery.min.js"></script>
<script src="admin/lib/layer/2.4/layer.js"></script>
<script src="js/layershow.js"></script>
<script>
    function commit() {
        var doctor_id=<%=request.getParameter("doctor_id")%>;
        var body=document.getElementById("body").value;
        $.ajax({
           url:"CommentAction_add",
            data:{body:body,doctor_id:doctor_id},
            dataType:"text",
            method:"post",
            async:false,
            success:function (result) {
                layer.msg('评价成功!',{icon:1,time:1000});
            }
        });
        layer_close();
    }
</script>
</html>
