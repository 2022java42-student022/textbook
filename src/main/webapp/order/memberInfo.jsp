<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザー情報確認</title>
</head>
<body>

	<h4>ご注文商品</h4>

	<c:if test="${not empty cart.texts}">
		<table border="1">
			<tr>
				<td>ISBN</td>
				<td>タイトル</td>
				<td>分類</td>
				<td>著者</td>
				<td>金額</td>
				<td>使用状況</td>
				<td>小計</td>
			</tr>

			<c:forEach items="${cart.texts}" var="text">
				<tr>
					<td align="center">${text.ISBN}</td>
					<td align="center">${text.title}</td>
					<td align="center">${text.sort_id}</td>
					<td align="center">${text.author}</td>
					<td align="center">${text.price}</td>
					<td align="center">${text.use}</td>
					<td align="center">${text.price * text.quantity}</td>
				</tr>
			</c:forEach>
			<tr>
				<td align="right" colspan="7">総計：${cart.total}円</td>
			</tr>
		</table>
		</c:if>

		<h4>お客様情報を入力してください。</h4>
		<form action="/textbook/OrderServlet?action=confirm" method="post">
			<table border="1">
				<tr>
					<td>名前</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>住所</td>
					<td><input type="text" name="address"></td>
				</tr>
				<tr>
					<td>電話番号</td>
					<td><input type="text" name="tel"></td>
				</tr>
				<tr>
					<td>メールアドレス</td>
					<td><input type="text" name="mail"></td>
				</tr>
			</table>

			<h4>お支払方法を選択してください。</h4>
			<input type="radio" name="pay" value="クレジットカード">クレジットカード<br>
			<input type="radio" name="pay" value="銀行振込">銀行振込<br> <input
				type="radio" name="pay" value="代引き">代引き<br>
			<br> <input type="submit" value="確認画面へ"><br> <a
				href="/textbook/cart/cart.jsp">戻る</a>
		</form>

	

</body>
</html>