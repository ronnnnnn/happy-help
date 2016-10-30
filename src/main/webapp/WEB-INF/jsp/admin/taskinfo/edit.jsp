<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%--<title></title>--%>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/css.css">--%>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/static/JQuery zTree v3.5.15/css/zTreeStyle/zTreeStyle.css">--%>


</head>
<body>




        <div class="container">
                <h3>类别:</h3>
                 <input id="categoryId" type="hidden"/>
                <textarea id="categoryName" type="text" readonly value="" style="width:100%;height: 50px" onclick="cshowMenu();" />
                <a id="menuBtn" href="#" onclick="cshowMenu()">选择类别</a>
        </div>



<script>

        var setting = {
            check: {
                enable: true ,
                chkboxType: { "Y": "", "N": "" }
            },
            view: {
                dblClickExpand: false
            },
            data: {
                simpleData: {
                    enable: true
                }
            },
            callback: {
                onCheck: onCheck
            }
        };

        var zNodes =[
            <c:forEach items="${categoryList}" var="ca">
            <c:if test="${not ca.rootNode}">
            { id:${ca.id}, pId:${ca.parentId}, name:"${ca.categoryName}",},
            </c:if>
            </c:forEach>
        ];

        function onCheck(e, treeId, treeNode) {
            var zTree = $.fn.zTree.getZTreeObj("ttree"),
                    nodes = zTree.getCheckedNodes(true),
                    id = "",
                    name = "";
            nodes.sort(function compare(a,b){return a.id-b.id;});
            for (var i=0, l=nodes.length; i<l; i++) {
                id += nodes[i].id + ",";
                name += nodes[i].name + ",";
            }
            if (id.length > 0 ) id = id.substring(0, id.length-1);
            if (name.length > 0 ) name = name.substring(0, name.length-1);
            $("#categoryId").val(id);
            $("#categoryName").val(name);
//                hideMenu();
        }


        function hideMenu() {
            $("#tmenuContent").fadeOut("fast");
            $("body").unbind("mousedown", onBodyDown);
        }
        function onBodyDown(event) {
            if (!(event.target.id == "menuBtn" || event.target.id == "tmenuContent" || $(event.target).parents("#tmenuContent").length>0)) {
                hideMenu();
            }
        }
        $(function () {
            function cshowMenu() {
                var cityObj = $("#categoryName");
                var cityOffset = $("#categoryName").offset();
                $("#tmenuContent").css({left:30 + "px", top:130 + "px"}).slideDown("fast");

                $("body").bind("mousedown", onBodyDown);
            };
        $.fn.zTree.init($("#ttree"), setting, zNodes);
        $("#menuBtn").click(cshowMenu);
    });

</script>

<div id="tmenuContent" class="menuContent" style="display:none; position: absolute;">
    <ul id="ttree" class="ztree" style="margin-top:0; width:180px;height: 200px"></ul>
</div>
</body>
</html>