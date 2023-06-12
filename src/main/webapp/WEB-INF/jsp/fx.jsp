<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" language="java" %>
<html>
<head>
    <title>分析</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>
<body>
<div>
    <div style="height:50%;width:100%;float:top;">
        <iframe id="sx01" src="http://localhost:8075/webroot/decision/view/report?viewlet=sx01.cpt" width="100%"
                height="100%"></iframe>
    </div>
    <div style="height:50%;width:100%;">
        <iframe id="sx02" src="http://localhost:8075/webroot/decision/view/report?viewlet=sx02.cpt" width="100%"
                height="100%"></iframe>
    </div>
</body>
</html>