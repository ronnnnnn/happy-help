<%@ page language="java" pageEncoding="UTF-8"%>
<body>
<script type="text/javascript">

	var feep = null;
	$(function() {
		var platformIniturl = '${pageContext.request.contextPath}/platform/record-data';
		platformInit(platformIniturl);
	});


	function platformInit(myurl){
		$('#admin_platform_datagrid').datagrid({
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
				field : 'incomeType',
				title : '收入/支出',
				width : fixWidth(0.15),
				align : 'center',
			},{
				field : 'description',
				title : '说明',
				width : fixWidth(0.14),
				align : 'center',
			},{
				field : 'user',
				title : '收款/付款用户',
				width : fixWidth(0.14),
				align : 'center',
				formatter : function(value, row, index) {
					return row.user.username;
				}
			},{
				field : 'money',
				title : '金额',
				width : fixWidth(0.16),
				align : 'center',
			},{
				field : 'createTime',
				title : '时间',
				width : fixWidth(0.16),
				align : 'center',
			}] ],

		});
	}


	function platformSearchFun() {
		var platformTradeKey = $("input[name$='platformTradeKey']").val();
		var platformSearchUrl = '${pageContext.request.contextPath}/platform/'+platformTradeKey;
		platformInit(platformSearchUrl);
	}

	function platformClearFun() {
		$('#admin_platform_layout input[name=platformkey]').val('');
		var riniturl = '${pageContext.request.contextPath}/platform/record-data';
		platformInit(riniturl);
	}

	function searchPlatformRecord() {
		if ($('#incomeType').val() == '') {
			$.messager.show({
				title : '提示',
				msg : '请选择一个类别！',
			});
		} else if ($('#p-startTime').datetimebox('getValue') == '') {
			$.messager.show({
				title : '提示',
				msg : '请选择开始时间！',
			});
		} else if ($('#p-endTime').datetimebox('getValue') == '') {
			$.messager.show({
				title : '提示',
				msg : '请选择结束时间！',
			});
		} else {
			var incomeType = $('#incomeType').val();
			var startTime = $('#p-startTime').datetimebox('getValue');
			var endTime = $('#p-endTime').datetimebox('getValue');
			var plrUrl = '${pageContext.request.contextPath}/platform/record-search/'+ incomeType + "/"+startTime.toString()+"/"+endTime.toString();
			platformInit(plrUrl);
		}
	}

</script>

<div id="admin_platform_layout" class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'north',title:'查询条件',border:false" style="height: 115px;">

		<div style="float: left;width: 70%">
			<form id="admin_platform_searchForm" method="post">
				收入/支出：	<select  id="incomeType"  class="esayui-combobox"  name="incomeType"  style="width: 70px" data-options="required:true">
				<option  value='收入'>收入</option>
				<option  value='支出'>支出</option>
			</select>
				<br/>
				开始时间：<input id="p-startTime" class="easyui-datetimebox" name="p-startTime"
							data-options="required:true,showSeconds:false"  style="width:150px;margin-top: 5px">
				结束时间：<input id="p-endTime" class="easyui-datetimebox" name="p-endTime"
							data-options="required:true,showSeconds:false"  style="width:150px">

				<br/>
				<a  href="#" class="easyui-linkbutton" onclick="searchPlatformRecord()">查询</a>
				<br/>
			</form>
		</div>
		<div style="float: right;width: 30%">
			<p style="margin-top: 0px;color: green;font-size: 10px;font-weight: bolder">总收入:$${in}</p>
			<p style="margin-top: 0px;color: red;font-size: 10px;font-weight: bolder">总支出:$${out}</p>
			<p style="margin-top: 0px;color: green;font-size: 10px;font-weight: bolder">普通求助服务费暂放平台金额收入:$${inTemp}</p>
			<p style="margin-top: 0px;color: red;font-size: 10px;font-weight: bolder">普通求助服务费暂放平台金额支出:$${outTemp}</p>

		</div>
	</div>
	<div data-options="region:'center',border:false">
		<table id="admin_platform_datagrid" data-options="border:false" style="width: auto"></table>
	</div>
</div>


</body>
</html>
