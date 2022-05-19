<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test Serch Result Menber</title>
</head>
<body>

	<h2>教科書検索結果画面</h2>

	<form action="/textbook/CartServlet?action=add" method="post">
		<table border="1">
			<tr>
				<th>ISBN</th>
				<th>タイトル</th>
				<th>分類</th>
				<th>著者名</th>
				<th></th>
			</tr>
			<tr>
				<td>....</td>
				<td>....</td>
				<td>....</td>
				<td>....</td>
				<td>....</td>
			</tr>
			<tr>
				<td>12345678</td>
				<td>文学部の本</td>
				<td>文学部系</td>
				<td>著者1</td>
				<td><input type = "submit" value = "カートに追加する"></td>
			</tr>
			<tr>
				<td>98765432</td>
				<td>教育学部の本</td>
				<td>教育学部系</td>
				<td>著者2</td>
				<td><input type = "submit" value = "カートに追加する"></td>
			</tr>
			<tr>
				<td>....</td>
				<td>....</td>
				<td>....</td>
				<td>....</td>
			</tr>
		</table>
		<br>
		&nbsp;&nbsp;&nbsp;&nbsp; <!-- JavaScript -->
	<input type="button" name="button_test" value="カートを見る" onclick="javascript:location.href='/textbook/cart/cart.jsp'">
		&nbsp;&nbsp;&nbsp;&nbsp; <!-- JavaScript -->
	<input type="button" name="button_test" value="戻る" onclick="javascript:history.back()">
	</form>



</body>
</html>