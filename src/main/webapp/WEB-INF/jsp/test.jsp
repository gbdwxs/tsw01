<%--
  Created by IntelliJ IDEA.
  User: liuzhikang
  Date: 2023/4/29
  Time: 17:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>批量添加</title>
    <script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
</head>
<body>
    时间：<input id="time" type="date"/>
    金额：<input id="amt"/>
    备注：<input id="remark"/>
    <input id="add" onclick="add()" type="button" value="新增"/>
    <script type="text/javascript">
        var add = function(){
            $.ajax({
                url: "add.do",
                type: "GET",
                dataType: "json",
                contentType: "application/json;charset=utf-8",
                data: {
                    time: $("#time").val(),
                    amt: $("#amt").val(),
                    remark: $("#remark").val(),
                    itemType: ''
                },
                success: function () {
                    $("#amt").val('');
                    $("#remark").val('');
                }
            });
        }

    </script>
</body>
</html>
