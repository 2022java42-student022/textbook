<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Test Serch Result Member</title>
</head>
<body>

	<h2>教科書検索結果画面</h2>


	<table border="1">
		<tr>
			<th>教科書ID</th>
			<th>ISBN</th>
			<th>タイトル</th>
			<th>分類</th>
			<th>著者</th>
			<th>金額</th>
			<th>使用状況</th>
			<th>カートに追加</th>
		</tr>
		<c:forEach items="${texts}}" var="text">
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td>
			<form action="/textbook/CartServlet?action=add" method="post">
			<input type="submit" value="カートに追加">
			</form>
			</td>
		</tr>
		</c:forEach>
	</table>

	<br>
	<br>

	<input type="button" name="back" value="戻る"
		onclick="javascript:history.back()">
</body>
</html>