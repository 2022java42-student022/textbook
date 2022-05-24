<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注文内容確認</title>
</head>
<body>

	<h4>下記の内容で注文を行いますか？</h4>
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
			
			<c:forEach items = "${cart.texts}" var = "text">
			<tr>
				<td align = "center">${text.ISBN}</td>
				<td align = "center">${text.title}</td>
				<td align = "center">${text.sort_id}</td>
				<td align = "center">${text.author}</td>
				<td align = "center">${text.price}</td>
				<td align = "center">${text.use}</td>
				<td align = "center">${text.price * text.quantity}</td>
			</tr>
			</c:forEach>
			<tr>
				<td align="right" colspan="7">総計：${cart.total}円</td>
			</tr>
		</table>

		<br>
		<input type="submit" value="この内容で注文"><br>
	<input type="button" name="back" value="前ページに戻る"
		onclick="javascript:history.back()">
	<input type="button" name="logout" value="ログアウト"
		onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">
	</form>

		</c:if>

		<h4>お客様情報</h4>
		<form action="/textbook/OrderServlet?action=order" method="post">
			<table border="1">
				<tr>
					<td>名前</td>
					<td>${check.name}</td>
				</tr>
				<tr>
					<td>住所</td>
					<td>${check.address}</td>
				</tr>
				<tr>
					<td>電話番号</td>
					<td>${check.tel}</td>
				</tr>
				<tr>
					<td>メールアドレス</td>
					<td>${check.mail}</td>
				</tr>
				<tr>
					<td>お支払方法</td>
					<td>${check.pay}</td>
				</tr>
			</table>
			<br> <input type="submit" value="この内容で注文"><br> <a
				href="/textbook/order/memberInfo.jsp">戻る</a>
		</form>


</body>
</html>