<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>お客様情報確認</title>
<link rel="stylesheet" type="text/css"
	href="/textbook/CSS/memberInfo.css">
</head>
<body>

	<div class="contact">
		<h3>ご注文商品</h3>

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
						<td class="order-body"><fmt:formatNumber value="${text.ISBN}"
							pattern="0000000000000" />${text.ISBN}</td>
						<td class="order-body">${text.title}</td>
						<td class="order-body">${text.dep_name}</td>
						<td class="order-body">${text.author}</td>
						<td class="order-body">${text.price}</td>
						<td class="order-body">${text.use}</td>
					</tr>
				</c:forEach>
				<tr>
					<td class="order-total" align="right" colspan="6">総計：${cart.total}円</td>
				</tr>
			</table>
		</c:if>

		<h3>お客様情報の確認・変更</h3>

		<form action="/textbook/OrderServlet?action=confirm" method="post">
			<table class="customer">
				<tr>
					<th class="customer-item">名前</th>
					<td class="customer-body"><input type="text" name="name"
						class="form-text" value="${mem_detail.name}"></td>
				</tr>
				<tr>
					<th class="customer-item">住所</th>
					<td class="customer-body"><input type="text" name="address"
						class="form-text" value="${mem_detail.address}"></td>
				</tr>
				<tr>
					<th class="customer-item">電話番号</th>
					<td class="customer-body"><input type="text" name="tel"
						class="form-text" value="${mem_detail.tel}"></td>
				</tr>
				<tr>
					<th class="customer-item">メールアドレス</th>
					<td class="customer-body"><input type="email" name="email"
						class="form-text" value="${mem_detail.email}"></td>
				</tr>
				<tr>
					<th class="customer-item">支払い方法</th>
					<td class="customer-body"><label class="customer-pay">
							<input type="radio" name="pay" value="クレジットカード" />クレジットカード
					</label> <label class="customer-pay"> <input type="radio"
							name="pay" value="銀行振込" />銀行振込
					</label> <label class="customer-pay"> <input type="radio"
							name="pay" value="代引き" />代引き
					</label></td>
				</tr>
			</table>
			<br>


			<button class="button1" type="submit" value="確認画面へ">確認画面へ</button><br>
			<button class="button2" type="button" name="back" value="前ページに戻る"
				onclick="javascript:location.href='/textbook/cart/cart.jsp'">前ページに戻る</button><br>
			<button class="goodbye" type="button" name="logout" value="ログアウト"
				onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">ログアウト</button><br>

		</form>
	</div>

</body>
</html>