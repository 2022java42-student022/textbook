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

<table border="1">
	<tr><th>ISBN</th><th>タイトル</th><th>分類</th><th>著者名</th></tr>
	<tr><th>....</th><th>....</th><th>....</th><th>....</th></tr>
	<tr><th>12345678</th><th>文学部の本</th><th>文学部系</th><th>著者1</th></tr>
	<tr><th>98765432</th><th>教育学部の本</th><th>教育学部系</th><th>著者2</th></tr>
	<tr><th>....</th><th>....</th><th>....</th><th>....</th></tr>
</table>

<br><br>

<form action="/TextServlet?" method="post">削除
<input type ="hidden" name="action" value="delete">
<input type ="hidden" name="text_id" value="">
</form>

<form action="/TextServlet?" method="post">登録内容変更
<input type ="hidden" name="action" value="change">
<input type ="hidden" name="text_id" value="">
</form>

</body>
</html>