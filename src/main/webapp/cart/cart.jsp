<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
</head>
<body>
	
	<h3>現在のカートの中身</h3>

	<c:if test="${empty cart.texts }">
	現在、カートは空です。
	</c:if>

	<c:if test="${not empty cart.texts }">
		<table border="1">
			<tr>
				<th>ISBN</th>
				<th>タイトル</th>
				<th>分類</th>
				<th>著者</th>
				<th>金額</th>
				<th>使用状況</th>
				<th>削除</th>
			</tr>
			<c:forEach items="${cart.texts}" var="text">
				<tr>
					<td>${text.ISBN }</td>
					<td>${text.title }</td>
					<td>${text.dep_name }</td>
					<td>${text.author }</td>
					<td>${text.price }</td>
					<td>${text.use }</td>
					<td>
						<form action="/textbook/CartServlet?action=delete" method="post">
							<input type="hidden" name="text_id" value="${text.text_id}">
							<input type="submit" value="削除">
						</form>
					</td>
			</c:forEach>
			<tr>

				<td align="right" colspan="8">総計：${cart.total}円</td>
			</tr>
		</table>
	</c:if>

	<c:if test="${not empty cart.texts }">
		<form action="/textbook/OrderServlet?action=input_member"
			method="post">
			<input type="submit" value="注文する">
		</form>
	</c:if>
	<br>
	<input type="button" name="restart" value="教科書再検索"
				onclick="javascript:location.href='/textbook/Text/textSearchMember.jsp'">
	<br>
	<input type="button" name="back" value="前ページに戻る"
		onclick="javascript:history.back()">
	<input type="button" name="logout" value="ログアウト"
		onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">

</body>
</html>