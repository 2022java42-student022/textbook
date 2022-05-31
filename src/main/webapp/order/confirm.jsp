<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注文内容確認</title>
<link rel="stylesheet" type="text/css"
	href="/textbook/CSS/memberInfo.css">
</head>
<body>

	<div class="contact">

		<h3>下記の内容で注文を行いますか？</h3>
		<h3>ご注文商品</h3>
		<form action="/textbook/OrderServlet?action=order" method="post">
			<c:if test="${not empty cart.texts}">
				<table class="order-table">
					<tr>
						<th class="order-th">ISBN</th>
						<th class="order-th">タイトル</th>
						<th class="order-th">分類</th>
						<th class="order-th">著者</th>
						<th class="order-th">金額</th>
						<th class="order-th">使用状況</th>
					</tr>

					<c:forEach items="${cart.texts}" var="text">
						<tr>
							<td class="order-body">${text.ISBN}</td>
							<td class="order-body">${text.title}</td>
							<td class="order-body">${text.dep_name}</td>
							<td class="order-body">${text.author}</td>
							<td class="order-body">${text.price}</td>
							<td class="order-body">${text.use}</td>
						</tr>
					</c:forEach>
					<tr>
						<td align="right" colspan="7">総計：${cart.total}円</td>
					</tr>
				</table>
			</c:if>

			<h3>お客様情報</h3>
			<table class = "customer">
				<tr>
					<th class="customer-item">名前</th>
					<td class="customer-body">${check.name}</td>
				</tr>
				<tr>
					<th class="customer-item">住所</th>
					<td class="customer-body">${check.address}</td>
				</tr>
				<tr>
					<th class="customer-item">電話番号</th>
					<td class="customer-body">${check.tel}</td>
				</tr>
				<tr>
					<th class="customer-item">メールアドレス</th>
					<td class="customer-body">${check.email}</td>
				</tr>
				<tr>
					<th class="customer-item">お支払方法</th>
					<td class="customer-body">${check.pay}</td>
				</tr>
			</table>
			<br>
			
				<button class="button1" type="submit" value="この内容で注文">この内容で注文</button><br>
				<button class="button2" type="button" name="back" value="前ページに戻る"
					onclick="javascript:location.href='/textbook/order/memberInfo.jsp'">前ページに戻る</button><br>
				<button class="goodbye" type="button" name="logout" value="ログアウト"
					onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">ログアウト</button><br>
			
		</form>
	</div>
</body>
</html>