<%@ page language="java" pageEncoding="UTF-8"%>
<body>
<script type="text/javascript">
	$(function() {
		var taskInfoId = ${taskInfoId};
		var initurl = '${pageContext.request.contextPath}/taskContract/list/'+taskInfoId;
		taskContractInit(initurl);
	});


	function taskContractInit(myurl){
		$('#admin_taskContract_datagrid').datagrid({
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
				field : 'money',
				title : '金额',
				width : fixWidth(0.30),
				align : 'center',
			}, {
				field : 'status',
				title : '状态',
				width : fixWidth(0.30),
				align : 'center',
				formatter : function(value, row, index) {
					if (row.status == 0){
						return "用户愿意进行帮助(无偿)";
					}else if (row.status == 1){
						return "帮助消息发布者同意其进行帮助";
					}else if (row.status == 2){
						return "用户完成帮助";
					}else if (row.status == 3){
						return "帮助消息发布者确认完成帮助";
					}else if (row.status == 5){
						return "用户愿意进行帮助不提价(有偿)";
					}else if (row.status == 6){
						return "用户申请提价阶段";
					}else if (row.status == 7){
						return "帮助消息发布者还价阶段";
					}else if (row.status == 8){
						return "用户接受议价";
					}else if (row.status == 9){
						return "发布者接受议价";
					}else if (row.status == 10){
						return "帮助消息发布者同意其完成任务";
					}else if (row.status == 11){
						return "用户完成任务";
					}else if (row.status == 12){
						return "帮助消息发布者确认完成任务";
					}else if (row.status == 13){
						return "帮助消息发布者终止任务";
					}
				},

			},{
				field : 'createTime',
				title : '时间',
				width : fixWidth(0.16),
				align : 'center',
			},{
				field : 'user',
				title : '愿意帮助者',
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
				text : '同意终止交易',
				iconCls : 'icon-edit',
				handler : function() {
					taskContractCompeleted();
				}
			}]
		});
	}


	function taskContractCompeleted() {
		var rows = $('#admin_taskContract_datagrid').datagrid('getChecked');
		//	var rows=$('#admin_helpinfo_datagrid').datagrid('getSelected');
		//	var rows=$('#admin_helpinfo_datagrid').datagrid('getSelecteds');
		var ids = [];
		if (rows.length == 1) {
			$.messager.confirm('确认', '同意终止交易后,服务费将退还给发布者,是否继续？', function(r) {
				if (r) {
					for ( var i = 0; i < rows.length; i++) {
						ids.push(rows[i].id);
						ids.join(',')
					}
					$.ajax({
						type: 'post',
						url : '${pageContext.request.contextPath}/taskContract/compeleted/'+ids,
						dataType : 'json',
						success : function(d) {
							if(d){
								var v = $('#admin_helpinfo_datagrid');
								v.datagrid('reload');
								v.datagrid('unselectAll');
								v.datagrid('clearChecked');
								$.messager.show({
									title : '提示',
									msg : '操作成功!'
								});
							}else{
								$.messager.show({
									title : '提示',
									msg : '用户操作阶段,不允许操作!'
								})
							}
						}
					});

				}
			});

		} else {
			$.messager.show({
				title : '提示',
				msg : '请勾选要一个选项！'
			});
		}

	}


</script>

<div id="admin_taskContract_layout" class="easyui-layout" data-options="fit:true,border:false">

	<div data-options="region:'center',border:false">
		<table id="admin_taskContract_datagrid" data-options="border:false" style="width: auto"></table>
	</div>

</div>


</body>
</html>
