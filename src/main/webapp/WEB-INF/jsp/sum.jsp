<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page
        contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
        isELIgnored="false" language="java" %>
<html>
<head>

    <title>统计</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>
<body>
<div>
    <div style="height:100%;width:50%;float:left;">
        <iframe id="top101" src="http://localhost:8075/webroot/decision/view/report?viewlet=tj01.cpt" width="100%"
                height="100%"></iframe>
    </div>
    <div style="height:100%;width:50%;float:right;">
        <div style="height:50%;width:100%;float:top;">
            <iframe id="top102" src="http://localhost:8075/webroot/decision/view/report?viewlet=tj02.cpt" width="100%"
                    height="100%"></iframe>
        </div>
    </div>
</div>
</body>
</html>