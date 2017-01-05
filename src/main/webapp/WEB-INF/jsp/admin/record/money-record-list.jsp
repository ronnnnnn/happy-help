<%@ page language="java" pageEncoding="UTF-8"%>
<body>
<script type="text/javascript">
	$(function() {
		var moneyIniturl = '${pageContext.request.contextPath}/money/record-data';
		moneyInit(moneyIniturl);
	});


	function moneyInit(myurl){
		$('#admin_money_datagrid').datagrid({
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
				field : 'tradeOrderNo',
				title : '订单号',
				width : fixWidth(0.15),
				align : 'center',
			},{
				field : 'paidType',
				title : '类别',
				width : fixWidth(0.10),
				align : 'center',
			},{
				field : 'descript',
				title : '说明',
				width : fixWidth(0.16),
				align : 'center',
			},{
				field : 'money',
				title : '充值金额',
				width : fixWidth(0.10),
				align : 'center',
			},{
				field : 'createTime',
				title : '时间',
				width : fixWidth(0.16),
				align : 'center',
			},{
				field : 'isValied',
				title : '是否校验',
				width : fixWidth(0.16),
				align : 'center',
				formatter : function(value, row, index) {
					if (value == true){
						return "支付成功";
					} else {
						return "支付失败";
					}
				}
			},{
				field : 'user',
				title : '用户信息',
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

		});
	}


	function moneySearchFun() {
		var tradeKey = $("input[name$='moneykey']").val();
		var moneySearchUrl = '${pageContext.request.contextPath}/money/'+tradeKey;
		moneyInit(moneySearchUrl);
	}

	function moneyClearFun() {
		$('#admin_money_layout input[name=moneykey]').val('');
		var initurl = '${pageContext.request.contextPath}/money/record-data/';
		moneyInit(initurl);
	}


</script>

<div id="admin_money_layout" class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'north',title:'查询条件',border:false" style="height: 70px;">
		<form id="user_honer_searchForm">
			检索评论(根据订单号):<input name="moneykey" /> </a> <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="moneySearchFun()">查询</a> <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-back'" onclick="moneyClearFun()">清空</a>
		</form>
	</div>
	<div data-options="region:'center',border:false">
		<table id="admin_money_datagrid" data-options="border:false" style="width: auto"></table>
	</div>
</div>


</body>
</html>
