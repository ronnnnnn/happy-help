<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Index</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/jquery-easyui-1.4.4/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/syUtils.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/myfit.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/ajaxfileupload.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/jslib/jquery-easyui-1.4.4/themes/bootstrap/easyui.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/jslib/jquery-easyui-1.4.4/themes/icon.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.all.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/ueditor/themes/default/css/ueditor.css">
	<script src="${pageContext.request.contextPath}/jquery-treetable/javascripts/src/jquery.treetable.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/jquery-treetable/stylesheets/jquery.treetable.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/jquery-treetable/stylesheets/jquery.treetable.theme.default.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/tablecss.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/JQuery zTree v3.5.15/css/demo.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/JQuery zTree v3.5.15/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<%--<script type="text/javascript" src="${pageContext.request.contextPath}/static/JQuery zTree v3.5.15/js/jquery-1.4.4.min.js"></script>--%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/JQuery zTree v3.5.15/js/jquery.ztree.core-3.5.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/JQuery zTree v3.5.15/js/jquery.ztree.excheck-3.5.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/JQuery zTree v3.5.15/js/jquery.ztree.exedit-3.5.js"></script>
	<script type="text/javascript" src="http://www.jeasyui.com/easyui/datagrid-detailview.js"></script>
<%--<script type="text/javascript" src="/static/JQuery zTree v3.5.15/js/jquery-1.4.4.min.js"></script>--%>
	<%--<style type="text/css">--%>
        <%--.button {--%>
            <%--display: inline-block;--%>
            <%--zoom: 1; /* zoom and *display = ie7 hack for display:inline-block */--%>
            <%--*display: inline;--%>
            <%--vertical-align: baseline;--%>
            <%--margin: 0 0px;--%>
            <%--outline: none;--%>
            <%--cursor: pointer;--%>
            <%--text-align: center;--%>
            <%--text-decoration: none;--%>
            <%--font: 14px/100% Arial, Helvetica, sans-serif;--%>
            <%--padding: .5em 2em .55em;--%>
            <%--text-shadow: 0 1px 1px rgba(0,0,0,.3);--%>
            <%---webkit-border-radius: .5em;--%>
            <%---moz-border-radius: .5em;--%>
            <%--border-radius: .5em;--%>
            <%---webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2);--%>
            <%---moz-box-shadow: 0 1px 2px rgba(0,0,0,.2);--%>
            <%--box-shadow: 0 1px 2px rgba(0,0,0,.2);--%>
            <%--margin-top: 0px;--%>
            <%--margin-bottom: 0px;--%>
        <%--}--%>

        <%--.blue {--%>
            <%--color: #E0ECFF;--%>
            <%--border: solid 1px #0076a3;--%>
            <%--background: #0095cd;--%>
            <%--background: -webkit-gradient(linear, left top, left bottom, from(#00adee), to(#0078a5));--%>
            <%--background: -moz-linear-gradient(top,  #00adee,  #0078a5);--%>
            <%--filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#00adee', endColorstr='#0078a5');--%>
        <%--}--%>

        <%--.hr4{ height:1px;border:none;border-top:1px groove skyblue;margin-top: 0px;  margin-bottom: 0px;}--%>

		<%--li{margin:0px;padding:0px;list-style:none;}--%>

		<%--.mydiv{--%>
			<%--font-size: 20px;--%>
		<%--}--%>
    <%--</style>--%>




	<script type="text/javascript">


        $(function() {
            $('#admin_index_east_calendar').calendar({
                fit : true,
                current : new Date(),
                border : false,
                onSelect : function(date) {
                    $(this).calendar('moveTo', new Date());
                }
            });


			$("#orderedlist li").hover(function () {
				$(this).addClass("blue");
			}, function () {
				$(this).removeClass("blue");
			});



        })

		function menuOnclick(name,url) {
			if(url){
				var murl='${pageContext.request.contextPath}'+url;
				addTabs({title:name,href:murl,closable:true});
			}
		}


		function addTabs(optis) {

				var t = $('#lyout_center_tabs');
				if (t.tabs('exists', optis.title)) {
					t.tabs('select', optis.title);
				} else {
					t.tabs('add', optis);
				}

		}

//		$(document).ready(function () {
//			$("#orderedlist li").hover(function () {
//				$(this).addClass("blue");
//			}, function () {
//				$(this).removeClass("blue");
//			});
//		});

	</script>


</head>

<body class="easyui-layout">
	<div data-options="region:'north'" style="height: 70px;background-color: #0081C2">
		<div  style="float: left;padding: 13px">
			<h1 align="center" style="margin-left: 20px;color: #d9edf7;">乐助后台管理</h1>
		</div>

		<div style="float: right;padding: 17px">
			<h3 align="center"  style="margin-right: 15px;color: #d9edf7"><a href="${pageContext.request.contextPath}/logout" style="color: #d9edf7">退出</a></h3>
		</div>
	</div>
	<div data-options="region:'south'" style="height: 30px;">
		<div align="center">
			<p>&copy;乐助</p>
		</div>
	</div>
	<div data-options="region:'east',title:'日历'" style="width: 180px;">
		<%--<jsp:include page="/admin/index/east.jsp"></jsp:include>--%>
        <div id="admin_index_east_calendar"></div>
	</div>
	<div data-options="region:'west',title:'导航菜单'" style="width: 200px;font-size: 20px">
		<%--<jsp:include page="/admin/index/west.jsp"></jsp:include>--%>
			<div class="easyui-accordion" data-options="fit:true,border:false">
				<c:forEach items="${menus}" var="rootMenu">
					<div title="${rootMenu.key}">
						<ul id="orderedlist" style="margin: 0 0 0 30px; padding: 0px; font-size: 12px; color: #436EEE; line-height: 30px; whitewhite-space: nowrap; ">
							<c:forEach items="${rootMenu.value}" var="childMenu">
								<li style="cursor:pointer;list-style-type: none; display: inline;width: 100% " onclick="menuOnclick('${childMenu.mname}','${childMenu.url}')">${childMenu.mname}</li>
								<br/>
							</c:forEach>
						</ul>
					</div>
				</c:forEach>
			</div>
	</div>
	<div data-options="region:'center'" style="background: #eee;">
		<%--<jsp:include page="/admin/index/center.jsp"></jsp:include>--%>
			<div id="lyout_center_tabs" class="easyui-tabs" data-options="fit:true,border:false">
				<div title="首页">欢迎使用！</div>
			</div>
	</div>
</body>
</html>