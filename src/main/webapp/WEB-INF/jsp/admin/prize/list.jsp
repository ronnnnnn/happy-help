<%@ page language="java" pageEncoding="UTF-8"%>
<body>
<script type="text/javascript">
	$(function() {
		prizeInit();
	});


	function prizeInit(){
		$('#admin_prize_datagrid').datagrid({
			url : '${pageContext.request.contextPath}/prize/list',
			fit : true,
			pagination : true,
			idField : 'id',
			checkOnSelect : false,
			selectOnCheck : false,
			fitColumns : true,
			nowrap : false,
			rownumbers : true,
			frozenColumns : [ [ {
				field : 'id',
				title : '编号',
				width : fixWidth(0.1),
				align : 'center',
				//hidden : true,
				checkbox : true
			}, {
				field : 'prizeNum',
				title : '开奖期数',
				width : fixWidth(0.1),
				align : 'center',
			},{
				field : 'prizeMoney',
				title : '开奖金额',
				width : fixWidth(0.1),
				align : 'center',
			},{
				field : 'typeDescription',
				title : '描述',
				width : fixWidth(0.10),
				align : 'center',
			}] ],
			toolbar : [{
				text : '添加',
				iconCls : 'icon-add',
				handler : function() {
					prizeAddFun();
				}
			}, '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : function() {
					prizeRemove();
				}
			}, '-', {
				text : '修改',
				iconCls : 'icon-edit',
				handler : function() {
					prizeEditFun();
				}
			}]
		});
	}





	function prizeEditFun() {
		var rows = $('#admin_prize_datagrid').datagrid('getChecked');
		if (rows.length == 1) {
			var d = $('<div/>').dialog({
				width : 200,
				height : 150,
				href : '${pageContext.request.contextPath}/prize/add-panel',
				modal : true,
				align : 'center',
				title : '修改设置',
				buttons : [ {
					text : '修改',
					handler : function() {
						$('#admin_prize_addForm').form('submit', {
							url : '${pageContext.request.contextPath}/prize/update',
							success : function(data) {

								if (data) {
									d.dialog('destroy');
									$('#admin_prize_datagrid').datagrid('load');
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

					$('#admin_prize_addForm').form('load', rows[0]);

				}
			});
		} else {
			$.messager.alert('提示', '请勾选一个要编辑的选项！');
		}
	}

	function prizeAddFun() {

		var d = $('<div/>').dialog({
			width : 200,
			height : 150,
			href : '${pageContext.request.contextPath}/prize/add-panel',
			modal : true,
			align : 'center',
			title : '添加属性',
			buttons : [ {
				text : '添加',
				handler : function() {
					$('#admin_prize_addForm').form('submit', {
						url : '${pageContext.request.contextPath}/prize',
						success : function(data) {

							if (data) {
								d.dialog('destroy');
								$('#admin_prize_datagrid').datagrid('load');
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
				$('#admin_book_datagrid').form('load', '');

			}
		});

	}

	function prizeRemove() {
		var rows = $('#admin_prize_datagrid').datagrid('getChecked');
		//	var rows=$('#admin_prize_datagrid').datagrid('getSelected');
		//	var rows=$('#admin_prize_datagrid').datagrid('getSelecteds');
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
						url : '${pageContext.request.contextPath}/prize/'+ids,
						data : {
							ids : ids.join(',')
						},
						dataType : 'json',
						success : function(d) {
							var v = $('#admin_prize_datagrid');
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

	function xsImport() {
		if ($('#uploadfile').val() == '') {
			$.messager.show({
				title : '提示',
				msg : '请选择一个jpg文件',
			});
		} else {
			$('#admin_prize_rollingDialog').dialog('open');
			$.ajaxFileUpload({
				url : '${pageContext.request.contextPath}/prize/image',//用于文件上传的服务器端请求地址
				secureuri : true,//是否启用安全提交，一般设置为false
				fileElementId : 'uploadfile',//文件上传控件的id
				dataType : 'text',//服务器返回的数据类型
				success : function(data) {
					$('#admin_prize_rollingDialog').dialog('close');
					var obj = jQuery.parseJSON(data);
					if (obj.success) {
						//$('#admin_bookManage_importDialog').dialog('close');
						$('#sh-imageUrl').val(obj.obj);
						//alert(obj.obj);
					}
					$.messager.show({
						title : '提示',
						msg : obj.msg,
					});
				},
				error : function(data, status, e) {
					$.messager.show({
						title : '提示',
						msg : '服务中断或连接超时导致通信失败！' ,
					});
				}
			});
		}
	}


</script>

<div id="admin_prize_layout" class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false">
		<table id="admin_prize_datagrid" data-options="border:false" style="width: auto"></table>
	</div>
</div>


</body>
</html>
