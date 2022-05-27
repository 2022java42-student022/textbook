<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>お客様情報確認</title>
<link rel = "stylesheet" type = "text/css" href = "/textbook/CSS/memberInfo.css">
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
			</tr>
			<c:forEach items="${cart.texts}" var="text">
				<tr>
					<td align="center">${text.ISBN}</td>
					<td align="center">${text.title}</td>
					<td align="center">${text.dep_name}</td>
					<td align="center">${text.author}</td>
					<td align="center">${text.price}</td>
					<td align="center">${text.use}</td>
				</tr>
			</c:forEach>
			<tr>
				<td align="right" colspan="6">総計：${cart.total}円</td>
			</tr>
		</table>
	</c:if>

	<h4>お客様情報を入力してください。</h4>
	
	<form action="/textbook/OrderServlet?action=confirm" method="post">
		名前：<input type="text" name="name"><br> 住所：<input
			type="text" name="address"><br> 電話番号：<input type="text"
			name="tel"><br> メールアドレス：<input type="email" name="email"><br>
	

		<h4>お支払方法を選択してください。</h4>
		<input type="radio" name="pay" value="クレジットカード">クレジットカード<br>
		<input type="radio" name="pay" value="銀行振込">銀行振込<br> <input
			type="radio" name="pay" value="代引き">代引き<br>
		<br> <button type="submit" value="確認画面へ">確認画面へ</button><br><br> <button
			type="button" name="back" value="前ページに戻る"
			onclick="javascript:location.href='/textbook/cart/cart.jsp'">前ページに戻る</button> <input type="button"
			name="logout" value="ログアウト"
			onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">
	</form>



</body>
</html>