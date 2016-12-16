<%@ page language="java" pageEncoding="UTF-8"%>
<body>
<script type="text/javascript">

	var feep = null;
	$(function() {
		var orderIniturl = '${pageContext.request.contextPath}/order/record-data';

		$.ajax({
			type: 'get',
			url : '${pageContext.request.contextPath}/api/v1/anon/service/fee',
			dataType : 'json',
			success : function(d) {
				feep = d.result.typeValue;
				orderInit(orderIniturl,feep/100);
			}
		});
	});


	function orderInit(myurl,feep){
		$('#admin_order_datagrid').datagrid({
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
				field : 'tradeNo',
				title : '订单号',
				width : fixWidth(0.15),
				align : 'center',
			},{
				field : 'orderType',
				title : '类别',
				width : fixWidth(0.14),
				align : 'center',
			},{
				field : 'secondType',
				title : '说明',
				width : fixWidth(0.16),
				align : 'center',
			},{
				field : 'payUser',
				title : '付款方',
				width : fixWidth(0.16),
				align : 'center',
			},{
				field : 'acceptUser',
				title : '收款方',
				width : fixWidth(0.16),
				align : 'center',
				formatter : function(value, row, index) {
					if (row.orderType == '普通求助消息' && row.secondType == '有偿求助'){
						return value+'(平台收取手续费)';
					} else {
						return value;
					}
				}
			},{
				field : 'dealMoney',
				title : '交易金额',
				width : fixWidth(0.10),
				align : 'center',
				formatter : function(value, row, index) {
                    if (row.orderType == '普通求助消息' && row.secondType == '有偿求助'){
                    	return value+'元+(手续费:'+value*feep+'元)';
					} else {
						return value+'元';
					}
				}
			},{
				field : 'createTime',
				title : '时间',
				width : fixWidth(0.16),
				align : 'center',
			},{
				field : 'isCompeleted',
				title : '是否完结',
				width : fixWidth(0.16),
				align : 'center',
				formatter : function(value, row, index) {
					if (value == true){
						return "已完结";
					} else {
						return "未完结";
					}
				}
			}] ],

		});
	}


	function orderSearchFun() {
		var orderTradeKey = $("input[name$='orderTradeKey']").val();
		var orderSearchUrl = '${pageContext.request.contextPath}/order/'+orderTradeKey;
		orderInit(orderSearchUrl);
	}

	function orderClearFun() {
		$('#admin_order_layout input[name=orderkey]').val('');
		var riniturl = '${pageContext.request.contextPath}/order/record-data';
		orderInit(riniturl);
	}


</script>

<div id="admin_order_layout" class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'north',title:'查询条件',border:false" style="height: 70px;">
		<form id="user_honer_searchForm">
			检索评论(根据订单号):<input name="orderTradeKey" /> </a> <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="orderSearchFun()">查询</a> <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-back'" onclick="orderClearFun()">清空</a>
		</form>
	</div>
	<div data-options="region:'center',border:false">
		<table id="admin_order_datagrid" data-options="border:false" style="width: auto"></table>
	</div>
</div>


</body>
</html>
