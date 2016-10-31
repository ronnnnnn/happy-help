<%@ page language="java" pageEncoding="UTF-8"%>

<form id="admin_setting_addForm" method="post">
	<table>
		<input name="id" hidden="true" />
		<tr>
			<th>类别</th>
			<td><input  name="sysType" style="width:100%" class="easyui-validatebox" data-options="required:true" />
			</td>
		</tr>
		<tr>
			<th>属性名</th>
			<td><input  name="typeName" style="width:100%" class="easyui-validatebox" data-options="required:true" />
			</td>
		</tr>
		<tr>
			<th>属性值</th>
			<td><input  name="typeValue" style="width:100%" class="easyui-validatebox" data-options="required:true" />
			</td>
		</tr>
		<tr>
			<th>描述</th>
			<td><input  name="typeDescription" style="width:100%" class="easyui-validatebox" data-options="required:true" />
			</td>
		</tr>
	</table>
	
</form>
