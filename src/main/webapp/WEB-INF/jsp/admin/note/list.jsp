<%@ page language="java" pageEncoding="UTF-8"%>
<body>
<script type="text/javascript">
	$(function() {
		var noteiniturl = '${pageContext.request.contextPath}/note/date';
		noteInit(noteiniturl);
	});

	function noteInit(myurl){
		$('#admin_note_datagrid').datagrid({
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
			},{
				field : 'content',
				title : '内容',
				width : fixWidth(0.20),
				align : 'center',
				formatter : function(value, row, index) {
					return '<p style="width:100%; line-height:1.4em;height:2.8em;overflow:hidden;text-overflow: ellipsis" data-context="'+row.content+'" onclick="showMoreContent(this)">'+row.content+'</p>'
				},
			},{
				field : 'createTime',
				title : '创建时间',
				width : fixWidth(0.1),
				align : 'center',
			},{
				field : 'user',
				title : '用户信息',
				width : fixWidth(0.25),
				align : 'center',
				formatter : function(value, row, index) {
//					var mstrig = "";
//					try {
//						mstrig = "用户名："+row.user.username+",手机号："+row.user.phone+",昵称："+row.user.nickname;
//						return mstrig;
//					}catch(e){
//						return mstrig;
//					}
					var notetag = '<a onclick=noteshowMore("'+row.user.username+','+row.user.phone+','+row.user.nickname+'")>'+row.user.username+'</a>';
					return notetag;
				},
			}] ],
			toolbar : [ {
				text : '删除',
				iconCls : 'icon-remove',
				handler : function() {
					noteRemove();
				}
			}],

		});
	}

	function noteshowMore(infos) {
		var minfos = infos.split(",");
		$("#notedetail").html("");
		var text = "<h2>用户名:</h2>"+"<h3 width='100%' style='padding-left: 20%'>"+ minfos[0] +"</h3>"
		$("#notedetail").append(text);
		$("#notedetail").append("<hr/>");
		var text2 = "<h2>联系方式:</h2>"+"<h3 width='100%' style='padding-left: 20%'>"+ minfos[1] +"</h3>"
		$("#notedetail").append(text2);
		$("#notedetail").append("<hr/>");
		var text3 = "<h2>昵称:</h2>"+"<h3 width='100%' style='padding-left: 20%'>"+ minfos[2] +"</h3>"
		$("#notedetail").append(text3);
		$("#notedetail").append("<hr/>");
		$('#notedetail').dialog('open');
	}

	function noteRemove() {
		var rows = $('#admin_note_datagrid').datagrid('getChecked');
		//	var rows=$('#admin_note_datagrid').datagrid('getSelected');
		//	var rows=$('#admin_note_datagrid').datagrid('getSelecteds');
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
						url : '${pageContext.request.contextPath}/note/'+ids,
						data : {
							ids : ids.join(',')
						},
						dataType : 'json',
						success : function(d) {
							$.messager.show({
								title : '提示',
								msg : '删除成功！'
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

	function noteSearchFun() {
		var mykey = $("input[name$='notekey']").val();
		var asearchUrl = '${pageContext.request.contextPath}/note/search/'+mykey;
		noteInit(asearchUrl);
	}

	function noteClearFun() {
		$('#admin_note_layout input[name=notekey]').val('');
		var initurl = '${pageContext.request.contextPath}/note/date';
		noteInit(initurl);
	}

</script>

<div id="admin_note_layout" class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'north',title:'查询条件',border:false" style="height: 70px;">
		<form id="user_honer_searchForm">
			检索文章(根据内容):<input name="notekey" /> </a> <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="noteSearchFun()">查询</a> <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-back'" onclick="noteClearFun()">清空</a>
		</form>
	</div>
	<div data-options="region:'center',border:false">
		<table id="admin_note_datagrid" data-options="border:false" style="width: auto"></table>
	</div>
</div>



<div id="notedetail" class="easyui-dialog"
	 data-options="closed:true,modal:true,title:'显示用户详情',buttons:[{
					text : '确定',
					handler : function() {
                      	$('#notedetail').dialog('close');
					}}]"
	 style="width: 250px; height: 300px;" title="显示详情">
</div>

</body>
</html>
