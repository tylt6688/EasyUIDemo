<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>学生科目管理系统</title>
    <jsp:include page="../resources/include.jsp"/>
</head>
<body style="background-image: url(http://img.1ppt.com/uploads/allimg/1912/1_191217222327_1.JPG);background-repeat: no-repeat; width: 100%;
		    height: 100%;background-size: cover">
<%--<body>--%>
<h1>学生科目管理系统</h1>

<%--<div style="margin-left: 500px;width:100%;max-width:600px">--%>
    <%--<input id="searchname" class="easyui-searchbox" data-options="prompt:'请输入要查询的驾校',searcher:queryschoolName" style="width:100%">--%>
<%--</div>--%>

<form style="margin-left: 230px;margin-top: 30px;" id="ff" name="ff">
    <div style="margin-bottom: 10px">
        <input type="hidden" id="id" name="id">
        <input class="easyui-textbox" title="请在此输入姓名" name="name" id="name" style="width: 200px"
               data-options="label:'姓名',required:'true'">
        <input class="easyui-numberbox" name="age" id="age" style="width: 200px"
               data-options="label:'年龄',required:'true',precision:0,min:0 ">
    </div>
</form>



<a style="margin-left: 30px" href="/subject/subject" class="easyui-linkbutton" iconCls="icon-tip" plain="true"><h3 style="color: #ff52ef">查看学生选择科目</h3></a>


<div id="tb">
    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addStudent()">增加</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="delete2Student()">删除</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="queryStudent()">查询</a>

    <%--<a href="#" class="easyui-linkbutton" iconCls="icon-query" plain="true" onclick="delete2Student()">批删除</a>--%>
    <a style="margin-left: 40px" href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true"
       onclick="editStudent()">编辑</a>
    <a style="margin-left: 10px" href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true"
       onclick="updateStudent()">保存</a>

</div>
<table id="dg" class="easyui-datagrid" style="width: 100%; height: 400px" data-options="
    fitColumns:true,
    autoRowHeight:false,
    pagination:true,
    singleSelect:false,
    nowrap:false,
    showRefresh:false,
    striped:true,
    rownumbers:true">

    <%--<table class="easyui-datagrid" id="dg" url="${ctx}/student/getList">--%>
    <thead>
    <tr>
        <th field="ck" checkbox="true"></th>
        <th field="id" width="60" align="center">序号</th>
        <th field="studylicense" width="120" align="center">学号</th>
        <th field="name" width="100" align="center">姓名</th>
        <th field="age" width="60" align="center">年龄</th>
        <th field="major" width="100" align="center">所属院系</th>
        <th field="studyclass" width="100" align="center">所属班级</th>


    </tr>
    </thead>
</table>
</body>

<script type="text/javascript">

    $(document).ready(function () {
        $('#dg').datagrid({loadFilter: pagerFilter}).datagrid({
            url: '${ctx}/student/getList'//加载数据
        });
        var p = $('#dg').datagrid('getPager');
        $(p).pagination({
            pageSize: 10,
            pageList: [2, 5, 10],
            beforePageText: '第',
            afterPageText: '页 	共{pages}页',
            displayMsg: '当前显示{from} - {to}条记录	共{total}条记录',
        });

    });

    // 分页数据的操作
    function pagerFilter(data) {
        if (typeof data.length == 'number' && typeof data.splice == 'function') {
            data = {
                total: data.length,
                rows: data
            }
        }
        var dg = $(this);
        var opts = dg.datagrid('options');
        var pager = dg.datagrid('getPager');
        pager.pagination({
            onSelectPage: function (pageNum, pageSize) {
                opts.pageNumber = pageNum;
                opts.pageSize = pageSize;
                pager.pagination('refresh', {
                    pageNumber: pageNum,
                    pageSize: pageSize
                });
                dg.datagrid('loadData', data);
            }
        });
        if (!data.originalRows) {
            data.originalRows = (data.rows);
        }
        var start = (opts.pageNumber - 1) * parseInt(opts.pageSize);
        var end = start + parseInt(opts.pageSize);
        data.rows = (data.originalRows.slice(start, end));
        return data;
    }

    //添加学生添加弹出式消息框进行显示
    function addStudent() {
        var data = $("#ff").serializeArray();
        $.ajax({
            url: '${ctx}/student/add',
            dataType: 'json',
            type: 'post',
            data: data,
            success: function (data) {
                console.log(data.result);
                $.messager.show({
                    title: '操作通知',
                    msg: data.result,
                    showType: 'show'
                });
                $('#dg').datagrid('reload');
            },
            error: function (data) {

            }
        })
    }

    function queryStudent() {
        var data = $("#ff").serializeArray();
        $.ajax({
            url: '${ctx}/student/query',
            dataType: 'json',
            type: 'post',
            data: data,
            success: function (data) {
                $('#dg').datagrid("loadData", data.result);

            },
            error: function (data) {

            }
        })

    }

    //按school名进行查询
    function queryschoolName() {
        var data = $("#searchname").val();
        $.ajax({
            url: '${ctx}/student/queryname',
            type: 'post',
            data: {
                queryname: data
            },
            success: function (data) {
                console.log(data.result);

                $('#dg').datagrid("loadData", data.result);

            },
            error: function (data) {
            }
        })

    }

    <%--//单个删除--%>
    <%--function deleteStudent() {--%>
    <%--var data1 = $('#dg').datagrid('getSelected');--%>
    <%--$.ajax({--%>
    <%--url: '${ctx}/student/deleteById',--%>
    <%--dataType: 'json',--%>
    <%--type: 'post',--%>
    <%--data: data,--%>
    <%--success: function (data) {--%>
    <%--$('#dg').datagrid('reload');--%>
    <%--},--%>
    <%--error: function (data) {--%>

    <%--}--%>
    <%--})--%>

    <%--}--%>

    //选中后批量删除
    function delete2Student() {
        var ids = getIds($('#dg'), 'id');
        $.ajax({
            url: '${ctx}/student/delete',
            dataType: 'json',
            type: 'post',
            data: {
                ids: ids
            },
            success: function (ids) {
                $.messager.show({
                    title: '操作通知',
                    msg: '删除成功',
                    showType: 'show'
                });
                $('#dg').datagrid('reload');
            },
            error: function (ids) {
            }
        })
    }

    function editStudent() {
        var row = $('#dg').datagrid('getSelected');
        $('#ff').form('load', {
            id: row.id,
            name: row.name,
            age: row.age,
            school:row.school,
            drivinglicense:row.drivinglicense

        })
    }


    function updateStudent() {
        var data = $("#ff").serializeArray();
        $.ajax({
            url: '${ctx}/student/update',
            data: data,
            success: function (data) {
                $.messager.show({
                    title: '保存操作',
                    msg: data.result,
                    timeout: 3000,
                    showType: 'slide'
                });
                $('#dg').datagrid('reload');
            },
            error: function (data) {
                alert("更新失败")
            }
        })
    }


</script>


</html>