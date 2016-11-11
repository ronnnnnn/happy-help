<%@ page language="java" pageEncoding="UTF-8"%>
<body>
<script type="text/javascript">
	$(function() {
		myprizeinit();
	});


	function myprizeinit(){

		$('#myprize_datagrid').datagrid({
			url : '${pageContext.request.contextPath}/user/${hhPhones}',
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
				field : 'username',
				title : '用户名',
				width : fixWidth(0.06),
				align : 'center',
			},{
				field : 'nickname',
				title : '昵称',
				width : fixWidth(0.06),
				align : 'center',
			},{
				field : 'realName',
				title : '名字',
				width : fixWidth(0.06),
				align : 'center',
			},{
				field : 'userIdentify',
				title : '生份证',
				width : fixWidth(0.06),
				align : 'center',
			},{
				field : 'phone',
				title : '电话',
				width : fixWidth(0.06),
				align : 'center',
			},{
				field : 'currentArea',
				title : '当前常用地',
				width : fixWidth(0.06),
				align : 'center',
			},{
				field : 'contributeScore',
				title : '贡献值',
				width : fixWidth(0.06),
				align : 'center',
			},{
				field : 'honerScore',
				title : '荣誉值',
				width : fixWidth(0.06),
				align : 'center',
			},{
				field : 'gradeTotal',
				title : '评星总分',
				width : fixWidth(0.06),
				align : 'center',
			},{
				field : 'gradeTimes',
				title : '评星次数',
				width : fixWidth(0.06),
				align : 'center',
			},{
				field : 'withdrawAccount',
				title : '提现账户',
				width : fixWidth(0.06),
				align : 'center',
			},{
				field : 'isLocked',
				title : '状态',
				width : fixWidth(0.06),
				align : 'center',
				formatter : function(value, row, index) {
					if (value == true) {
						return '锁定';
					} else {
						return '活动';
					}
				},
			} ] ]
		});
	}


</script>

<div id="myprize_layout" class="easyui-layout" data-options="fit:true,border:false">

	<div data-options="region:'center',border:false">
		<table id="myprize_datagrid" data-options="border:false"></table>
	</div>

</div>

</body>
</html>
