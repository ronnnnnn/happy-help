<%@ page language="java" pageEncoding="UTF-8"%>
<body>
<script type="text/javascript">
	$(function() {
		var taskinfoId = getCookie('taskinfoId');
		var initurl = '${pageContext.request.contextPath}/taskcomment/list/'+taskinfoId;
		taskcommentInit(initurl);
	});


	function taskcommentInit(myurl) {

	}


//	function taskcommentInit(myurl){
//		$('#admin_taskcomment_datagrid').datagrid({
//			url : myurl,
//			fit : true,
//			pagination : true,
//			idField : 'id',
//			checkOnSelect : false,
//			selectOnCheck : false,
//			fitColumns : true,
//			nowrap : false,
//			rownumbers : true,
//			columns : [ [ {
//				field : 'id',
//				title : '编号',
//				width : fixWidth(0.06),
//				align : 'center',
//				//hidden : true,
//				checkbox : true
//			}, {
//				field : 'context',
//				title : '评论内容',
//				width : fixWidth(0.30),
//				align : 'center',
//			},{
//				field : 'createTime',
//				title : '评论时间',
//				width : fixWidth(0.16),
//				align : 'center',
//			},{
//				field : 'user',
//				title : '评论者信息',
//				width : fixWidth(0.25),
//				align : 'center',
//				formatter : function(value, row, index) {
//					var mstrig = "";
//					try {
//						mstrig = "用户名："+row.user.username+",手机号："+row.user.phone+",昵称："+row.user.nickname;
//						return mstrig;
//					}catch(e){
//						return mstrig;
//					}
//				},
//			}] ],
//			toolbar : [ {
//				text : '删除',
//				iconCls : 'icon-remove',
//				handler : function() {
//					taskcommentRemove();
//				}
//			}]
//		});
//	}




	function taskcommentRemove() {
		var rows = $('#dg').datagrid('getChecked');
		//	var rows=$('#admin_taskcomment_datagrid').datagrid('getSelected');
		//	var rows=$('#admin_taskcomment_datagrid').datagrid('getSelecteds');
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
						url : '${pageContext.request.contextPath}/taskcomment/'+ids,
						dataType : 'json',
						success : function(d) {
							$('#dg').datagrid('reload');
							$('#dg').datagrid('unselectAll');
							$('#dg').datagrid('clearChecked');
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

	function taskcommentSearchFun() {
		var mykey = $("input[name$='taskcommentkey']").val();
		var myarticleId = getCookie('articleId');
		var asearchUrl = '${pageContext.request.contextPath}/taskcomment/list/'+myarticleId+'/'+mykey;
		taskcommentInit(asearchUrl);
	}

	function taskcommentClearFun() {
		$('#admin_taskcomment_layout input[name=taskcommentkey]').val('');

		var articleId = getCookie('articleId');
		var initurl = '${pageContext.request.contextPath}/taskcomment/list/'+articleId;
		taskcommentInit(initurl);
	}

	function taskcommentxsImport() {
		if ($('#taskcommentuploadfile').val() == '') {
			$.messager.show({
				title : '提示',
				msg : '请选择一个jpg文件',
			});
		} else {
			$('#admin_taskcomment_pic_rollingDialog').dialog('open');
			$.ajaxFileUpload({
				url : '${pageContext.request.contextPath}/taskcomment/image',//用于文件上传的服务器端请求地址
				secureuri : true,//是否启用安全提交，一般设置为false
				fileElementId : 'taskcommentuploadfile',//文件上传控件的id
				dataType : 'text',//服务器返回的数据类型
				success : function(data) {
					$('#admin_taskcomment_pic_rollingDialog').dialog('close');
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


	$(function(){
		$('#dg').datagrid({
			view: detailview,
			detailFormatter:function(index,row){
				return '<div style="padding:2px"><table id="ddv-' + index + '"></table></div>';
			},
			onExpandRow: function(index,row){
				$('#ddv-'+index).datagrid({
					url:'${pageContext.request.contextPath}/taskcomment2/list/'+row.id,
					fitColumns:true,
					singleSelect:true,
					rownumbers:true,
					loadMsg:'',
					height:'auto',
					columns:[[
						{field:'context',title:'内容',width:100,align:'center'},
						{field:'createTime',title:'创建时间',width:100,align:'center'},
						{field:'parentUserId',title:'接收者',width:200,align:'center'},
						{field:'childUserId',title:'回复者',width:200,align:'center'}
					]],
					onResize:function(){
						$('#dg').datagrid('fixDetailRowHeight',index);
					},
					onLoadSuccess:function(){
						setTimeout(function(){
							$('#dg').datagrid('fixDetailRowHeight',index);
						},0);
					}
				});
				$('#dg').datagrid('fixDetailRowHeight',index);
			}
		});
	});


	function formatUser(val,row){
		var mstrig = "";
		try {
			mstrig = "用户名："+row.user.username+",手机号："+row.user.phone+",昵称："+row.user.nickname;
		    return mstrig;
		}catch(e){
			return mstrig;
		}
	}
</script>

<div id="admin_taskcomment_layout" class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'north',title:'查询条件',border:false" style="height: 70px;">
		<form id="user_honer_searchForm">
			检索评论(根据评论内容):<input name="taskcommentkey" /> </a> <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="taskcommentSearchFun()">查询</a> <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-back'" onclick="taskcommentClearFun()">清空</a>
		</form>
	</div>
	<div data-options="region:'center',border:false">
		<table id="dg" style="width:100%;height:100%"
			   url='${pageContext.request.contextPath}/taskcomment/list/${taskInfoId}'
			   toolbar="#tb"
			   fitColumns="true" pagination="true" idField="id" fit = "true" checkOnSelect ="false" selectOnCheck = "false" nowrap = "false">
			<thead>
			<tr>
				<th field="id" align="center" width="80" checkbox="true">id</th>
				<th field="context" align="center" width="80">内容</th>
				<th field="createTime" align="center" width="100">创建时间</th>
				<th field="user" align="center" width="80" formatter="formatUser">用户信息</th>
			</tr>
			</thead>
		</table>
		<div id="tb">
			<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="taskcommentRemove()">删除</a>
		</div>
	</div>
	<div id="admin_taskcomment_pic_rollingDialog" class="easyui-dialog" data-options="closed:true,modal:true,title:'提示'" style="width: 300px; height: 70px;" align="center">
		<img alt="上传中。。。" src="${pageContext.request.contextPath}/jslib/imgs/rolling.gif"><br> <a>上传中,请等候...</a>
	</div>
</div>



		<%--fit : true,--%>
		<%--pagination : true,--%>
		<%--idField : 'id',--%>
		<%--checkOnSelect : false,--%>
		<%--selectOnCheck : false,--%>
		<%--fitColumns : true,--%>
		<%--nowrap : false,--%>
		<%--rownumbers : true,--%>


</body>
</html>
