<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.time.LocalDate" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注文完了</title>
<link rel="stylesheet" type="text/css"
	href="/textbook/CSS/order.css">
</head>
<body>
<% LocalDate today = LocalDate.now(); %>

	<div class="contact">
		<h3>ご注文ありがとうございます。</h3>

		<table class="order-table">
			<tr>
				<th class="order-th">注文日</th>
				<td class="order-body"><%= today %></td>
			</tr>
			<tr>
				<th class="order-th">注文番号</th>
				<td class="order-body">${orderID}</td>
			</tr>
			<tr>
				<%--<th class="order-th">注文の合計</th>
				<td class="order-body">${cart.total}</td>--%>
			</tr>
		</table>
		<br>
		<div class="buttons">
			<button class="goodbye" type="button" name="restart" value="ホームページへ"
				onclick="javascript:location.href='/textbook/Login/memHome.jsp'">ホームへ</button>
			<button class="goodbye" type="button" name="logout" value="ログアウト"
				onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">ログアウト</button>
		</div>
	</div>
</body>
</html>