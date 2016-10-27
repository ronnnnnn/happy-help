<%@ page language="java" pageEncoding="UTF-8"%>

<form id="admin_article_editForm" method="post">
	<table>
		<input id="art-id" name="id" hidden="true" />
		<tr>
			<th>标题</th>
			<td><input id="art-title" name="title" style="width:100%" class="easyui-validatebox" data-options="required:true" />
			</td>
		</tr>
		<tr>
			<th>内容</th>
			<td><textarea id="art-context" name="context" style="width:100%" class="easyui-validatebox" data-options="required:true" />
			</td>
		</tr>
		<tr>
			<th>插图</th>
			<td><input id="mart-imageUrl" name="imageUrl" style="width:100%" class="easyui-validatebox" data-options="required:true" />
			</td>
		</tr>

	</table>

</form>

<form>
	<table>
		<tr>
			<td width="80px"></td>
			<td style="word-break:break-all;padding-left: 10px;">
				<form id="admin_article_pic_importDialog">
					<input type="file" id="articleuploadfile" name="file" /><br/>
					<a id="btn" href="#" class="easyui-linkbutton" onclick="articlexsImport()" data-options="iconCls:'icon-add'">导入</a>
				</form>
			</td>
		</tr>
	</table>
</form>
