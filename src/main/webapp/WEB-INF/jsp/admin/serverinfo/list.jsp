<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<body>
<script type="text/javascript">

	var vsetting = {
		view: {
			dblClickExpand: false
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		callback: {
			beforeClick: vbeforeClick,
			onClick: vonClick
			//onCheck: onCheck
		}
	};

	var vNodes =[
		<c:forEach items="${vcategoryList}" var="va">
		<c:if test="${not va.rootNode}">
		{ id:${va.id}, pId:${va.parentId}, name:"${va.categoryName}",},
		</c:if>
		</c:forEach>
	];

	function vbeforeClick(treeId, treeNode) {
		var check = (treeNode && !treeNode.isParent);
		if (!check) alert("只能选择子目录");
		return check;
	}

	function vonClick(e, treeId, treeNode) {
		var zTree = $.fn.zTree.getZTreeObj("vtree"),
				nodes = zTree.getSelectedNodes(),
				v = "";
		d = "";
		nodes.sort(function compare(a,b){return a.id-b.id;});
		for (var i=0, l=nodes.length; i<l; i++) {
			v = nodes[i].name;
			d = nodes[i].id;
		}
		if (v.length > 0 ) v = v.substring(0, v.length);
		var cityObj = $("#vcategoryName");
		var vcategoryId = $("#vcategoryId");
		cityObj.attr("value", v);
		vcategoryId.attr("value",d);
	}

	function vshowMenu() {
		var cityObj = $("#vcategoryName");
		var cityOffset = $("#vcategoryName").offset();
		$("#vmenuContent").css({left:30 + "px", top:100 + "px"}).slideDown("fast");

		$("body").bind("mousedown", vonBodyDown);
	}

	function vchideMenu() {
		$("#vmenuContent").fadeOut("fast");
		$("body").unbind("mousedown", vonBodyDown);
	}

	function vonBodyDown(event) {
		if (!(event.target.id == "menuBtn" || event.target.id == "vmenuContent" || $(event.target).parents("#vmenuContent").length>0)) {
			vchideMenu();
		}
	}

	$(function () {
		$.fn.zTree.init($("#vtree"), vsetting, vNodes);
		$("#menuBtn").click(vshowMenu);
	});



	function searchServer() {
		if ($('#vcategoryName').val() == '') {
			$.messager.show({
				title : '提示',
				msg : '请选择一个类别！',
			});
		}else {
			var categotyId = $('#vcategoryId').val();
			var vlistUrl = '${pageContext.request.contextPath}/serverInfo/list/'+ categotyId;
			serverInfoInit(vlistUrl);
		}
	}


	function serverInfoInit(myurl){
		$('#admin_serverInfo_datagrid').datagrid({
			url : myurl,
			fit : true,
			pagination : true,
			idField : 'id',
			checkOnSelect : false,
			selectOnCheck : false,
			fitColumns : true,
			nowrap : false,
			rownumbers : true,
			columns : [ [ {
				field : 'id',
				title : '编号',
				width : fixWidth(0.06),
				align : 'center',
				//hidden : true,
				checkbox : true
			}, {
				field : 'title',
				title : '标题',
				width : fixWidth(0.06),
				align : 'center',
			},{
				field : 'context',
				title : '内容',
				width : fixWidth(0.20),
				align : 'center',
				formatter : function(value, row, index) {
					return '<p style="width:100%;overflow: hidden;text-overflow: ellipsis"  onclick=showMoreContent("'+row.context+'")>'+row.context+'</p>'
				},
			},{
				field : 'imageUrl',
				title : '插图',
				width : fixWidth(0.15),
				align : 'center',
				formatter : function(value, row, index) {
					return '<a onclick=csshowPic("'+row.imageUrl+'")>预览图片</a>';
				},
			},{
				field : 'createTime',
				title : '创建时间',
				width : fixWidth(0.06),
				align : 'center',
			},{
				field : 'isPass',
				title : '状态',
				width : fixWidth(0.06),
				align : 'center',
				formatter : function(value, row, index) {
					if (value == true) {
						return '通过审核';
					} else {
						return '未经审核';
					}
				},
			},{
				field : 'isDeleted',
				title : '是否下架',
				width : fixWidth(0.06),
				align : 'center',
				formatter : function(value, row, index) {
					if (value == true) {
						return '下架';
					} else {
						return '展示中';
					}
				},
			},{
				field : 'user',
				title : '作者信息',
				width : fixWidth(0.25),
				align : 'center',
				formatter : function(value, row, index) {
//					var mstrig = "";
//					try {
						//mstrig = "用户名："+row.user.username+",手机号："+row.user.phone+",昵称："+row.user.nickname;
						var atag = '<a onclick=showMore("'+row.user.username+','+row.user.phone+','+row.user.nickname+'")>'+row.user.username+'</a>';
						return atag;
//					}catch(e){
//						return mstrig;
//					}
				},
			}] ],
			toolbar : [ {
				text : '删除',
				iconCls : 'icon-remove',
				handler : function() {
					serverInfoRemove();
				}
			}, '-', {
				text : '通过审核',
				iconCls : 'icon-edit',
				handler : function() {
					serverInfoPass();
				}
			}, '-', {
				text : '下架',
				iconCls : 'icon-edit',
				handler : function() {
					serverInfoUpdateStatus("down");
				}
			}, '-', {
				text : '上架',
				iconCls : 'icon-edit',
				handler : function() {
					serverInfoUpdateStatus("up");
				}
			}, '-', {
				text : '评论管理',
				iconCls : 'icon-edit',
				handler : function() {
					serverCommentManage();
				}
			}]
		});
	}

	function showMore(infos) {
		var minfos = infos.split(",");
		$("#csdetail").html("");
		var text = "<h2>用户名:</h2>"+"<h3 width='100%' style='padding-left: 20%'>"+ minfos[0] +"</h3>"
		$("#csdetail").append(text);
		$("#csdetail").append("<hr/>");
		var text2 = "<h2>联系方式:</h2>"+"<h3 width='100%' style='padding-left: 20%'>"+ minfos[1] +"</h3>"
		$("#csdetail").append(text2);
		$("#csdetail").append("<hr/>");
		var text3 = "<h2>昵称:</h2>"+"<h3 width='100%' style='padding-left: 20%'>"+ minfos[2] +"</h3>"
		$("#csdetail").append(text3);
		$("#csdetail").append("<hr/>");
		$('#csdetail').dialog('open');
	}


	function csshowPic(picUrl) {
		$("#csmpic").html("");
		var img = "<img src='"+picUrl+"' width='100%' height='100%'/>";
		$("#csmpic").append(img);
		$("#csmpic").append("<br/><hr/><br/>");
		$('#csmpic').dialog('open');
	}

	function serverInfoUpdateStatus(type) {
		var rows = $('#admin_serverInfo_datagrid').datagrid('getChecked');
		//	var rows=$('#admin_serverInfo_datagrid').datagrid('getSelected');
		//	var rows=$('#admin_serverInfo_datagrid').datagrid('getSelecteds');
		var ids = [];
		if (rows.length > 0) {
			$.messager.confirm('确认', '您是否要修改当前选中的选项？', function(r) {
				if (r) {
					for ( var i = 0; i < rows.length; i++) {
						ids.push(rows[i].id);
						ids.join(',')
					}
					$.ajax({
						type: 'patch',
						url : '${pageContext.request.contextPath}/serverInfo/'+ids+"/"+type,
						dataType : 'json',
						success : function(d) {
							var v = $('#admin_serverInfo_datagrid');
							v.datagrid('reload');
							v.datagrid('unselectAll');
							v.datagrid('clearChecked');
							$.messager.show({
								title : '提示',
								msg : '修改成功'
							});
						}
					});

				}
			});

		} else {
			$.messager.show({
				title : '提示',
				msg : '请勾选要修改的选项！'
			});
		}

	}


	function serverInfoRemove() {
		var rows = $('#admin_serverInfo_datagrid').datagrid('getChecked');
		//	var rows=$('#admin_serverInfo_datagrid').datagrid('getSelected');
		//	var rows=$('#admin_serverInfo_datagrid').datagrid('getSelecteds');
		var ids = [];
		if (rows.length > 0) {
			$.messager.confirm('确认', '您是否要删除当前选中的选项？', function(r) {
				if (r) {
					for ( var i = 0; i < rows.length; i++) {
						ids.push(rows[i].id);
						ids.join(',')
					}
					$.ajax({
						type: 'delete',
						url : '${pageContext.request.contextPath}/serverInfo/'+ids,
						dataType : 'json',
						success : function(d) {
							var v = $('#admin_serverInfo_datagrid');
							v.datagrid('reload');
							v.datagrid('unselectAll');
							v.datagrid('clearChecked');
							$.messager.show({
								title : '提示',
								msg : '删除成功'
							});
						}
					});

				}
			});

		} else {
			$.messager.show({
				title : '提示',
				msg : '请勾选要删除的选项！'
			});
		}

	}

	function serverInfoPass() {
		var rows = $('#admin_serverInfo_datagrid').datagrid('getChecked');
		//	var rows=$('#admin_serverInfo_datagrid').datagrid('getSelected');
		//	var rows=$('#admin_serverInfo_datagrid').datagrid('getSelecteds');
		var ids = [];
		if (rows.length > 0) {
			$.messager.confirm('确认', '是否通过审核？', function(r) {
				if (r) {
					for ( var i = 0; i < rows.length; i++) {
						ids.push(rows[i].id);
						ids.join(',')
					}
					$.ajax({
						type: 'patch',
						url : '${pageContext.request.contextPath}/serverInfo/'+ids,
						data : {
							ids : ids.join(',')
						},
						dataType : 'json',
						success : function(d) {
							var v = $('#admin_serverInfo_datagrid');
							v.datagrid('reload');
							v.datagrid('unselectAll');
							v.datagrid('clearChecked');
							$.messager.show({
								title : '提示',
								msg : '审核成功'
							});
						}
					});

				}
			});

		} else {
			$.messager.show({
				title : '提示',
				msg : '请勾选要删除的选项！'
			});
		}

	}


	function serverInfoSearchFun() {
		var mykey = $("input[name$='serverInfokey']").val();
		var asearchUrl = '${pageContext.request.contextPath}/serverInfo/search/'+mykey;
		serverInfoInit(asearchUrl);
	}

	function serverInfoClearFun() {
		$('#admin_serverInfo_layout input[name=serverInfokey]').val('');
		var initurl = '${pageContext.request.contextPath}/serverInfo/list';
		serverInfoInit(initurl);
	}

	function serverCommentManage() {
		var rows = $('#admin_serverInfo_datagrid').datagrid('getChecked');
		if (rows.length == 1) {
			setCookie('serverId',rows[0].id);
			var url = '${pageContext.request.contextPath}/comment/server/list-panel';
			addTabs({
				title : '公共服务评论管理',
				href : url,
				closable : true
			});

		} else {
			$.messager.alert('提示', '请勾选一个要管理的文章！');
		}

	}
</script>

<div id="admin_serverInfo_layout" class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'north',title:'查询条件',border:false" style="height: 100px;">
		<form id="user_honer_searchForm">
			检索文章(根据内容):<input name="serverInfokey" /> </a> <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="serverInfoSearchFun()">查询</a> <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-back'" onclick="serverInfoClearFun()">清空</a>
		</form>
		<form id="admin_helpinfo_gethelpForm" method="post">
			<input type="hidden" id="vcategoryId" name="vcategoryId" style="width: 10%">
			类别：<input id="vcategoryName" name="vcategoryName" style="width: 10%"> <a id="tmenuBtn" href="#" onclick="vshowMenu()">选择类别</a><br/>
			<a  href="#" class="easyui-linkbutton" onclick="searchServer()">查询公共服务</a>
		</form>
	</div>
	<div data-options="region:'center',border:false">
		<table id="admin_serverInfo_datagrid" data-options="border:false" style="width: auto"></table>
	</div>
	<div id="admin_serverInfo_pic_rollingDialog" class="easyui-dialog" data-options="closed:true,modal:true,title:'提示'" style="width: 300px; height: 70px;" align="center">
		<img alt="上传中。。。" src="${pageContext.request.contextPath}/jslib/imgs/rolling.gif"><br> <a>上传中,请等候...</a>
	</div>
</div>

<div id="vmenuContent" class="menuContent" style="display:none; position: absolute;">
	<ul id="vtree" class="ztree" style="margin-top:0; width:180px;height: 200px"></ul>
</div>

<div id="csmpic" class="easyui-dialog"
	 data-options="closed:true,modal:true,title:'显示图片',buttons:[{
					text : '确定',
					handler : function() {
                      	$('#csmpic').dialog('close');
					}}]"
	 style="width: 350px; height: 300px;" title="显示图片">
</div>

<div id="csdetail" class="easyui-dialog"
	 data-options="closed:true,modal:true,title:'显示用户详情',buttons:[{
					text : '确定',
					handler : function() {
                      	$('#csdetail').dialog('close');
					}}]"
	 style="width: 250px; height: 300px;" title="显示详情">
</div>

</body>
</html>
