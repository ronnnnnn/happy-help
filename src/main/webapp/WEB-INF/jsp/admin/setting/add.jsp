<%@ page language="java" pageEncoding="UTF-8"%>

<form id="admin_setting_addForm" method="post">
	<table>
		<input name="id" hidden="true" />
		<input name="status" hidden="true" />
		<tr>
			<th>名称</th>
			<td><input  name="sysType" style="width:100%" class="easyui-validatebox" data-options="required:true" />
			</td>
		</tr>
		<tr>
			<th>值</th>
			<td><input  name="value" style="width:100%" class="easyui-validatebox" data-options="required:true" />
			</td>
		</tr>
		<tr>
			<th>描述</th>
			<td><input  name="typeDescription" style="width:100%" class="easyui-validatebox" data-options="required:true" />
			</td>
		</tr>
	</table>
	
</form>
