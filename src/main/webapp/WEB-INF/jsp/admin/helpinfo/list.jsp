<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
<script type="text/javascript">

	var hsetting = {
		view: {
			dblClickExpand: false
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		callback: {
			beforeClick: hbeforeClick,
			onClick: honClick
			//onCheck: onCheck
		}
	};

	var hNodes =[
		<c:forEach items="${hcategoryList}" var="ha">
		<c:if test="${not ha.rootNode}">
		{ id:${ha.id}, pId:${ha.parentId}, name:"${ha.categoryName}",},
		</c:if>
		</c:forEach>
	];

	function hbeforeClick(treeId, treeNode) {
		var check = (treeNode && !treeNode.isParent);
		if (!check) alert("只能选择子目录");
		return check;
	}

	function honClick(e, treeId, treeNode) {
		var zTree = $.fn.zTree.getZTreeObj("htree"),
				nodes = zTree.getSelectedNodes(),
				v = "";
		        d = "";
		nodes.sort(function compare(a,b){return a.id-b.id;});
		for (var i=0, l=nodes.length; i<l; i++) {
			v = nodes[i].name;
			d = nodes[i].id;
		}
		if (v.length > 0 ) v = v.substring(0, v.length);
		var cityObj = $("#hcategoryName");
		var hcategoryId = $("#hcategoryId");
		cityObj.attr("value", v);
		hcategoryId.attr("value",d);
	}

	function hshowMenu() {
		var cityObj = $("#hcategoryName");
		var cityOffset = $("#hcategoryName").offset();
		$("#hmenuContent").css({left:30 + "px", top:100 + "px"}).slideDown("fast");

		$("body").bind("mousedown", onBodyDown);
	}

	function hchideMenu() {
		$("#hmenuContent").fadeOut("fast");
		$("body").unbind("mousedown", onBodyDown);
	}

	function onBodyDown(event) {
		if (!(event.target.id == "menuBtn" || event.target.id == "hmenuContent" || $(event.target).parents("#hmenuContent").length>0)) {
			hchideMenu();
		}
	}

	$(function () {
		$.fn.zTree.init($("#htree"), hsetting, hNodes);
		$("#menuBtn").click(hshowMenu);
	});



	function searchhelp() {
		if ($('#hcategoryName').val() == '') {
			$.messager.show({
				title : '提示',
				msg : '请选择一个类别！',
			});
		} else if ($('#startTime').datetimebox('getValue') == '') {
			$.messager.show({
				title : '提示',
				msg : '请选择开始时间！',
			});
		} else if ($('#endTime').datetimebox('getValue') == '') {
			$.messager.show({
				title : '提示',
				msg : '请选择结束时间！',
			});
		} else {
            var categotyId = $('#hcategoryId').val();
            var startTime = $('#startTime').datetimebox('getValue');
            var endTime = $('#endTime').datetimebox('getValue');
            var hlistUrl = '${pageContext.request.contextPath}/helpInfo/list/'+ categotyId + "/"+startTime.toString()+"/"+endTime.toString();
			helpinfoInit(hlistUrl);
		}
	}

	function helpinfoInit(murl) {
      //  var obj = jQuery.parseJSON(datas);
        $('#admin_helpinfo_datagrid').datagrid({
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
				formatter : function(value, row, index) {
					return '<p style="width:100%; line-height:1.4em;height:2.8em;overflow:hidden;text-overflow: ellipsis" data-context="'+row.context+'" onclick="showMoreContent(this)">'+row.context+'</p>'
				},
            },{
                field : 'areaRange',
                title : '推送范围',
                width : fixWidth(0.06),
                align : 'center',
            },{
                field : 'phome',
                title : '电话',
                width : fixWidth(0.06),
                align : 'center',
            },{
                field : 'createTime',
                title : '创建时间',
                width : fixWidth(0.05),
                align : 'center',
            },{
				field : 'needUserNumber',
				title : '所需人数',
				width : fixWidth(0.05),
				align : 'center',
			},{
				field : 'republishTimes',
				title : '重发次数',
				width : fixWidth(0.05),
				align : 'center',
			},{
				field : 'province',
				title : '所在省',
				width : fixWidth(0.05),
				align : 'center',
			},{
				field : 'city',
				title : '所在市',
				width : fixWidth(0.05),
				align : 'center',
			},{
				field : 'area',
				title : '所在市',
				width : fixWidth(0.05),
				align : 'center',
			},{
                field : 'isCompeleted',
                title : '完成状态',
                width : fixWidth(0.05),
                align : 'center',
                formatter : function(value, row, index) {
                    if (value == true) {
                        return '已完成';
                    } else {
                        return '进行中';
                    }
                },
            },{
				field : 'isDeleted',
				title : '是否下架',
				width : fixWidth(0.05),
				align : 'center',
				formatter : function(value, row, index) {
					if (value == true) {
						return '下架';
					} else {
						return '显示中';
					}
				},
			},{
                field : 'user',
                title : '作者信息',
                width : fixWidth(0.2),
                align : 'center',
                formatter : function(value, row, index) {
//                    var mstrig = "";
//                    try {
//                        var total = Number(row.user.gradeTotal);
//                        var time =  Number(row.user.gradeTimes);
//                        var grade = total/time;
//
//                        mstrig = "用户名："+row.user.username+",手机号："+row.user.phone+",昵称："+row.user.nickname+",荣誉值："+row.user.honerScore+",评星："+grade;
//                        return mstrig;
//                    }catch(e){
//                        return mstrig;
//                    }
					var htag = '<a onclick=hpshowMore("'+row.user.username+','+row.user.phone+','+row.user.nickname+'")>'+row.user.username+'</a>';
					return htag;
                },
            }] ],
            toolbar : [ {
                text : '删除',
                iconCls : 'icon-remove',
                handler : function() {
					helpinfoRemove();
                }
            }, '-', {
				text : '下架',
				iconCls : 'icon-edit',
				handler : function() {
					helpinfoUpdateStatus("down");
				}
			}, '-', {
				text : '上架',
				iconCls : 'icon-edit',
				handler : function() {
					helpinfoUpdateStatus("up");
				}
			}]
        });
    }

	function hpshowMore(infos) {
		var minfos = infos.split(",");
		$("#hpdetail").html("");
		var text = "<h2>用户名:</h2>"+"<h3 width='100%' style='padding-left: 20%'>"+ minfos[0] +"</h3>"
		$("#hpdetail").append(text);
		$("#hpdetail").append("<hr/>");
		var text2 = "<h2>联系方式:</h2>"+"<h3 width='100%' style='padding-left: 20%'>"+ minfos[1] +"</h3>"
		$("#hpdetail").append(text2);
		$("#hpdetail").append("<hr/>");
		var text3 = "<h2>昵称:</h2>"+"<h3 width='100%' style='padding-left: 20%'>"+ minfos[2] +"</h3>"
		$("#hpdetail").append(text3);
		$("#hpdetail").append("<hr/>");
		$('#hpdetail').dialog('open');
	}

	function helpinfoUpdateStatus(type) {
		var rows = $('#admin_helpinfo_datagrid').datagrid('getChecked');
		//	var rows=$('#admin_taskinfo_datagrid').datagrid('getSelected');
		//	var rows=$('#admin_taskinfo_datagrid').datagrid('getSelecteds');
		var ids = [];
		if (rows.length > 0) {
			$.messager.confirm('确认', '您是否要修改当前选中选项的状态？', function(r) {
				if (r) {
					for ( var i = 0; i < rows.length; i++) {
						ids.push(rows[i].id);
						ids.join(',')
					}
					$.ajax({
						type: 'patch',
						url : '${pageContext.request.contextPath}/helpInfo/'+ids+"/"+type,
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
							var vh = $('#admin_helpinfo_datagrid');
							vh.datagrid('reload');
							vh.datagrid('unselectAll');
							vh.datagrid('clearChecked');
							$.messager.show({
								title : '提示',
								msg : '修改成功'
							});

						}
					});

				}
			});

		} else {
			$.messager.show({
				title : '提示',
				msg : '请勾选要修改的选项！'
			});
		}

	}


	function helpinfoRemove() {
        var rows = $('#admin_helpinfo_datagrid').datagrid('getChecked');
        //	var rows=$('#admin_helpinfo_datagrid').datagrid('getSelected');
        //	var rows=$('#admin_helpinfo_datagrid').datagrid('getSelecteds');
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
                        url : '${pageContext.request.contextPath}/helpInfo/'+ids,
                        dataType : 'json',
                        success : function(d) {
                        	if(d){
								var v = $('#admin_helpinfo_datagrid');
								v.datagrid('reload');
								v.datagrid('unselectAll');
								v.datagrid('clearChecked');
								$.messager.show({
									title : '提示',
									msg : '删除成功'
								});
							}else{
								$.messager.show({
									title : '提示',
									msg : '不允许删除紧急求助消息,紧急求助消息帮助中'
								})
							}
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



    function helpinfoSearchFun() {
        var mykey = $("input[name$='helpinfokey']").val();
        var tsearchUrl = '${pageContext.request.contextPath}/helpInfo/search/'+mykey;
		helpinfoInit(tsearchUrl);
//        $.ajax({
//            type: 'get',
//            url : tsearchUrl,
//            dataType : 'json',
//            success : function(d) {
//                var da = JSON.stringify(d);
//               helpinfoInit(da);
//            }
//        });
    }

    function helpinfoClearFun() {
        $('#admin_helpinfo_layout input[name=helpinfokey]').val('');
        var initurl = '${pageContext.request.contextPath}/helpinfo/list';
		helpinfoInit(initurl);
    }

    function helpinfoxsImport() {
        if ($('#helpinfouploadfile').val() == '') {
            $.messager.show({
                title : '提示',
                msg : '请选择一个jpg文件',
            });
        } else {
            $('#admin_helpinfo_pic_rollingDialog').dialog('open');
            $.ajaxFileUpload({
                url : '${pageContext.request.contextPath}/helpinfo/image',//用于文件上传的服务器端请求地址
                secureuri : true,//是否启用安全提交，一般设置为false
                fileElementId : 'helpinfouploadfile',//文件上传控件的id
                dataType : 'text',//服务器返回的数据类型
                success : function(data) {
                    $('#admin_helpinfo_pic_rollingDialog').dialog('close');
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


    function helpcommentManage() {
        var rows = $('#admin_helpinfo_datagrid').datagrid('getChecked');
        if (rows.length == 1) {
            setCookie('helpinfoId',rows[0].id);
            var url = '${pageContext.request.contextPath}/helpcomment/list-panel/'+rows[0].id;
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

<div id="admin_helpinfo_layout" class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'north',title:'查询条件',border:false" style="height:100px;">
		<form id="user_honer_searchForm">
			检索帮助消息(根据内容):<input name="helpinfokey" /> </a> <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="helpinfoSearchFun()">查询</a> <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-back'" onclick="helpinfoClearFun()">清空</a>
		</form>
		<form id="admin_helpinfo_gethelpForm" method="post">
			<input type="hidden" id="hcategoryId" name="hhCategoryId" style="width: 10%">
			类别：<input id="hcategoryName" name="hcategoryName" style="width: 10%"> <a id="tmenuBtn" href="#" onclick="hshowMenu()">选择类别</a>
			开始时间：<input id="startTime" class="easyui-datetimebox" name="startTime"
						data-options="required:true,showSeconds:false"  style="width:150px">
			结束时间：<input id="endTime" class="easyui-datetimebox" name="endTime"
						data-options="required:true,showSeconds:false"  style="width:150px"><br/>
			<a  href="#" class="easyui-linkbutton" onclick="searchhelp()">查询求助消息</a>
		</form>
	</div>
	<div data-options="region:'center',border:false">
		<table id="admin_helpinfo_datagrid" data-options="border:false" style="width: auto"></table>
	</div>
	<div id="hmenuContent" class="menuContent" style="display:none; position: absolute;">
		<ul id="htree" class="ztree" style="margin-top:0; width:180px;height: 200px"></ul>
	</div>
</div>
<div id="hpdetail" class="easyui-dialog"
	 data-options="closed:true,modal:true,title:'显示用户详情',buttons:[{
					text : '确定',
					handler : function() {
                      	$('#hpdetail').dialog('close');
					}}]"
	 style="width: 250px; height: 300px;" title="显示详情">
</div>

</body>
</html>
