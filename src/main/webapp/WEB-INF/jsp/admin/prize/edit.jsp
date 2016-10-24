<%@ page language="java" pageEncoding="UTF-8"%>

<form id="admin_prize_editForm" method="post">
	<table>
		<input name="id" hidden="true" />
		<tr>
			<th>开奖期数</th>
			<td><input  name="prizeNum" style="width:100%" class="easyui-validatebox" data-options="required:true" />
			</td>
		</tr>
		<tr>
			<th>开奖金额</th>
			<td><input  name="prizeMoney" style="width:100%" class="easyui-validatebox" data-options="required:true" />
			</td>
		</tr>
	</table>
	
</form>
