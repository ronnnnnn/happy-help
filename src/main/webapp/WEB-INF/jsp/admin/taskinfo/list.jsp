<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
<script type="text/javascript">

	var setting = {
		view: {
			dblClickExpand: false
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		callback: {
			beforeClick: cbeforeClick,
			onClick: conClick
			//onCheck: onCheck
		}
	};

	var zNodes =[
		<c:forEach items="${categoryList}" var="ca">
		<c:if test="${not ca.rootNode}">
		{ id:${ca.id}, pId:${ca.parentId}, name:"${ca.categoryName}",},
		</c:if>
		</c:forEach>
	];

	function cbeforeClick(treeId, treeNode) {
		var check = (treeNode && !treeNode.isParent);
		if (!check) alert("只能选择子目录");
		return check;
	}

	function conClick(e, treeId, treeNode) {
		var zTree = $.fn.zTree.getZTreeObj("ttree"),
				nodes = zTree.getSelectedNodes(),
				v = "";
		        d = "";
		nodes.sort(function compare(a,b){return a.id-b.id;});
		for (var i=0, l=nodes.length; i<l; i++) {
			v = nodes[i].name;
			d = nodes[i].id;
		}
		if (v.length > 0 ) v = v.substring(0, v.length);
		var cityObj = $("#categoryName");
		var categoryId = $("#categoryId");
		cityObj.attr("value", v);
		categoryId.attr("value",d);
	}

	function cshowMenu() {
		var cityObj = $("#categoryName");
		var cityOffset = $("#categoryName").offset();
		$("#tmenuContent").css({left:30 + "px", top:100 + "px"}).slideDown("fast");

		$("body").bind("mousedown", onBodyDown);
	}

	function chideMenu() {
		$("#tmenuContent").fadeOut("fast");
		$("body").unbind("mousedown", onBodyDown);
	}

	function onBodyDown(event) {
		if (!(event.target.id == "menuBtn" || event.target.id == "tmenuContent" || $(event.target).parents("#tmenuContent").length>0)) {
			chideMenu();
		}
	}

	$(function () {
		$.fn.zTree.init($("#ttree"), setting, zNodes);
		$("#menuBtn").click(cshowMenu);
	});



	function searchTask() {
		if ($('#categoryName').val() == '') {
			$.messager.show({
				title : '提示',
				msg : '请选择一个类别！',
			});
		} else if ($('#isFree').combobox('getValue') == '') {
			$.messager.show({
				title : '提示',
				msg : '请选择类型！',
			});
		} else if ($('#isCompeleted').combobox('getValue') == '') {
			$.messager.show({
				title : '提示',
				msg : '请选择进度！',
			});
		} else if ($('#isTop').combobox('getValue') == '') {
			$.messager.show({
				title : '提示',
				msg : '请选择是否置顶！',
			});
		} else {
            var categotyId = $('#categoryId').val();
            var isFree = $('#isFree').combobox('getValue');
            var isCompeleted = $('#isCompeleted').combobox('getValue');
            var isTop = $('#isTop').combobox('getValue');
            var listUrl = '${pageContext.request.contextPath}/taskinfo/list/'+ categotyId + "/"+isFree+"/"+isCompeleted+"/"+isTop;
			//alert(listUrl);
			taskinfoInit(listUrl);
		}
	}

	function taskinfoInit(murl) {
      //  var obj = jQuery.parseJSON(datas);
        $('#admin_taskinfo_datagrid').datagrid({
           // data : obj.rows,
            url : murl,
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
                width : fixWidth(0.05),
                align : 'center',
                //hidden : true,
                checkbox : true
            }, {
                field : 'title',
                title : '标题',
                width : fixWidth(0.05),
                align : 'center',
            },{
                field : 'context',
                title : '内容',
                width : fixWidth(0.10),
                align : 'center',
            },{
                field : 'money',
                title : '服务金额',
                width : fixWidth(0.06),
                align : 'center',
            },{
                field : 'phone',
                title : '电话',
                width : fixWidth(0.06),
                align : 'center',
            },{
                field : 'createTime',
                title : '创建时间',
                width : fixWidth(0.05),
                align : 'center',
            },{
                field : 'isFree',
                title : '状态',
                width : fixWidth(0.05),
                align : 'center',
                formatter : function(value, row, index) {
                    if (value == true) {
                        return '无偿服务';
                    } else {
                        return '有偿服务';
                    }
                },
            },{
                field : 'isFree',
                title : '类型',
                width : fixWidth(0.05),
                align : 'center',
                formatter : function(value, row, index) {
                    if (value == true) {
                        return '无偿服务';
                    } else {
                        return '有偿服务';
                    }
                },
            },{
                field : 'isCompeleted',
                title : '进度',
                width : fixWidth(0.03),
                align : 'center',
                formatter : function(value, row, index) {
                    if (value == true) {
                        return '完成';
                    } else {
                        return '未完成';
                    }
                },
            },{
                field : 'isTop',
                title : '是否置顶',
                width : fixWidth(0.05),
                align : 'center',
                formatter : function(value, row, index) {
                    if (value == true) {
                        return '置顶';
                    } else {
                        return '未置顶';
                    }
                },
            },{
                field : 'endTime',
                title : '置顶结束时间',
                width : fixWidth(0.06),
                align : 'center',
            },{
                field : 'isFree',
                title : '状态',
                width : fixWidth(0.03),
                align : 'center',
                formatter : function(value, row, index) {
                    if (value == true) {
                        return '无偿服务';
                    } else {
                        return '有偿服务';
                    }
                },
            },{
                field : 'user',
                title : '作者信息',
                width : fixWidth(0.2),
                align : 'center',
                formatter : function(value, row, index) {
                    var mstrig = "";
                    try {
                        var total = Number(row.user.gradeTotal);
                        var time =  Number(row.user.gradeTimes);
                        var grade = total/time;

                        mstrig = "用户名："+row.user.username+",手机号："+row.user.phone+",昵称："+row.user.nickname+",荣誉值："+row.user.honerScore+",评星："+grade;
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
                    taskinfoRemove();
                }
            }, '-', {
                text : '评论管理',
                iconCls : 'icon-edit',
                handler : function() {
                    taskcommentManage();
                }
            }]
        });
    }

    function taskinfoRemove() {
        var rows = $('#admin_taskinfo_datagrid').datagrid('getChecked');
        //	var rows=$('#admin_taskinfo_datagrid').datagrid('getSelected');
        //	var rows=$('#admin_taskinfo_datagrid').datagrid('getSelecteds');
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
                        url : '${pageContext.request.contextPath}/taskinfo/'+ids,
                        data : {
                            ids : ids.join(',')
                        },
                        dataType : 'json',
                        success : function(d) {
                            <%--var categotyId = $('#categoryId').val();--%>
                            <%--var isFree = $('#isFree').val();--%>
                            <%--var isCompeleted = $('#isCompeleted').val();--%>
                            <%--var isTop = $('#isTop').val();--%>
                            <%--var listUrl = '${pageContext.request.contextPath}/taskinfo/list/'+ categotyId + "/"+isFree+"/"+isCompeleted+"/"+isTop;--%>
                            <%--taskinfoInit(listUrl);--%>
							var v = $('#admin_taskinfo_datagrid');
							v.datagrid('reload');
							v.datagrid('unselectAll');
							v.datagrid('clearChecked');
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



    function taskinfoSearchFun() {
        var mykey = $("input[name$='taskinfokey']").val();
        var tsearchUrl = '${pageContext.request.contextPath}/taskinfo/search/'+mykey;
        taskinfoInit(tsearchUrl);
//        $.ajax({
//            type: 'get',
//            url : tsearchUrl,
//            dataType : 'json',
//            success : function(d) {
//                var da = JSON.stringify(d);
//               taskinfoInit(da);
//            }
//        });
    }

    function taskinfoClearFun() {
        $('#admin_taskinfo_layout input[name=taskinfokey]').val('');
        var initurl = '${pageContext.request.contextPath}/taskinfo/list';
        taskinfoInit(initurl);
    }

    function taskinfoxsImport() {
        if ($('#taskinfouploadfile').val() == '') {
            $.messager.show({
                title : '提示',
                msg : '请选择一个jpg文件',
            });
        } else {
            $('#admin_taskinfo_pic_rollingDialog').dialog('open');
            $.ajaxFileUpload({
                url : '${pageContext.request.contextPath}/taskinfo/image',//用于文件上传的服务器端请求地址
                secureuri : true,//是否启用安全提交，一般设置为false
                fileElementId : 'taskinfouploadfile',//文件上传控件的id
                dataType : 'text',//服务器返回的数据类型
                success : function(data) {
                    $('#admin_taskinfo_pic_rollingDialog').dialog('close');
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


    function taskcommentManage() {
        var rows = $('#admin_taskinfo_datagrid').datagrid('getChecked');
        if (rows.length == 1) {
            setCookie('taskinfoId',rows[0].id);
            var url = '${pageContext.request.contextPath}/taskcomment/list-panel/'+rows[0].id;
            addTabs({
                title : '帮助消息评论管理',
                href : url,
                closable : true
            });

        } else {
            $.messager.alert('提示', '请勾选一个要管理的文章！');
        }

    }

</script>

<div id="admin_taskinfo_layout" class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'north',title:'查询条件',border:false" style="height:100px;">
		<form id="user_honer_searchForm">
			检索帮助消息(根据标题):<input name="taskinfokey" /> </a> <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="taskinfoSearchFun()">查询</a> <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-back'" onclick="taskinfoClearFun()">清空</a>
		</form>
		<form id="admin_taskinfo_getTaskForm" method="post">
			<input type="hidden" id="categoryId" name="hhCategoryId" style="width: 10%">
			类别：<input id="categoryName" name="categoryName" style="width: 10%"> <a id="tmenuBtn" href="#" onclick="cshowMenu()">选择类别</a>
			类型：<select id="isFree" name="isFree" class="easyui-combobox" style="width: 10%">
			           <option value="true">无偿服务</option>
			           <option value="false">有偿服务</option>
		          </select>
			进度：<select id="isCompeleted" name="isCompeleted" class="easyui-combobox" style="width: 10%">
						<option value="true">完成</option>
						<option value="false">未完成</option>
		           </select>
			是否置顶：<select id="isTop" name="isTop" class="easyui-combobox" style="width: 10%">
							<option value="true">置顶</option>
							<option value="false">未置顶</option>
						</select> <br>
			<a  href="#" class="easyui-linkbutton" onclick="searchTask()">查询求助消息</a>
		</form>
	</div>
	<div data-options="region:'center',border:false">
		<table id="admin_taskinfo_datagrid" data-options="border:false" style="width: auto"></table>
	</div>
	<div id="tmenuContent" class="menuContent" style="display:none; position: absolute;">
		<ul id="ttree" class="ztree" style="margin-top:0; width:180px;height: 200px"></ul>
	</div>
</div>


</body>
</html>
