<%@ page language="java" pageEncoding="UTF-8"%>
<body>
<script type="text/javascript">
	$(function() {
		var articleId = getCookie('articleId');
		var initurl = '${pageContext.request.contextPath}/comment/list/'+articleId;
		commentInit(initurl);
	});


	function commentInit(myurl){
		$('#admin_comment_datagrid').datagrid({
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
					commentRemove();
				}
			}]
		});
	}




	function commentRemove() {
		var rows = $('#admin_comment_datagrid').datagrid('getChecked');
		//	var rows=$('#admin_comment_datagrid').datagrid('getSelected');
		//	var rows=$('#admin_comment_datagrid').datagrid('getSelecteds');
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
							commentClearFun();
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

	function commentSearchFun() {
		var mykey = $("input[name$='commentkey']").val();
		var myarticleId = getCookie('articleId');
		var asearchUrl = '${pageContext.request.contextPath}/comment/list/'+myarticleId+'/'+mykey;
		commentInit(asearchUrl);
	}

	function commentClearFun() {
		$('#admin_comment_layout input[name=commentkey]').val('');

		var articleId = getCookie('articleId');
		var initurl = '${pageContext.request.contextPath}/comment/list/'+articleId;
		commentInit(initurl);
	}

	function commentxsImport() {
		if ($('#commentuploadfile').val() == '') {
			$.messager.show({
				title : '提示',
				msg : '请选择一个jpg文件',
			});
		} else {
			$('#admin_comment_pic_rollingDialog').dialog('open');
			$.ajaxFileUpload({
				url : '${pageContext.request.contextPath}/comment/image',//用于文件上传的服务器端请求地址
				secureuri : true,//是否启用安全提交，一般设置为false
				fileElementId : 'commentuploadfile',//文件上传控件的id
				dataType : 'text',//服务器返回的数据类型
				success : function(data) {
					$('#admin_comment_pic_rollingDialog').dialog('close');
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


</script>

<div id="admin_comment_layout" class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'north',title:'查询条件',border:false" style="height: 70px;">
		<form id="user_honer_searchForm">
			检索评论(根据评论内容):<input name="commentkey" /> </a> <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="commentSearchFun()">查询</a> <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-back'" onclick="commentClearFun()">清空</a>
		</form>
	</div>
	<div data-options="region:'center',border:false">
		<table id="admin_comment_datagrid" data-options="border:false" style="width: auto"></table>
	</div>
	<div id="admin_comment_pic_rollingDialog" class="easyui-dialog" data-options="closed:true,modal:true,title:'提示'" style="width: 300px; height: 70px;" align="center">
		<img alt="上传中。。。" src="${pageContext.request.contextPath}/jslib/imgs/rolling.gif"><br> <a>上传中,请等候...</a>
	</div>
</div>


</body>
</html>
