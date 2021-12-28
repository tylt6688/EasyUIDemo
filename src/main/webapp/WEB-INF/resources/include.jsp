<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<link rel="stylesheet" type="text/css" href="${ctx}/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${ctx}/js/easyui/themes/icon.css">

<script type="text/javascript" src="${ctx}/js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/js/easyui/jquery.easyui.min.js"></script>

<script type="text/javascript">
    function getIds(grid,key) {
        var ids=[];
        var rows=grid.datagrid('getSelections');
        for(var i=0;i<rows.length;i++){
            ids.push(rows[i][key]);//添加id
        }
        return ids.join(",");//把数组中的元素通过‘，’分隔变成字符串
    }
</script>