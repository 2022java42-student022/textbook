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
				<th>....</th>
				<th>....</th>
				<th>....</th>
				<th>....</th>
				<th>....</th>
			</tr>
			<tr>
				<th>12345678</th>
				<th>文学部の本</th>
				<th>文学部系</th>
				<th>著者1</th>
				<th><input type = "submit" value = "カートに追加する"></th>
			</tr>
			<tr>
				<th>98765432</th>
				<th>教育学部の本</th>
				<th>教育学部系</th>
				<th>著者2</th>
				<th><input type = "submit" value = "カートに追加する"></th>
			</tr>
			<tr>
				<th>....</th>
				<th>....</th>
				<th>....</th>
				<th>....</th>
			</tr>
		</table>
	</form>



</body>
</html>