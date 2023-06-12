<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page
        contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
        isELIgnored="false" language="java" %>
<html>
<head>
    <title>自定义查询</title>
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
                    <small>请选择要查询的报表和查询条件</small>
                </h1>
            </div>
        </div>
    </div>
    <div class="row">
        类型：
        <lable id="type" list="typeList" for="typeList"></lable>
        <select id="typeList">
            <option value="4">年</option>
            <option value="6">月</option>
            <option value="f">分析</option>
            <option value="tj">统计</option>
        </select>
        </script>
        排序：
        <lable id="sort" list="sortList" for="sortList"></lable>
        <select id="sortList">
            <option value="asc">正序</option>
            <option value="desc">倒叙</option>
        </select>
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
            $("#startTime").val(year + "-" + "01" + "-01");
            $("#endTime").val(year + "-" + month + "-" + day);
        </script>
        <input id="query" onclick="query()" type="button" value="转到" class="btn btn-primary"/>
        <script type="text/javascript">
            query = function () {
                var type = $('#typeList').find('option:selected').val();
                var sort = $('#sortList').find('option:selected').val();
                var startTime = $('#startTime').val();
                var endTime = $('#endTime').val();
                startTime = startTime.replaceAll("-", "");
                endTime = endTime.replaceAll("-", "");
                var reportName;
                if (type == 'f') {
                    reportName = 'tj03';
                } else if (type == 'tj') {
                    reportName = 'tj04';
                } else {
                    reportName = 'sumYear';
                }
                var url = "http://127.0.0.1:8075/webroot/decision/view/report?viewlet=" + reportName + ".cpt"
                    + "&sort=" + sort + "&type=" + type + "&endTime=" + endTime + "&startTime=" + startTime;
                window.open(url, "location=no".false);
            }
        </script>
    </div>
</div>
</body>
</html>