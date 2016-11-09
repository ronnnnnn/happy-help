<%@ page language="java" pageEncoding="UTF-8"%>
<body>
<script type="text/javascript">
	$(function() {
		var initurl = '${pageContext.request.contextPath}/article/list';
		articleInit(initurl);
	});


	function articleInit(myurl){
		$('#admin_article_datagrid').datagrid({
			url : myurl,
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
			},{
				field : 'imageUrl',
				title : '插图',
				width : fixWidth(0.15),
				align : 'center',
				formatter : function(value, row, index) {
					return '<a onclick=showPic("'+row.imageUrl+'")>预览图片</a>'
					//return '<img style=\"height: 150px;width: 200px;\" src="'+row.imageUrl+'" />';
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
				field : 'user',
				title : '作者信息',
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
					articleRemove();
				}
			}, '-', {
				text : '修改',
				iconCls : 'icon-edit',
				handler : function() {
					articleEditFun();
				}
			}, '-', {
				text : '通过审核',
				iconCls : 'icon-edit',
				handler : function() {
					articlePass();
				}
			}, '-', {
				text : '评论管理',
				iconCls : 'icon-edit',
				handler : function() {
					commentManage();
				}
			}]
		});
	}

	function showPic(picUrl) {
		$("#mpic").html("");
		var img = "<img src='"+picUrl+"' width='100%' height='100%'/>";
		$("#mpic").append(img);
		$("#mpic").append("<br/><hr/><br/>");
		$('#mpic').dialog('open');
	}

	function articleEditFun() {
		var rows = $('#admin_article_datagrid').datagrid('getChecked');
		if (rows.length == 1) {
			var d = $('<div/>').dialog({
				width : 270,
				height : 250,
				href : '${pageContext.request.contextPath}/article/edit-panel',
				modal : true,
				align : 'center',
				title : '修改文章',
				buttons : [ {
					text : '修改',
					handler : function() {
						var id = $('#art-id').val();
						var title = $('#art-title').val();
						var context = $('#art-context').val();
						var imageUrl = $('#mart-imageUrl').val();

						$.ajax({
							type: 'POST',
							contentType: 'application/json',
							url: '${pageContext.request.contextPath}/article/update',
							processData: false,
							dataType: 'json',
							data : '{"id":\"'+id+'\","title":\"'+title+'\","context":\"'+context+'\","imageUrl":\"'+imageUrl+'\"}',
							success: function(data) {

								d.dialog("destroy");
								$('#admin_article_datagrid').datagrid('load');

							},
							error: function() {
								alert('修改失败');
							}
						});
					}
				} ],
				onClose : function() {
					$(this).dialog('destroy');
				},
				onLoad : function() {

					$('#admin_article_editForm').form('load', rows[0]);

				}
			});
		} else {
			$.messager.alert('提示', '请勾选一个要编辑的选项！');
		}
	}

	function articleAddFun() {

		var d = $('<div/>').dialog({
			width : 400,
			height : 200,
			href : '${pageContext.request.contextPath}/article/edit-panel',
			modal : true,
			align : 'center',
			title : '添加文章',
			buttons : [ {
				text : '添加',
				handler : function() {
					$('#admin_article_editForm').form('submit', {
						url : '${pageContext.request.contextPath}/article',
						success : function(data) {

							if (data) {
								d.dialog('destroy');
								$('#admin_article_datagrid').datagrid('load');
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
				$('#admin_article_datagrid').form('load', '');

			}
		});

	}

	function articleRemove() {
		var rows = $('#admin_article_datagrid').datagrid('getChecked');
		//	var rows=$('#admin_article_datagrid').datagrid('getSelected');
		//	var rows=$('#admin_article_datagrid').datagrid('getSelecteds');
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
						url : '${pageContext.request.contextPath}/article/'+ids,
						data : {
							ids : ids.join(',')
						},
						dataType : 'json',
						success : function(d) {
							articleClearFun();
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

	function articlePass() {
		var rows = $('#admin_article_datagrid').datagrid('getChecked');
		//	var rows=$('#admin_article_datagrid').datagrid('getSelected');
		//	var rows=$('#admin_article_datagrid').datagrid('getSelecteds');
		var ids = [];
		if (rows.length > 0) {
			$.messager.confirm('确认', '您是否要删除当前选中的选项？', function(r) {
				if (r) {
					for ( var i = 0; i < rows.length; i++) {
						ids.push(rows[i].id);
						ids.join(',')
					}
					$.ajax({
						type: 'patch',
						url : '${pageContext.request.contextPath}/article/pass/'+ids,
						data : {
							ids : ids.join(',')
						},
						dataType : 'json',
						success : function(d) {
							articleClearFun();
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


	function articleSearchFun() {
		var mykey = $("input[name$='articlekey']").val();
		var asearchUrl = '${pageContext.request.contextPath}/article/search/'+mykey;
		articleInit(asearchUrl);
	}

	function articleClearFun() {
		$('#admin_article_layout input[name=articlekey]').val('');
		var initurl = '${pageContext.request.contextPath}/article/list';
		articleInit(initurl);
	}

	function articlexsImport() {
		if ($('#articleuploadfile').val() == '') {
			$.messager.show({
				title : '提示',
				msg : '请选择一个jpg文件',
			});
		} else {
			$('#admin_article_pic_rollingDialog').dialog('open');
			$.ajaxFileUpload({
				url : '${pageContext.request.contextPath}/article/image',//用于文件上传的服务器端请求地址
				secureuri : true,//是否启用安全提交，一般设置为false
				fileElementId : 'articleuploadfile',//文件上传控件的id
				dataType : 'text',//服务器返回的数据类型
				success : function(data) {
					$('#admin_article_pic_rollingDialog').dialog('close');
					var obj = jQuery.parseJSON(data);
					if (obj.success) {
						//$('#admin_bookManage_importDialog').dialog('close');
						$('#mart-imageUrl').val(obj.obj);
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


	function commentManage() {
		var rows = $('#admin_article_datagrid').datagrid('getChecked');
		if (rows.length == 1) {
			setCookie('articleId',rows[0].id);
			var url = '${pageContext.request.contextPath}/comment/list-panel';
			addTabs({
				title : '文章评论管理',
				href : url,
				closable : true
			});

		} else {
			$.messager.alert('提示', '请勾选一个要管理的文章！');
		}

	}
</script>

<div id="admin_article_layout" class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'north',title:'查询条件',border:false" style="height: 70px;">
		<form id="user_honer_searchForm">
			检索文章(根据标题):<input name="articlekey" /> </a> <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="articleSearchFun()">查询</a> <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-back'" onclick="articleClearFun()">清空</a>
		</form>
	</div>
	<div data-options="region:'center',border:false">
		<table id="admin_article_datagrid" data-options="border:false" style="width: auto"></table>
	</div>
	<div id="admin_article_pic_rollingDialog" class="easyui-dialog" data-options="closed:true,modal:true,title:'提示'" style="width: 300px; height: 70px;" align="center">
		<img alt="上传中。。。" src="${pageContext.request.contextPath}/jslib/imgs/rolling.gif"><br> <a>上传中,请等候...</a>
	</div>
</div>

<div id="mpic" class="easyui-dialog"
	 data-options="closed:true,modal:true,title:'显示图片',buttons:[{
					text : '确定',
					handler : function() {
                      	$('#mpic').dialog('close');
					}}]"
	 style="width: 350px; height: 300px;" title="添加用户">
</div>

</body>
</html>
