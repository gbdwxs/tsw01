var list;
$(function () {
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
    $("#startTime").val(year + "-" + month + "-01");
    $("#endTime").val(year + "-" + month + "-" + day);
    $("#pageSizeCopy").val(10);
    $("#page").val(1);
    document.getElementById("page").style.width = document.getElementById("page").value.length * 20 + 5;
    $("#maxPage").val(1);
    document.getElementById("maxPage").style.width = document.getElementById("maxPage").value.length * 25 + 5;
    $("#count").val(0);
    document.getElementById("count").style.width = document.getElementById("count").value.length * 25 + 5;
    $.ajax({
        url: "queryItemType.do",
        type: "GET",
        dataType: "json",
        contentType: "application/json;charset=utf-8",
        data: {},
        success: function (result) {
            list = result.itemTypeList;
        },
        error: function () {
            console.log("查询失败！");
        }
    });


});

function add() {
    var tr = $("<tr></tr>");
    var time = $("#time").val();
    tr.append($("<td align='center'><input type='checkbox' checked='checked'/></td>"));
    tr.append($("<td align='center' name='seqId'>新增数据</td>"));
    tr.append($("<td align='center'>新增数据</td>"));
    tr.append($("<td align='center'><input type='date' name='time' value='"+time+"'/></td>"));
    tr.append($("<td align='center'><input type='text' name='amt'/></td>"));
    tr.append($("<td align='center'><input type='text' name='remark'/></td>"));
    var td = "<td align='center'><select id='itemTypeList' name='itemType']><option value=0>请选择</option>"
    for (var i = 0; i < list.length; i++) {
        td += "<option value=" + list[i].code + ">" + list[i].name + "</option>";
    }
    td += "</select></td>";
    tr.append($(td));
    $("#table").append(tr);
}

function d() {
    $(":checkbox:checked").each(function () {
        var tablerow = $(this).parent();
        var seqId = tablerow.next().text();
        $.ajax({
            url: "delete.do",
            type: "GET",
            dataType: "json",
            contentType: "application/json;charset=utf-8",
            data: {
                id: seqId
            },
            success: function () {
                query();
            }
        });
    });

}

function refresh(){
    $.ajax({
        url: "queryItemType.do",
        type: "GET",
        dataType: "json",
        contentType: "application/json;charset=utf-8",
        data: {},
        success: function (result) {
            list = result.itemTypeList;
        },
        error: function () {
            console.log("查询失败！");
        }
    });
}

function save() {
    var rows = [];
    $(":checkbox:checked").each(function () {
        var tablerow = $(this).parent().parent();
        var time = tablerow.find("[name='time']").val().replaceAll("-","");
        var amt = tablerow.find("[name='amt']").val();
        var remark = tablerow.find("[name='remark']").val();
        var itemType = tablerow.find("[name='itemType']").val();
        var seqId = tablerow.find("[name='seqId']").text();
        if (seqId == "新增数据") {
            rows.push({"time": time, "amt": amt, "remark": remark, "itemType": itemType});
        }
    });
    if (rows.length == 0) {
        alert("选择新增的行！")
        return;
    }
    var data = {data:rows}
    $.ajax({
        url: "add.do",
        type: "POST",
        dataType: "json",
        contentType: "application/json;charset=utf-8",
        data: JSON.stringify(data),
        success: function (e) {
            query();
        }
    });

}

function selectAll() {
    var check = $("#sa").is(":checked");
    $(":checkbox").prop("checked", check);
}

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
    var data = {
        startTime: startTime,
        endTime: endTime,
        page: page,
        pageSize: pageSize
    }
    $.ajax({
        url: "query.do",
        type: "POST",
        dataType: "json",
        contentType: "application/json;charset=utf-8",
        data: JSON.stringify(data),
        success: function (e) {
            var table = document.getElementById("table");
            $("#table  tr:not(:first)").html("");
            for (var i = 0; i < e.data.data.length; i++) {
                table.innerHTML += "<tr><td align='center'><input type='checkbox'/>"
                    + "</td><td align='center'>" + e.data.data[i].seqId
                    + "</td><td align='center'>" + e.data.data[i].userNum
                    + "</td><td align='center' name='time'>" + f2(e.data.data[i].time)
                    + "</td><td align='right' name='amt'>" + f1(e.data.data[i].amt)
                    + "</td><td align='center' name='remark'>" + e.data.data[i].remark
                    + "</td><td align='center' name='itemType'>" + e.data.data[i].itemType
                    + "</td></tr>";
            }
            table.innerHTML += "<tr><td></td><td style='color:red' align='center'>合计</td><td></td><td></td><td style='color:red' align='right'>"
                + f1(e.data.sum)
                + "</td><td></td><td></td></tr>";
            $("#maxPage").val(e.data.maxPage);
            $("#count").val(e.data.count);
        },
        error: function () {
            alert("查询失败！");
        }
    });
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
        var year = date.substring(0, 4);
        var month = date.substring(4, 6);
        var day = date.substring(6, 8);
        return year + "-" + month + "-" + day;
    }
}