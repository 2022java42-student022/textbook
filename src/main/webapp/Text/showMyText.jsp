<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登録済教科書参照</title>
</head>
<body>

<h3>登録済み教科書</h3>

<form action="/textbook/TextServlet?action=inputChange" method="post">

<table border="1">
	<tr><th>ISBN</th><th>タイトル</th><th>分類</th><th>著者名</th></tr>
	<tr><td>....</td><td>....</td><td>....</td><td>....</td><td><input type="submit" value="登録内容変更"></td></tr>
	<tr><td>12345678</td><td>文学部の本</td><td>文学部系</td><td>著者1</td><td><input type="submit" value="登録内容変更"></td></tr>
	<tr><td>98765432</td><td>教育学部の本</td><td>教育学部系</td><td>著者2</td><td><input type="submit" value="登録内容変更"></td></tr>
	<tr><td>....</td><td>....</td><td>....</td><td>....</td><td><input type="submit" value="登録内容変更"></td></tr>
</table>

</form>

<a href="/textbook/Login/memHome.jsp">戻る</a>

</body>
</html>