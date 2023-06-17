<%@ page import="com.tsw.pojo.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" language="java" %>
<html>
<head>
    <title>账单列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" src="../js/bills.js"></script>
    <script>
        var userId = <%((User)request.getSession().getAttribute("user")).getId();%>
        //alert(userId);
    </script>
</head>
<body>

<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>账单列表</small>
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
            时间
            <input type="date" id="time"/>
            细分类：
            <lable id="itemType1" list="itemTypeList1" for="itemTypeList1"></lable>
            <select id="itemTypeList1">
                <option value=''>请选择</option>
            </select>
        </div>
        <div align="right">
            <input id="pageSizeCopy" type="hidden"/>
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
            页 / 共
            <input id="maxPage" style="width:40px;text-align:center;border:none" readonly="true"/>
            页
            <input id="count" style="width:40px;text-align:center;border:none" readonly="true"/>
            条
        </div>
    </div>
    <div class="row" align="right">
        <div align="right">
            <input id="refresh" onclick="refresh()" type="button" value="刷新列表" class="btn btn-primary"/>
            <input id="before" onclick="before()" type="button" value="上一页" class="btn btn-primary"/>
            <input id="next" onclick="next()" type="button" value="下一页" class="btn btn-primary"/>
            <input id="query" onclick="query()" type="button" value="查询" class="btn btn-primary"/>
            <input id="add" onclick="add()" type="button" value="新增" class="btn btn-primary"/>
            <input id="save" onclick="save()" type="button" value="保存" class="btn btn-primary"/>
            <input id="delete" onclick="d()" type="button" value="删除" class="btn btn-primary"/>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped" id="table">
                <thead>
                <tr>
                    <th style="text-align:center;"><input type="checkbox" id="sa" onclick="selectAll()"/></th>
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