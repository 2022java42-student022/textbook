<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Test Serch Result Mg</title>
<link rel="stylesheet" type="text/css"
	href="/textbook/CSS/textChange.css">
</head>
<body>

	<h2>教科書検索結果画面</h2>


	<table class="">
		<tr>
			<th class="order-th">ISBN</th>
			<th class="order-th">タイトル</th>
			<th class="order-th">分類名</th>
			<th class="order-th">著者</th>
			<th class="order-th">金額</th>
			<th class="order-th">使用状況</th>
		</tr>
		<c:forEach items="${texts}" var="text">
			<tr>
				<td><fmt:formatNumber value="${text.ISBN}"
						pattern="0000000000000" /></td>
				<td class="order-body">${text.title}</td>
				<td class="order-body">${text.dep_name}</td>
				<td class="order-body">${text.author}</td>
				<td class="order-body">${text.price}</td>
				<td class="order-body">${text.use}</td>
				<td class="order-body">
					<form action="/textbook/TextServlet?action=inputChange"
						method="post">
						<input type="hidden" name="text_id" value="${text.text_id}">
						<button class="goodbye" type="submit" value="登録内容変更">登録内容変更</button>
					</form>
					<form action="/textbook/TextServlet?action=predelete" method="post">
						<input type="hidden" name="text_id" value="${text.text_id}">
						<button class = "goodbye" type="submit" value="登録削除">登録削除</button>
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>

	<br>
	<br>

	<button class = "button2" type="button" name="back" value="前ページに戻る"
		onclick="javascript:history.back()">前ページに戻る</button><br>
	<button class = "goodbye" type="button" name="logout" value="ログアウト"
		onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">ログアウト</button>
</body>
</html>