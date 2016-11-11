<%@ page language="java" pageEncoding="UTF-8"%>
<body>
<script type="text/javascript">
	$(function() {
		var serverId = getCookie('serverId');
		var mtype = '2';
		var initurl = '${pageContext.request.contextPath}/comment/list/'+serverId + '/'+ mtype;
		serverCommentInit(initurl);
	});


	function serverCommentInit(myurl){
		$('#admin_serverComment_datagrid').datagrid({
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
				field : 'context',
				title : '评论内容',
				width : fixWidth(0.30),
				align : 'center',
			},{
				field : 'createTime',
				title : '评论时间',
				width : fixWidth(0.16),
				align : 'center',
			},{
				field : 'user',
				title : '评论用户信息',
				width : fixWidth(0.25),
				align : 'center',
				formatter : function(value, row, index) {
					var mstrig = "";
					try {
						mstrig = "用户名："+row.user.username+",手机号："+row.user.phone+",昵称："+row.user.nickname;
						return mstrig;
					}catch(e){
						return mstrig;
					}
				},
			}] ],
			toolbar : [ {
				text : '删除',
				iconCls : 'icon-remove',
				handler : function() {
					serverCommentRemove();
				}
			}]
		});
	}




	function serverCommentRemove() {
		var rows = $('#admin_serverComment_datagrid').datagrid('getChecked');
		//	var rows=$('#admin_serverComment_datagrid').datagrid('getSelected');
		//	var rows=$('#admin_serverComment_datagrid').datagrid('getSelecteds');
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
						url : '${pageContext.request.contextPath}/comment/'+ids,
						data : {
							ids : ids.join(',')
						},
						dataType : 'json',
						success : function(d) {
							var v = $('#admin_serverComment_datagrid');
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

	function serverCommentSearchFun() {
		var mykey = $("input[name$='serverCommentkey']").val();
		var myserverId = getCookie('serverId');
		var smtype = '2';
		var asearchUrl = '${pageContext.request.contextPath}/comment/list/'+myserverId+ '/'+ smtype +'/'+mykey;
		serverCommentInit(asearchUrl);
	}

	function serverCommentClearFun() {
		$('#admin_serverComment_layout input[name=serverCommentkey]').val('');

		var serverId = getCookie('serverId');
		var mtype = '2';
		var initurl = '${pageContext.request.contextPath}/comment/list/'+serverId+ '/'+ mtype;
		serverCommentInit(initurl);
	}


</script>

<div id="admin_serverComment_layout" class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'north',title:'查询条件',border:false" style="height: 70px;">
		<form id="user_honer_searchForm">
			检索评论(根据评论内容):<input name="serverCommentkey" /> </a> <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="serverCommentSearchFun()">查询</a> <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-back'" onclick="serverCommentClearFun()">清空</a>
		</form>
	</div>
	<div data-options="region:'center',border:false">
		<table id="admin_serverComment_datagrid" data-options="border:false" style="width: auto"></table>
	</div>
	<div id="admin_serverComment_pic_rollingDialog" class="easyui-dialog" data-options="closed:true,modal:true,title:'提示'" style="width: 300px; height: 70px;" align="center">
		<img alt="上传中。。。" src="${pageContext.request.contextPath}/jslib/imgs/rolling.gif"><br> <a>上传中,请等候...</a>
	</div>
</div>


</body>
</html>
