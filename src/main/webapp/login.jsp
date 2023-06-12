<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" language="java" %>
<html>
    <head>
        <title>登陆</title>
    </head>
    <body>
        <form action="${pageContext.request.contextPath}/login/login.do" method="post">
            用户名：<input type="text" name="userId"/>
            密 码：<input type="password" name="password"/>
            <input type="submit" value="登陆"/>
        </form>
    </body>
</html>