<%@ page language="java" pageEncoding="UTF-8"%>
<body>
<script type="text/javascript">
	$(function() {
		settingInit();
	});


	function settingInit(){
		$('#admin_setting_datagrid').datagrid({
			url : '${pageContext.request.contextPath}/setting/list',
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
				width : fixWidth(0.1),
				align : 'center',
				//hidden : true,
				checkbox : true
			}, {
				field : 'sysType',
				title : '类别',
				width : fixWidth(0.2),
				align : 'center',
			},{
				field : 'typeName',
				title : '属性名',
				width : fixWidth(0.2),
				align : 'center',
			},{
				field : 'typeValue',
				title : '属性值',
				width : fixWidth(0.2),
				align : 'center',
			},{
				field : 'typeDescription',
				title : '描述',
				width : fixWidth(0.20),
				align : 'center',
			}] ],
			toolbar : [{
				text : '添加',
				iconCls : 'icon-add',
				handler : function() {
					settingAddFun();
				}
			}, '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : function() {
					settingRemove();
				}
			}, '-', {
				text : '修改',
				iconCls : 'icon-edit',
				handler : function() {
					settingEditFun();
				}
			}]
		});
	}





	function settingEditFun() {
		var rows = $('#admin_setting_datagrid').datagrid('getChecked');
		if (rows.length == 1) {
			var d = $('<div/>').dialog({
				width : 200,
				height : 230,
				href : '${pageContext.request.contextPath}/setting/edit-panel',
				modal : true,
				align : 'center',
				title : '修改设置',
				buttons : [ {
					text : '修改',
					handler : function() {
						$('#admin_setting_editForm').form('submit', {
							url : '${pageContext.request.contextPath}/setting/update',
							success : function(data) {

								if (data) {
									d.dialog('destroy');
									$('#admin_setting_datagrid').datagrid('load');
									/*$('#admin_book_datagrid').datagrid('updateRow', {
									 index : $('#admin_book_datagrid').datagrid('getRowIndex', rows[0]),
									 row : obj.obj
									 });*/
								}

								$.messager.show({
									title : '提示',
									msg : obj.msg,
								});
							}
						});
					}
				} ],
				onClose : function() {
					$(this).dialog('destroy');
				},
				onLoad : function() {

					$('#admin_setting_editForm').form('load', rows[0]);

				}
			});
		} else {
			$.messager.alert('提示', '请勾选一个要编辑的选项！');
		}
	}

	function settingAddFun() {

		var d = $('<div/>').dialog({
			width : 200,
			height : 230,
			href : '${pageContext.request.contextPath}/setting/add-panel',
			modal : true,
			align : 'center',
			title : '添加属性',
			buttons : [ {
				text : '添加',
				handler : function() {
					$('#admin_setting_addForm').form('submit', {
						url : '${pageContext.request.contextPath}/setting',
						success : function(data) {

							if (data) {
								d.dialog('destroy');
								$('#admin_setting_datagrid').datagrid('load');
								/*$('#admin_book_datagrid').datagrid('updateRow', {
								 index : $('#admin_book_datagrid').datagrid('getRowIndex', rows[0]),
								 row : obj.obj
								 });*/
							}

							$.messager.show({
								title : '提示',
								msg : obj.msg,
							});
						}
					});
				}
			} ],
			onClose : function() {
				$(this).dailog('destroy');
			},
			onLoad : function() {
				$('#admin_setting_datagrid').form('load', '');

			}
		});

	}

	function settingRemove() {
		var rows = $('#admin_setting_datagrid').datagrid('getChecked');
		//	var rows=$('#admin_setting_datagrid').datagrid('getSelected');
		//	var rows=$('#admin_setting_datagrid').datagrid('getSelecteds');
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
						url : '${pageContext.request.contextPath}/setting/'+ids,
						data : {
							ids : ids.join(',')
						},
						dataType : 'json',
						success : function(d) {
							var v = $('#admin_setting_datagrid');
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



</script>

<div id="admin_setting_layout" class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false">
		<table id="admin_setting_datagrid" data-options="border:false" style="width: auto"></table>
	</div>
</div>


</body>
</html>
