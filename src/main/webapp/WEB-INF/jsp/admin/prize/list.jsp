<%@ page language="java" pageEncoding="UTF-8"%>
<body>
<script type="text/javascript">
	$(function() {
		var initurl = '${pageContext.request.contextPath}/prize/list';
		prizeInit(initurl);
	});


	function prizeInit(myurl){
		$('#admin_prize_datagrid').datagrid({
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
				width : fixWidth(0.1),
				align : 'center',
				//hidden : true,
				checkbox : true
			}, {
				field : 'prizeNum',
				title : '开奖期数',
				width : fixWidth(0.10),
				align : 'center',
			},{
				field : 'prizeMoney',
				title : '开奖金额',
				width : fixWidth(0.10),
				align : 'center',
			},{
				field : 'userIds',
				title : '获奖人ID',
				hidden : true,
				align : 'center',
			},{
				field : 'hhPhones',
				title : '获奖人号码(荣誉值)',
				width : fixWidth(0.2),
				align : 'center',
			},{
				field : 'articlePhones',
				title : '获奖人号码(文章)',
				width : fixWidth(0.2),
				align : 'center',
			},{
				field : 'isLottery',
				title : '状态',
				width : fixWidth(0.1),
				align : 'center',
				formatter : function(value, row, index) {
					if (value == true) {
						return '开奖';
					} else {
						return '未开奖';
					}
				},
			},{
				field : 'createTime',
				title : '时间',
				width : fixWidth(0.2),
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
			}, '-', {
				text : '添加获奖人(荣誉榜)',
				iconCls : 'icon-edit',
				handler : function() {
					prizeUserEditFun();
				}
			}, '-', {
				text : '添加获奖人(好人好事)',
				iconCls : 'icon-edit',
				handler : function() {
					prizeArticleEditFun();
				}
			}, '-', {
				text : '查看获奖人详情',
				iconCls : 'icon-edit',
				handler : function() {
					userListFun();
				}
			}, '-', {
				text : '开奖',
				iconCls : 'icon-edit',
				handler : function() {
					lotteryFun();
				}
			}]
		});
	}

	function lotteryFun() {

		var rows = $('#admin_prize_datagrid').datagrid('getChecked');
		//	var rows=$('#admin_prize_datagrid').datagrid('getSelected');
		//	var rows=$('#admin_prize_datagrid').datagrid('getSelecteds');

		if (rows.length = 1 && rows[0].isLottery == false && rows[0] != null && rows[0].hhPhones != null ) {
			$.messager.confirm('确认', '您是否确认开奖？', function(r) {
				if (r) {

					$.ajax({
						type: 'patch',
						url : '${pageContext.request.contextPath}/prize/lottery/'+rows[0].id,
						dataType : 'json',
						success : function(d) {
							var v = $('#admin_prize_datagrid');
							v.datagrid('reload');
							v.datagrid('unselectAll');
							v.datagrid('clearChecked');
							$.messager.show({
								title : '提示',
								msg : '开奖成功'
							});
						}
					});

				}
			});

		} else {
			$.messager.show({
				title : '提示',
				msg : '请勾选一个要开奖的选项并确认改记录未开奖,和确认开奖信息的完整！'
			});
		}
	}

	function userListFun() {
		var rows = $('#admin_prize_datagrid').datagrid('getChecked');

		if (rows.length == 1) {

			var d = $('<div/>').dialog({
				width : 1200,
				height : 500,
				href : '${pageContext.request.contextPath}/prize/user-panel/'+ rows[0].hhPhones+","+rows[0].articlePhones,
				modal : true,
				align : 'center',
				title : '当期中奖用户',
				buttons : [ {
					text : '确认',
					handler : function() {
						d.dialog('destroy');
					}
				} ],
				onClose : function() {
					$(this).dialog('destroy');
				},
				onLoad : function() {

				}
			});
		} else {
			$.messager.show({
				title : '提示',
				msg : '请选择开奖期数！'
			});
		}

	}

	function prizeUserEditFun() {
		var rows = $('#admin_prize_datagrid').datagrid('getChecked');

		if (rows.length == 1 && rows[0].isLottery == false) {
			var md = $('<div/>').dialog({
				width : 950,
				height : 400,
				href : '${pageContext.request.contextPath}/prize/useredit-panel',
				modal : true,
				align : 'center',
				title : '获奖人选择',
				buttons : [ {
					text : '随机选择',
					handler : function() {

						var options = $('#prizeUser_datagrid').datagrid('getPager').data("pagination").options;
						var totalRowNum = options.total;
                        var randomnum = Math.ceil(Math.random()*totalRowNum) - 1;
						$('#prizeUser_datagrid').datagrid('checkRow',randomnum);
						var selectSize = $('#prizeUser_datagrid').datagrid('getChecked').length;

						$.messager.show({
							title : '提示',
							msg : "已随机选中：" + selectSize+"人",
						});

					}
				} ,{
					text : '设为中奖人',
					handler : function() {
						var userRows = $('#prizeUser_datagrid').datagrid('getChecked');
						var userIds = [];
						var userNames = [];
						var hhPhones = [];
						if (userRows.length == 2) {
							$.messager.confirm('确认', '您是选择当前用户为中奖用户？', function(r) {
								if (r) {
									for ( var i = 0; i < userRows.length; i++) {
										userIds.push(userRows[i].id);
										userIds.join(',');
										userNames.push(userRows[i].username);
										userNames.join(',');
										hhPhones.push(userRows[i].phone);
										hhPhones.join(',');
									}
									$.ajax({
										type: 'post',
										url : '${pageContext.request.contextPath}/prize/update',
										data : {
											id: rows[0].id,
											userIds : userIds.join(","),
											userNames : userNames.join(","),
											hhPhones : hhPhones.join(",")
										},
										dataType : 'json',
										success : function(d) {
											var v = $('#admin_prize_datagrid');
											v.datagrid('reload');
											v.datagrid('unselectAll');
											v.datagrid('clearChecked');
											md.dialog('destroy');
											$.messager.show({
												title : '提示',
												msg : '选择成功'
											});
										}
									});

								}
							});

						} else {
							$.messager.show({
								title : '提示',
								msg : '请选择两个中奖用户！'
							});
						}


					}
				}],
				onClose : function() {
					$(this).dialog('destroy');
				},
				onLoad : function() {

					//$('#admin_prize_editForm').form('load', rows[0]);

				}
			});
		} else {
			$.messager.alert('提示', '请勾选一个要编辑的选项并确认该记录未开奖！');
		}
	}

	function prizeArticleEditFun() {
		var rows = $('#admin_prize_datagrid').datagrid('getChecked');

		if (rows.length == 1 && rows[0].isLottery == false) {
			var myd = $('<div/>').dialog({
				width : 1050,
				height : 400,
				href : '${pageContext.request.contextPath}/prize/article/edit-panel',
				modal : true,
				align : 'center',
				title : '获奖文章选择',
				buttons : [ {
					text : '随机选择',
					handler : function() {

						var options = $('#admin_prizeArticle_datagrid').datagrid('getPager').data("pagination").options;
						var totalRowNum = options.total - 1;
						var randomnum = Math.ceil(Math.random()*totalRowNum);
						$('#admin_prizeArticle_datagrid').datagrid('checkRow',randomnum);
						var selectSize = $('#admin_prizeArticle_datagrid').datagrid('getChecked').length;

						$.messager.show({
							title : '提示',
							msg : "已随机选中：" + selectSize+"人",
						});

					}
				} ,{
					text : '设为中奖人',
					handler : function() {
						var articleRows = $('#admin_prizeArticle_datagrid').datagrid('getChecked');
						//alert(articleRows[0].user.username+"=="+articleRows[0].user.phone);
						var userIds = [];
						var userNames = [];
						var hhPhones = [];
						if (articleRows.length == 1) {
							$.messager.confirm('确认', '您是选择当前用户为中奖用户？', function(r) {
								if (r) {
//
									for ( var i = 0; i < articleRows.length; i++) {
										userIds.push(articleRows[i].user.id);
										userIds.join(',');
										userNames.push(articleRows[i].user.username);
										userNames.join(',');
										hhPhones.push(articleRows[i].user.phone);
										hhPhones.join(',');
									}

									$.ajax({
										type: 'post',
										url : '${pageContext.request.contextPath}/prize/update',
										data : {
											id: rows[0].id,
											articlePhones : hhPhones.join(",")
										},
										dataType : 'json',
										success : function(d) {
											var v = $('#admin_prize_datagrid');
											v.datagrid('reload');
											v.datagrid('unselectAll');
											v.datagrid('clearChecked');
											myd.dialog('destroy');
											$.messager.show({
												title : '提示',
												msg : '选择成功'
											});
										}
									});

								}
							});

						} else {
							$.messager.show({
								title : '提示',
								msg : '请选择一个中奖用户！'
							});
						}


					}
				}],
				onClose : function() {
					$(this).dialog('destroy');
				},
				onLoad : function() {

					//$('#admin_prize_editForm').form('load', rows[0]);

				}
			});
		} else {
			$.messager.alert('提示', '请勾选一个要编辑的选项并确认该记录未开奖！');
		}
	}


	function prizeEditFun() {
		var rows = $('#admin_prize_datagrid').datagrid('getChecked');
		if (rows.length == 1 && rows[0].isLottery == false) {
			var d = $('<div/>').dialog({
				width : 250,
				height : 150,
				href : '${pageContext.request.contextPath}/prize/edit-panel',
				modal : true,
				align : 'center',
				title : '修改设置',
				buttons : [ {
					text : '修改',
					handler : function() {
						$('#admin_prize_editForm').form('submit', {
							url : '${pageContext.request.contextPath}/prize/update',
							success : function(data) {

								if (data) {
									d.dialog('destroy');
									$('#admin_prize_datagrid').datagrid('load');
									/*$('#admin_book_datagrid').datagrid('updateRow', {
									 index : $('#admin_book_datagrid').datagrid('getRowIndex', rows[0]),
									 row : obj.obj
									 });*/
									$.messager.show({
										title : '提示',
										msg : "修改成功！",
									});
								}else {
									$.messager.show({
										title : '提示',
										msg : "修改失败！",
									});
								}


							}
						});
					}
				} ],
				onClose : function() {
					$(this).dialog('destroy');
				},
				onLoad : function() {

					$('#admin_prize_editForm').form('load', rows[0]);

				}
			});
		} else {
			$.messager.alert('提示', '请勾选一个要编辑的选项并确认该记录未开奖！');
		}
	}

	function prizeAddFun() {

		var d = $('<div/>').dialog({
			width : 250,
			height : 150,
			href : '${pageContext.request.contextPath}/prize/edit-panel',
			modal : true,
			align : 'center',
			title : '添加期数',
			buttons : [ {
				text : '随机生成期数',
				handler : function() {
					prizeRandom();
				}
			} ,{
				text : '添加',
				handler : function() {
					$('#admin_prize_editForm').form('submit', {
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
			}],
			onClose : function() {
				$(this).dialog('destroy');
			},
			onLoad : function() {
				$('#admin_prize_datagrid').form('load', '');
			}
		});

	}

	function prizeRemove() {
		var rows = $('#admin_prize_datagrid').datagrid('getChecked');
		//	var rows=$('#admin_prize_datagrid').datagrid('getSelected');
		//	var rows=$('#admin_prize_datagrid').datagrid('getSelecteds');
		var ids = [];
		if (rows.length > 0 && rows[0].isLottery == false) {
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
							if(d){
								var v = $('#admin_prize_datagrid');
								v.datagrid('reload');
								v.datagrid('unselectAll');
								v.datagrid('clearChecked');
								$.messager.show({
									title : '提示',
									msg : '删除成功！'
								});
							}else{
								var v = $('#admin_prize_datagrid');
								v.datagrid('reload');
								v.datagrid('unselectAll');
								v.datagrid('clearChecked');
								$.messager.show({
									title : '提示',
									msg : '无法删除已开奖的数据！'
								});
							}

						}
					});

				}
			});

		} else {
			$.messager.show({
				title : '提示',
				msg : '请勾选要删除的选项并确认改记录未开奖！'
			});
		}

	}


	function prizeSearchFun() {
		var mykey = $("input[name$='prizekey']").val();
		var searchUrl = '${pageContext.request.contextPath}/prize/search/'+mykey;
		prizeInit(searchUrl);
	}

	function prizeClearFun() {
		$('#admin_prize_layout input[name=prizekey]').val('');
		var initurl = '${pageContext.request.contextPath}/prize/list';
		prizeInit(initurl);
	}

	function prizeRandom() {
		var date = new Date();
		var num = date.getFullYear()+""+(date.getMonth()+1)+""+date.getDate()+""+date.getHours()+""+date.getMinutes()+"";
		$('#prizeNum').val(num);
	}

</script>

<div id="admin_prize_layout" class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'north',title:'查询条件',border:false" style="height: 70px;">
		<form id="user_honer_searchForm">
			检索开奖记录(可模糊查询):<input name="prizekey" /> </a> <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="prizeSearchFun()">查询</a> <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-back'" onclick="prizeClearFun()">清空</a>
		</form>
	</div>
	<div data-options="region:'center',border:false">
		<table id="admin_prize_datagrid" data-options="border:false" style="width: auto"></table>
	</div>
</div>


</body>
</html>
