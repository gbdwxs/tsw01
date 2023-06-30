<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" language="java" %>
<html>
<head>
    <title>修改信息</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>修改信息</small>
                </h1>
            </div>
        </div>
    </div>

    <form action="${pageContext.request.contextPath}/bill/addBill" method="post">
        <input type="hidden" name="seqId" value="${bill.getSeqId()}"/>
        <input type="hidden" name="userNum" value="${bill.getUserNum()}"/>
        金额：<input type="text" name="amt" value="${bill.getAmt()}"/>
        描述：<input type="text" name="remark" value="${bill.getRemark()}"/>
        <input type="submit" value="提交"/>
    </form>

</div>