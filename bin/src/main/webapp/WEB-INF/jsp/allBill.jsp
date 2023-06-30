<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" language="java" %>
<html>
<head>
    <title>账单列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
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

    <div class="row" align="right">
        <div align="right">
            <input id="query" onclick="query()" type="button" value="查询" class="btn btn-primary"/>
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/bill/toAddBill">新增</a>
        </div>
    </div>
    <script type="text/javascript">
        function query() {
            $.ajax({
                url: "query.do",
                type: "POST",
                dataType: "json",
                data: {"admin": "admin"},
                success: function (data) {
                    alert("查询成功！");
                },
                error: function (data) {
                    alert(data);
                }
            });
        };
    </script>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>流水号</th>
                    <th>用户代码</th>
                    <th>时间</th>
                    <th>描述</th>
                    <th>细分类</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="bill" items="${requestScope.get('list')}">
                    <tr>
                        <td id="seqId">${bill.getSeqId()}</td>
                        <td>${bill.getUserNum()}</td>
                        <td>${bill.getTime()}</td>
                        <td id="remark">${bill.getRemark()}</td>
                        <td>${bill.getItemType()}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/bill/toUpdateBook?id=${bill.getSeqId()}">更改</a>
                            |
                            <a href="${pageContext.request.contextPath}/bill/del/${bill.getSeqId()}">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>