<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Test Serch Result Mg</title>
</head>
<body>

	<h2>教科書検索結果画面</h2>


	<table border="1">
		<tr>
			<th>ISBN</th>
			<th>タイトル</th>
			<th>分類</th>
			<th>著者</th>
			<th>金額</th>
			<th>使用状況</th>
		</tr>
		<c:forEach items="${texts}" var="text">
			<tr>
				<td>${text.ISBN}</td>
				<td>${text.title}</td>
				<td>${text.dep_name}</td>
				<td>${text.author}</td>
				<td>${text.price}</td>
				<td>${text.use}</td>
				<td>
					<form action="/textbook/TextServlet?action=preChange" method="post">
						<input type="hidden" name="text_id" value="${text.text_id}">
						<input type="submit" value="登録内容変更">
					</form>
					<form action="/textbook/TextServlet?action=delete" method="post">
						<input type="hidden" name="text_id" value="${text.text_id}">
						<input type="submit" value="登録削除">
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>

	<br>
	<br>

	<input type="button" name="back" value="前ページに戻る"
			onclick="javascript:history.back()">
    <input type="button" name="logout" value="ログアウト"
		    onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">
</body>
</html>