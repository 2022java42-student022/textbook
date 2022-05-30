<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="textbook/CSS/cart.css">
<title>Cart</title>
</head>
<body>
	<div class="contact">
		<h3 class="h3">現在のカートの中身</h3>

		<c:if test="${empty cart.texts }">
		現在、カートは空です。
		</c:if>

		<c:if test="${not empty cart.texts }">
			<table class="order-table">
				<tr>
					<th class="order-th">ISBN</th>
					<th class="order-th">タイトル</th>
					<th class="order-th">分類</th>
					<th class="order-th">著者</th>
					<th class="order-th">金額</th>
					<th class="order-th">使用状況</th>
					<th class="order-th">削除</th>
				</tr>
				<c:forEach items="${cart.texts}" var="text">
					<tr>
						<td class="order-body">${text.ISBN }</td>
						<td class="order-body">${text.title }</td>
						<td class="order-body">${text.dep_name }</td>
						<td class="order-body">${text.author }</td>
						<td class="order-body">${text.price }</td>
						<td class="order-body">${text.use }</td>
						<td class="order-body">
							<form action="/textbook/CartServlet?action=delete" method="post">
								<input type="hidden" name="text_id" value="${text.text_id}">
								<button class="button" type="submit" value="削除">削除</button>
							</form>
						</td>
				</c:forEach>
				<tr>

					<td class="order-total" align="right" colspan="8">総計：${cart.total}円</td>
				</tr>
			</table>
		</c:if>

		<c:if test="${not empty cart.texts }">
			<form action="/textbook/OrderServlet?action=input_member"
				method="post">
				<button class="button" type="submit" value="注文する">注文する</button>
			</form>
		</c:if>
		<br>
		<button class="button" type="button" name="restart" value="教科書再検索"
			onclick="javascript:location.href='/textbook/Text/textSearchMember.jsp'">教科書再検索</button>
		<br>
		<button class="button" type="button" name="back" value="前ページに戻る"
			onclick="javascript:history.back()">前ページに戻る</button>
		<button class="button" type="button" name="logout" value="ログアウト"
			onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">ログアウト</button>
	</div>
</body>
</html>