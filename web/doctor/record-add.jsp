<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/14 0014
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>填写病例</title>
</head>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<body>
<form id="myForm">
    <div class="form-group" style="display: none">
        <input type="text" class="form-control" name="order_id" value="<%=request.getParameter("order_id")%>">
    </div>
    <div class="form-group">
        诊断：<br>
        <textarea class="form-control" name="body" cols="30" rows="5"></textarea>
    </div>
    <div class="form-group">
        开药：<br>
        <textarea class="form-control" name="medical" cols="30" rows="5"></textarea>
    </div>
    <div class="form-group">
        <button type="button" onclick="commit()" class="btn btn-primary form-control">提交</button>
    </div>
</form>

</body>
<script src="../js/jquery.min.js"></script>
<script src="../admin/lib/layer/2.4/layer.js"></script>
<script src="../js/layershow.js"></script>
<script>
    function commit() {
        /*var doctor_id=<%--<%=request.getParameter("doctor_id")%>--%>;
        var body=document.getElementById("body").value;*/
        $.ajax({
            url:"RecordAction_add",
            data:$("#myForm").serialize(),
            dataType:"text",
            method:"post",
            async:false,
            success:function (result) {
                layer.msg('success!',{icon:1,time:1000});
            }
        });

        layer_close();
    }
</script>
</html>
