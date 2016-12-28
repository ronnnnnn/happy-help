<%@ page language="java" pageEncoding="UTF-8"%>
<body>
<script type="text/javascript">

	$(function() {
		var withdrawIniturl = '${pageContext.request.contextPath}/withdraw/date';
		withdrawInit(withdrawIniturl);
	});


	function withdrawInit(myurl){
		$('#admin_withdraw_datagrid').datagrid({
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
				title : '申请提现金额',
				width : fixWidth(0.26),
				align : 'center',
				formatter : function(value, row, index) {
					return "申请金额"+value+"元(需转账" + value * 0.985 + "元/服务费"+value * 0.015+"元)"
				}
			},{
				field : 'withdrawAccount',
				title : '提现帐号',
				width : fixWidth(0.10),
				align : 'center',
			},{
				field : 'withdrawAccountType',
				title : '提现类别',
				width : fixWidth(0.04),
				align : 'center',
			},{
				field : 'withdrawAccountName',
				title : '提现帐号名字',
				width : fixWidth(0.06),
				align : 'center',
			},{
				field : 'createTime',
				title : '时间',
				width : fixWidth(0.10),
				align : 'center',
			},{
				field : 'isHande',
				title : '是否完成转账',
				width : fixWidth(0.08),
				align : 'center',
				formatter : function(value, row, index) {
					if(value){
						return "已完成转账"
					}else {
						return "未转账"
					}
				}
			},{
				field : 'user',
				title : '用户信息',
				width : fixWidth(0.08),
				align : 'center',
				formatter : function(value, row, index) {
//					var mstrig = "";
//					try {
//						mstrig = "用户名："+row.user.username+",手机号："+row.user.phone+",昵称："+row.user.nickname;
//						return mstrig;
//					}catch(e){
//						return mstrig;
//					}
					var withdrawtag = '<a onclick=withdrawshowMore("'+row.user.username+','+row.user.phone+','+row.user.nickname+'")>'+row.user.username+'</a>';
					return withdrawtag;
				},
			}] ],
			toolbar : [{
				text : '确认完成转账',
				iconCls : 'icon-remove',
				handler : function() {
					compeltedRequest();
				}
			}]

		});
	}

	function compeltedRequest() {
		var rows = $('#admin_withdraw_datagrid').datagrid('getChecked');
		//	var rows=$('#admin_normal_user_datagrid').datagrid('getSelected');
		//	var rows=$('#admin_normal_user_datagrid').datagrid('getSelecteds');
		var ids = [];
		if (rows.length == 1) {
			$.messager.confirm('确认', '您是否要确认已转账？', function(r) {
				if (r) {
					for ( var i = 0; i < rows.length; i++) {
						ids.push(rows[i].id);
						ids.join(',')
					}
					$.ajax({
						type: 'post',
						url : '${pageContext.request.contextPath}/withdraw/'+ids,
						data : {
							ids : ids.join(',')
						},
						dataType : 'json',
						success : function(d) {
							var v = $('#admin_withdraw_datagrid');
							v.datagrid('reload');
							v.datagrid('unselectAll');
							v.datagrid('clearChecked');
							$.messager.show({
								title : '提示',
								msg : '更新成功'
							});
						}
					});

				}
			});

		} else {
			$.messager.show({
				title : '提示',
				msg : '请勾选一个要确认的选项！'
			});
		}

	}


	function withdrawshowMore(infos) {
		var minfos = infos.split(",");
		$("#withdrawdetail").html("");
		var text = "<h2>用户名:</h2>"+"<h3 width='100%' style='padding-left: 20%'>"+ minfos[0] +"</h3>"
		$("#withdrawdetail").append(text);
		$("#withdrawdetail").append("<hr/>");
		var text2 = "<h2>联系方式:</h2>"+"<h3 width='100%' style='padding-left: 20%'>"+ minfos[1] +"</h3>"
		$("#withdrawdetail").append(text2);
		$("#withdrawdetail").append("<hr/>");
		var text3 = "<h2>昵称:</h2>"+"<h3 width='100%' style='padding-left: 20%'>"+ minfos[2] +"</h3>"
		$("#withdrawdetail").append(text3);
		$("#withdrawdetail").append("<hr/>");
		$('#withdrawdetail').dialog('open');
	}

	function searchwithdrawRecord() {
		var username = "none";
		var isHandle = "false";
		var startTime = "none";
		var endTime = "none";
		if ($('#wt-username').val() != '') {
			var username = $('#wt-username').val();
		}
		if ($('#wt-startTime').datetimebox('getValue') != '') {
			var startTime = $('#wt-startTime').datetimebox('getValue');
		}
		if ($('#wt-endTime').datetimebox('getValue') != '') {
			var endTime = $('#wt-endTime').datetimebox('getValue');
		}
		if ($('#wt-handle').val()!= '') {
			var isHandle = $('#wt-handle').val();
		}
		var wtUrl = '${pageContext.request.contextPath}/withdraw/date?username=' + username + "&isHandle=" + isHandle + "&startTime=" + startTime + "&endTIme=" + endTime ;
		withdrawInit(wtUrl);
	}

</script>

<div id="admin_withdraw_layout" class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'north',title:'查询条件',border:false" style="height: 115px;">

		<div style="float: left;width: 70%">
			<form id="admin_withdraw_searchForm" method="post">
				 用户帐号:  <input id="wt-username" class="easyui-validatebox" />
				是否以充值：	<select  id="wt-handle"  class="esayui-combobox"  name="incomeType"  style="width: 70px" data-options="required:true">
								<option  value='false'>未转账</option>
								<option  value='true'>已转账</option>
							</select>
				<br/>
				开始时间：<input id="wt-startTime" class="easyui-datetimebox" name="wt-startTime"
							data-options="required:true,showSeconds:false"  style="width:150px;margin-top: 5px">
				结束时间：<input id="wt-endTime" class="easyui-datetimebox" name="wt-endTime"
							data-options="required:true,showSeconds:false"  style="width:150px">

				<br/>
				<a  href="#" class="easyui-linkbutton" onclick="searchwithdrawRecord()">查询</a>
				<br/>
			</form>
		</div>
	</div>
	<div data-options="region:'center',border:false">
		<table id="admin_withdraw_datagrid" data-options="border:false" style="width: auto"></table>
	</div>
</div>

<div id="withdrawdetail" class="easyui-dialog"
	 data-options="closed:true,modal:true,title:'显示用户详情',buttons:[{
					text : '确定',
					handler : function() {
                      	$('#withdrawdetail').dialog('close');
					}}]"
	 style="width: 250px; height: 300px;" title="显示详情">
</div>

</body>
</html>
