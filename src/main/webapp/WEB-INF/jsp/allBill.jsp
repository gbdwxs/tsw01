<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page
        contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
        isELIgnored="false" language="java" %>
<html>
<head>
    <title>账单列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                    <small>账单列表 —— 显示所有账单</small>
                </h1>
            </div>
        </div>
    </div>
    <div class="row">
        <div>
            开始时间
            <input type="date" id="startTime"/>
            结束时间
            <input type="date" id="endTime"/>
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
                // $("#startTime").val(year + "-" + month + "-01");
                $("#startTime").val("2015-03-01");
                // $("#endTime").val(year + "-" + month + "-" + day);
                $("#startTime").val("2015-12-31");
            </script>
        </div>
        <div align="right">
            <input id="pageSizeCopy" type="hidden"/>
            <script type="text/javascript">
                $("#pageSizeCopy").val(10);
            </script>
            每页显示
            <lable id="pageSize" style="width:60px;text-align:center" list="pageSizeList" for="pageSizeList"></lable>
            <select id="pageSizeList">
                <option value="10">10</option>
                <option value="20">20</option>
                <option value="50">50</option>
                <option value="100">100</option>
                <option value="200">200</option>
            </select>
            条 第
            <input id="page" style="width:40px;text-align:center;border:none" readonly="true"/>
            <script type="text/javascript">
                $("#page").val(1);
                document.getElementById("page").style.width = document.getElementById("page").value.length * 20 + 5;
            </script>
            页 / 共
            <input id="maxPage" style="width:40px;text-align:center;border:none" readonly="true"/>
            <script type="text/javascript">
                $("#maxPage").val(1);
                document.getElementById("maxPage").style.width = document.getElementById("maxPage").value.length * 25 + 5;
            </script>
            页
        </div>
    </div>
    <div class="row" align="right">
        <div align="right">
            <input id="before" onclick="before()" type="button" value="上一页"
                   class="btn btn-primary"/>
            <input id="next" onclick="next()" type="button" value="下一页"
                   class="btn btn-primary"/>
            <input id="query" onclick="query()" type="button" value="查询"
                   class="btn btn-primary"/>
            <a href="${pageContext.request.contextPath}/bill/addBill">
                <input id="add" type="button" value="新增" class="btn btn-primary"/>
            </a>
        </div>
    </div>
    <script type="text/javascript">
        function before() {
            var page = parseInt($("#page").val());
            var pageSize = $('#pageSizeList').find('option:selected').text();
            var pageSizeCopy = parseInt($("#pageSizeCopy").val());
            if (pageSize == pageSizeCopy) {
                if (page == 1) {
                    alert("当前已是第1页！")
                } else {
                    $("#page").val(page - 1);
                    query();
                }
            } else {
                $("#page").val(1);
                $("#pageSizeCopy").val(pageSize);
                query();
            }

        };

        function next() {
            var page = parseInt($("#page").val());
            var maxPage = parseInt($("#maxPage").val());
            var pageSize = $('#pageSizeList').find('option:selected').text();
            var pageSizeCopy = parseInt($("#pageSizeCopy").val());
            if (pageSize == pageSizeCopy) {
                if (page == maxPage) {
                    alert("当前已是最后一页！")
                } else {
                    $("#page").val(page + 1);
                    query();
                }
            } else {
                $("#page").val(1);
                $("#pageSizeCopy").val(pageSize);
                query();
            }
        };

        function query() {
            var startTime = document.getElementById("startTime").value;
            var endTime = document.getElementById("endTime").value;
            var page = document.getElementById("page").value;
            var pageSize = $('#pageSizeList').find('option:selected').text();
            var pageSizeCopy = parseInt($("#pageSizeCopy").val());
            if (pageSize != pageSizeCopy) {
                page = 1;
                $("#pageSizeCopy").val(pageSize);
                $("#page").val(page);
            }
            $.ajax({
                url: "query.do",
                type: "POST",
                dataType: "json",
                contentType: "application/json;charset=utf-8",
                data: {
                    startTime: startTime,
                    endTime: endTime,
                    page: page,
                    pageSize: pageSize
                },
                success: function (data) {
                    console.log(data);
                    var table = document.getElementById("table");
                    $("#table  tr:not(:first)").html("");
                    for (var i = 0; i < data.data.length; i++) {
                        table.innerHTML += "<tr><td align='center'>" + data.data[i].seqId
                            + "</td><td align='center'>" + data.data[i].userNum
                            + "</td><td align='center'>" + f2(data.data[i].time)
                            + "</td><td align='right' >" + f1(data.data[i].amt)
                            + "</td><td align='center'>" + data.data[i].remark
                            + "</td><td align='center'>" + data.data[i].itemType
                            + "</td></tr>";
                    }
                    table.innerHTML += "<tr><td style='color:red' align='center'>合计</td><td></td><td></td><td style='color:red' align='right'>"
                        + f1(data.sum)
                        + "</td><td></td><td></td></tr>";
                    $("#maxPage").val(data.maxPage);

                },
                error: function () {
                    alert("查询失败！");
                }
            });
        };

        function add() {
            var table = document.getElementById("table");
            table.innerHTML += "<tr><td></td><td></td><td></td><td></td><td></td></tr>";
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
        }
    </script>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped" id="table">
                <thead>
                <tr>
                    <th style="text-align:center;">流水号</th>
                    <th style="text-align:center;">用户代码</th>
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