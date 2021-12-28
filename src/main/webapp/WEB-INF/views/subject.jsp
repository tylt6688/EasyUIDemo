<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生科目管理系统</title>
    <jsp:include page="../resources/include.jsp"/>
</head>
<body style="background-image: url(http://img.1ppt.com/uploads/allimg/1912/1_191217222327_1.JPG);background-repeat: no-repeat; width: 100%;
height: 100%;background-size: cover">
<%--<body>--%>
<a href="/" style="margin-left: 680px;color:#000000" class="easyui-linkbutton" data-options="iconCls:'icon-back'"
   plain="true"><h2>回到首页</h2></a>
<div style="margin-top: 30px">
    <input class="easyui-textbox" name="subjectname" id="subjectname" style="width: 200px"
           data-options="label:'学科',required:'true'">
    <input class="easyui-numberbox" name="studylicense" id="studylicense" style="width: 200px"
           data-options="label:'学生学号',required:'true',precision:0,min:0 ">
    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="insertOne()">增加</a>
</div>

<div style="margin-top: 100px">
    <table id="dg" class="easyui-datagrid" style="width: 100%; height: 390px" data-options="
    fitColumns:true,
    autoRowHeight:false,
    pagination:true,
    singleSelect:false,
    nowrap:false,
    showRefresh:false,
    striped:true,
    rownumbers:true">
        <thead>
        <tr>
            <th field="ck" checkbox="true"></th>
            <th field="id" width="60" align="center">序号</th>
            <th field="studylicense" width="160" align="center">学号</th>
            <th field="name" width="120" align="center">学生姓名</th>
            <th field="subjectname" width="120" align="center">学生选择科目</th>
            <th field="studyclass" width="100" align="center">所属班级</th>


        </tr>
        </thead>
    </table>
</div>

</body>
<script type="text/javascript">
    $(document).ready(function () {
        $('#dg').datagrid({loadFilter: pagerFilter}).datagrid({
            url: '${ctx}/subject/selectOwner'//加载数据
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

    //添加
    function insertOne() {
        var subjectname = $("#subjectname").val();
        var studylicense = $("#studylicense").val();
        $.ajax({
            url: '${ctx}/subject/insertOne',
            dataType: 'json',
            type: 'post',
            data: {
                subjectname: subjectname,
                studylicense: studylicense
            },
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
                alert("失败" + data.result);
            }
        })
    }

</script>

</html>
