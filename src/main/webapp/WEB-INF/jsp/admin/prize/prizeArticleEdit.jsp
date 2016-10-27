<%@ page language="java" pageEncoding="UTF-8"%>
<body>
<script type="text/javascript">
	$(function() {
		var initurl = '${pageContext.request.contextPath}/article/list';
		prizeArticleInit(initurl);
	});


	function prizeArticleInit(myurl){
		$('#admin_prizeArticle_datagrid').datagrid({
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
		});
	}


</script>

<div id="admin_prizeArticle_layout" class="easyui-layout" data-options="fit:true,border:false">

	<div data-options="region:'center',border:false">
		<table id="admin_prizeArticle_datagrid" data-options="border:false" style="width: auto"></table>
	</div>

</div>


</body>
</html>
