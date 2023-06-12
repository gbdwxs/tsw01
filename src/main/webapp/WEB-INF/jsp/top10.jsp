<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page
        contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
        isELIgnored="false" language="java" %>
<html>
<head>

    <title>top 10</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>
<body>
<div>
    <div style="height:100%;width:50%;float:left;">
        <div style="height:50%;width:100%;float:left;">
            <div style="height:100%;width:50%;float:left;">
                <iframe id="top10-t" src="http://localhost:8075/webroot/decision/view/report?viewlet=allBills.cpt"
                        width="100%" height="100%"></iframe>
            </div>
            <div style="height:100%;width:50%;float:right;">
                <iframe id="top10-d" src="http://localhost:8075/webroot/decision/view/report?viewlet=Top10-d.cpt"
                        width="100%" height="100%"></iframe>
            </div>
        </div>
        <div style="height:50%;width:100%;float:right;">
            <div style="height:100%;width:50%;float:left;">
                <iframe id="top10-ym" src="http://localhost:8075/webroot/decision/view/report?viewlet=Top10-ym.cpt"
                        width="100%" height="100%"></iframe>
            </div>
            <div style="height:100%;width:50%;float:right;">
                <iframe id="top10-y" src="http://localhost:8075/webroot/decision/view/report?viewlet=Top10-y.cpt"
                        width="100%" height="100%"></iframe>
            </div>
        </div>
    </div>
    <div style="height:100%;width:50%;float:right;">
        <div style="height:50%;width:100%;float:right;">
            <div style="height:100%;width:50%;float:right;">
                <iframe id="top10-t1" src="http://localhost:8075/webroot/decision/view/report?viewlet=Top10-t.cpt"
                        width="100%" height="100%"></iframe>
            </div>
            <div style="height:100%;width:50%;float:left;">
                <iframe id="top10-r" src="http://localhost:8075/webroot/decision/view/report?viewlet=Top10-r.cpt"
                        width="100%" height="100%"></iframe>
            </div>
        </div>
        <div style="height:50%;width:100%;float:right;">
            <iframe id="top10-s" src="http://localhost:8075/webroot/decision/view/report?viewlet=p2.cpt" width="100%"
                    height="100%"></iframe>
        </div>
    </div>
</div>
</body>
</html>