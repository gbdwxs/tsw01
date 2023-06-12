<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page
        contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
        isELIgnored="false" language="java" %>
<html>
<head>
    <title>新增账单</title>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
</head>
<body>
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>账单列表 —— 显示本次新增的账单</small>
                </h1>
            </div>
        </div>
    </div>
    <div class="row">
        时间：<input type="date" id="time"/>
        <script type="text/javascript">
            var date = new Date();
            var year = date.getFullYear();
            var month = date.getMonth() + 1;
            var day = date.getDate();
            if (month < 10) {
                month = "0" + month;
            }
            if (day < 10) {
                day = "0" + day;
            }
            $("#time").val(year + "-" + month + "-" + day);
        </script>
        金额：<input type="text" id="amt"/>
        描述：<input type="text" id="remark"/>
        细分类：
        <lable id="itemType" list="itemTypeList" for="itemTypeList"></lable>
        <select id="itemTypeList">
            <option value=0>请选择</option>
        </select>
        <script type="text/javascript">
            $.ajax({
                url: "queryItemType.do",
                type: "GET",
                dataType: "json",
                contentType: "application/json;charset=utf-8",
                data: {},
                success: function (result) {
                    var table = document.getElementById("itemTypeList");
                    for (var i = 0; i < result.itemTypeList.length; i++) {
                        table.innerHTML += "<option value=" + result.itemTypeList[i].code + ">"
                            + result.itemTypeList[i].name + "</option>";
                    }
                },
                error: function () {
                    console.log("查询失败！");
                }
            });
        </script>
        <input id="add" onclick="add()" type="button" value="新增" class="btn btn-primary"/>
        <script type="text/javascript">
            function add() {
                var time = $("#time").val();
                if (time == null || time.trim() == '') {
                    alert("请选择时间！");
                    return;
                }
                var amt = $("#amt").val();
                if (amt == null || amt.trim() == '') {
                    alert("请输入金额！");
                    return;
                }
                var remark = $("#remark").val();
                if (remark == null || remark.trim() == '') {
                    alert("请输入描述！");
                    return;
                }
                var itemType = $('#itemTypeList').find('option:selected').val();
                if (itemType == null || itemType.trim() == '') {
                    alert("请选择细分类！");
                    return;
                }
                if (isNaN(amt)) {
                    alert("输入的金额有误");
                    return;
                }
                $.ajax({
                    url: "add.do",
                    type: "GET",
                    dataType: "json",
                    contentType: "application/json;charset=utf-8",
                    data: {
                        time: time,
                        amt: amt,
                        remark: remark,
                        itemType: itemType
                    },
                    success: function () {
                        var table = document.getElementById("table");
                        table.innerHTML = "<tr><td align='center'>" + f2(time)
                            + "</td><td align='right'>" + f1(amt)
                            + "</td><td align='center' >" + remark
                            + "</td><td align='center' >" + $('#itemTypeList').find('option:selected').text()
                            + "</td></tr>" + table.innerHTML;
                    },
                    error: function () {
                        console.log("新增失败！");
                    }
                });
            };

            function f1(num) {
                var money = "" + num;
                money = money.split(".");
                var result = "";
                if (money.length == 2) {
                    if (money[1].length == 1) {
                        result += money[0].replace(/\B(?=(?:\d{3})+$)/g, ',');
                        result += ".";
                        result += money[1];
                        result += "0";
                    } else {
                        result += money[0].replace(/\B(?=(?:\d{3})+$)/g, ',');
                        result += ".";
                        result += money[1];
                    }
                } else {
                    result += money[0].replace(/\B(?=(?:\d{3})+$)/g, ',');
                    result += ".";
                    result += "00";
                }
                return result;
            };

            function f2(date) {
                if (date.length > 8) {
                    return date;
                } else {
                    var year = date.substr(0, 4);
                    var month = date.substr(4, 2);
                    var day = date.substr(6, 2);
                    return year + "-" + month + "-" + day;
                }
            };
        </script>
    </div>
</div>
<div class="row clearfix">
    <div class="col-md-12 column">
        <table class="table table-hover table-striped" id="table">
            <thead>
            <tr>
                <th style="text-align:center;">时间</th>
                <th style="text-align:center;">金额</th>
                <th style="text-align:center;">描述</th>
                <th style="text-align:center;">细分类</th>
            </tr>
            </thead>

            <tbody>
            </tbody>
        </table>
    </div>
</div>
</div>
</body>
</html>