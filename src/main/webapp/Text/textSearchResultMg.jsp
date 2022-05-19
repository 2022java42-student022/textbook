<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test Serch Result Mg</title>
</head>
<body>

	<h2>教科書検索結果画面</h2>

	<form action="/textbook/Text/textDelete.jsp" method="post">
		<table border="1">
			<tr>
				<th>ISBN</th>
				<th>タイトル</th>
				<th>分類</th>
				<th>著者名</th>
			</tr>
			<tr>
				<td>....</td>
				<td>....</td>
				<td>....</td>
				<td>....</td>
				<td><input type="submit" value="削除"></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" name="button_test" value="変更" onclick="javascript.location.href='/textbook/Text/textChange.jsp'"></td>
				
			</tr>
			<tr>
				<td>12345678</td>
				<td>文学部の本</td>
				<td>文学部系</td>
				<td>著者1</td>
				<td><input type="submit" value="削除"></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" name="button_test" value="変更" onclick="javascript.location.href='/textbook/Text/textChange.jsp'"></td>
			</tr>
			<tr>
				<td>98765432</td>
				<td>教育学部の本</td>
				<td>教育学部系</td>
				<td>著者2</td>
				<td><input type="submit" value="削除"></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" name="button_test" value="変更" onclick="javascript.location.href='/textbook/Text/textChange.jsp'"></td>
			</tr>
			<tr>
				<td>....</td>
				<td>....</td>
				<td>....</td>
				<td>....</td>
				<td><input type="submit" value="削除"></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" name="button_test" value="変更" onclick="javascript.location.href='/textbook/Text/textChange.jsp'"></td>
			</tr>
		</table>
		
		<a href = "/textbook/Text/textSearchMg.jsp">戻る</a>

		<br>
		<br>
	<a href ="/Text/textSearchMember" method="post">戻る</a>

	</form>

</body>
</html>