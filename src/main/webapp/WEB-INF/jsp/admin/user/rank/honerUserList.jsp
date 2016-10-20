<%@ page language="java" pageEncoding="UTF-8"%>
<body>
<script type="text/javascript">
	$(function() {
		honerinit();
	});


	function honerinit(){
		$('#user_honer_datagrid').datagrid({
			url : '${pageContext.request.contextPath}/user/normaluser/all',
			fit : true,
			pagination : true,
			idField : 'id',
			checkOnSelect : false,
			selectOnCheck : false,
			fitColumns : true,
			nowrap : false,
			rownumbers : true,
			queryParams: {
				order : "honer_score",
				sort : "desc"
			},
			frozenColumns : [ [ {
				field : 'id',
				title : '编号',
				width : fixWidth(0.1),
				align : 'center',
				//hidden : true,
				checkbox : true
			}, {
				field : 'username',
				title : '用户名',
				width : fixWidth(0.2),
				align : 'center',
			},{
				field : 'realName',
				title : '名字',
				width : fixWidth(0.1),
				align : 'center',
			},{
				field : 'honerScore',
				title : '荣誉值',
				width : fixWidth(0.1),
				align : 'center',
			},{
				field : 'phone',
				title : '电话',
				width : fixWidth(0.2),
				align : 'center',
			} ] ],
			toolbar : [{
				text : '添加',
				iconCls : 'icon-remove',
				handler : function() {
					userAddFun();
				}
			}, '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : function() {
					userRemove();
				}
			}, '-', {
				text : '修改荣誉值',
				iconCls : 'icon-edit',
				handler : function() {
					honerScoreEdit();
				}
			}]
		});
	}



	function honerScoreEdit() {
		var rows = $('#user_honer_datagrid').datagrid('getChecked');
		if (rows.length == 1) {
			var dp = $('<div/>').dialog({
				width : 270,
				height : 135,
				href : '${pageContext.request.contextPath}/user/password/panel',
				modal : true,
				align : 'center',
				title : '修改密码',
				buttons : [ {
					text : '修改',
					handler : function() {
						var id = $('#id-p').val();
						var newPWD = $('#password-n').val();
						$.ajax({
							type: 'patch',
							contentType: 'application/json',
							url: '${pageContext.request.contextPath}/user/password',
							processData: false,
							dataType: 'json',
							data : '{"id":\"'+id+'\","password":\"'+newPWD+'\"}',
							success: function(data) {
								if(data){
									$('#user_honer_datagrid').datagrid('load');
									dp.dialog('close');
								}else{
									alert("修改失败!");
								}
							},
							error: function() {
								alert('修改错误!');
							}
						});
					}
				} ],
				onClose : function() {
					$(this).dialog('destroy');
				},
				onLoad : function() {
					$('#admin_password_editForm').form('load', rows[0]);
				}
			});
		} else {
			$.messager.alert('提示', '请勾选一个要编辑的选项！');
		}
	}

	function userEditFun() {
		var rows = $('#user_honer_datagrid').datagrid('getChecked');
		if (rows.length == 1) {
			var d = $('<div/>').dialog({
				width : 270,
				height : 255,
				href : '${pageContext.request.contextPath}/user/superuser/editpanel',
				modal : true,
				align : 'center',
				title : '修改用户',
				buttons : [ {
					text : '修改',
					handler : function() {
						var username = $('#username-e').val();
						var roleIds = $('#role-select-e').combobox('getValues');
						var locked = $('#locked-e').val();
						var phone = $('#phone-e').val();
						var realName = $('#realname-e').val();
						var userIdentify = $('#userIdentity-e').val();
						var id = $('#id-e').val();
						$.ajax({
							type: 'PATCH',
							contentType: 'application/json',
							url: '${pageContext.request.contextPath}/user',
							processData: false,
							dataType: 'json',
							data : '{"username":\"'+username+'\","roleIds":\"'+roleIds+'\","isLocked":\"'+locked+'\","phone":\"'+phone+'\","realName":\"'+realName+'\","userIdentify":\"'+userIdentify+'\","id":\"'+id+'\"}',
							success: function(data) {
								if(data){
									$('#user_honer_datagrid').datagrid('load');
									$('#user_honer_datagrid').datagrid('unselectAll');
									d.dialog('destroy');
								}else{
									alert("修改失败!");
								}
							},
							error: function() {
								alert('修改错误!');
							}
						});
					}
				} ],
				onClose : function() {
					$(this).dialog('destroy');
				},
				onLoad : function() {

					$('#admin_user_editForm').form('load', rows[0]);

				}
			});
		} else {
			$.messager.alert('提示', '请勾选一个要编辑的选项！');
		}
	}

	function userAddFun() {

		$.ajax({
			type: 'get',
			contentType: 'application/json',
			url: '${pageContext.request.contextPath}/role/all/list',
			processData: false,
			dataType: 'json',
			async:false,
			success: function(data) {
				$("#role-select-a").empty();
				$.each(data, function (index, value) {
					$("#role-select-a").append("<option value='"+value.id+"'>"+value.description+"</option>");
				});
			},
			error: function() {
				alert('Err...');
			}
		});



		$('#admin_user_addForm input').val('');
		$('#admin_user_addForm select').val('');
		$('#admin_user_addDialog').dialog('open');


		$('#role-select-a').combobox({
			onChange: function() {
				var value = $('#role-select-a').combobox('getValues');
				console.log(value);
				console.log(value.join(','));

			}
		});

	}

	function userRemove() {
		var rows = $('#user_honer_datagrid').datagrid('getChecked');
		//	var rows=$('#user_honer_datagrid').datagrid('getSelected');
		//	var rows=$('#user_honer_datagrid').datagrid('getSelecteds');
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
						url : '${pageContext.request.contextPath}/user/'+ids,
						data : {
							ids : ids.join(',')
						},
						dataType : 'json',
						success : function(d) {
							var v = $('#user_honer_datagrid');
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

	function userHonerClearFun() {
		$('#user_honer_datagrid input[name=name]').val('');
		$('#user_honer_datagrid').datagrid('load', {});
	}

	function registerUser() {
		var username = $('#username-a').val();
		var password = $('#password-a').val();
		var userIdentify = $('#userIdentity-a').val();
		var realName = $('#realname-a').val();
		var roleIds = $('#role-select-a').combobox('getValues');
		var phone = $('#phone-a').val();
		var isLocked = $('#locked-a').val();
		var isAdmin = true;
		$.ajax({
			type: 'POST',
			contentType: 'application/json',
			url: '${pageContext.request.contextPath}/user',
			processData: false,
			dataType: 'json',
			data : '{"username":\"'+username+'\","password":\"'+password+'\","roleIds":\"'+roleIds+'\","isLocked":\"'+isLocked+'\","phone":\"'+phone+'\","realName":\"'+realName+'\","userIdentify":\"'+userIdentify+'\","isAdmin":\"'+isAdmin+'\"}',
			success: function(data) {
				if(data){
					$('#user_honer_datagrid').datagrid('load');
					$('#admin_user_addDialog').dialog('close');
				}else{
					alert("用户已经存在");
				}
			},
			error: function() {
				alert('注册失败');
			}
		});
	}

	function userHonerSearchFun() {

		$('#user_honer_datagrid').datagrid({
			url : '${pageContext.request.contextPath}/user/key',
			fit : true,
			pagination : true,
			idField : 'id',
			checkOnSelect : false,
			selectOnCheck : false,
			fitColumns : true,
			nowrap : false,
			rownumbers : true,
			queryParams: {
				key : $("input[name$='key']").val()
			},
			frozenColumns : [ [ {
				field : 'id',
				title : '编号',
				width : 150,
				align : 'center',
				//hidden : true,
				checkbox : true
			}, {
				field : 'username',
				title : '用户名',
				width : 120,
				align : 'center',
			},{
				field : 'realName',
				title : '名字',
				width : 110,
				align : 'center',
			},{
				field : 'userIdentify',
				title : '生份证',
				width : 150,
				align : 'center',
			},{
				field : 'roleIds',
				title : '角色列表',
				width : 300,
				align : 'center',
				formatter : function(value, row, index) {
					var rolename = "";
					if (value != null && value != undefined && value != '') {

						$.ajax({
							type: 'get',
							url: '${pageContext.request.contextPath}/role/' + value,
							dataType: 'json',
							async:false,
							success: function (data) {
								$.each(data, function (index, value) {
									rolename += value.description + ",";
								});
							},
							error: function (data) {
								alert("err");
							}
						});
					}else{
						return rolename;
					}
					return rolename;
				},
			},{
				field : 'phone',
				title : '电话',
				width : 150,
				align : 'center',
			},{
				field : 'isLocked',
				title : '状态',
				width : 100,
				align : 'center',
				formatter : function(value, row, index) {
					if (value == true) {
						return '锁定';
					} else {
						return '活动';
					}
				},
			} ] ],
			toolbar : [{
				text : '添加',
				iconCls : 'icon-remove',
				handler : function() {
					userAddFun();
				}
			}, '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : function() {
					userRemove();
				}
			}, '-', {
				text : '修改',
				iconCls : 'icon-edit',
				handler : function() {
					userEditFun();
				}
			},'-', {
				text : '修改密码',
				iconCls : 'icon-edit',
				handler : function() {
					honerScoreEdit();
				}
			}]
		});


		//$('#admin_zjgl_zjgl_datagrid').datagrid('load', serializeObject($('#admin_zjgl_zjgl_searchForm')));
	}

	function userHonerClearFun() {
		$('#user_honer_layout input[name=key]').val('');
		$('#user_honer_datagrid').datagrid('load', {});
	}
</script>

<div id="user_honer_layout" class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'north',title:'查询条件',border:false" style="height: 70px;">
		<form id="user_honer_searchForm">
			检索用户(可模糊查询):<input name="key" /> </a> <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="userHonerSearchFun()">查询</a> <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-back'" onclick="userHonerClearFun()">清空</a>
		</form>
	</div>
	<div data-options="region:'center',border:false">
		<table id="user_honer_datagrid" data-options="border:false" style="width: auto"></table>
	</div>

</div>


</body>
</html>
