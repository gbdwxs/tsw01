<%@ page import="com.tsw.pojo.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>首页</title>
    <style>
        a {
            text-decoration: none;
            color: black;
            font-size: 18px;
        }

        h3 {
            width: 180px;
            height: 38px;
            margin: 100px auto;
            text-align: center;
            line-height: 38px;
            background: deepskyblue;
            border-radius: 4px;
        }
    </style>
</head>
<body>
<div style="height:100%;width:50%;float:left;">
    <%User user1 = (User)request.getSession().getAttribute("user");%>
    欢迎<%=user1.getRemark() %>
    <h3>
        <a href="${pageContext.request.contextPath}/bill/bills" target="_blank">明细</a>
    </h3>
    <h3>
        <a href="${pageContext.request.contextPath}/bill/top10" target="_blank">TOP 10</a>
    </h3>
</div>
<div style="height:100%;width:50%;float:right;">
    <h3>
        <a href="${pageContext.request.contextPath}/bill/sum" target="_blank">统计</a>
    </h3>
    <h3>
        <a href="${pageContext.request.contextPath}/bill/fx" target="_blank">分析</a>
    </h3>
</div>
</body>
</html>
