<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DeleteConfirmation</title>
<link rel="stylesheet" type="text/css"
	href="/textbook/CSS/memRegisterConfirmation.css">
</head>
<body>
	<div align="center">

		<h3>削除確認</h3>

		<form action="/textbook/TextServlet?action=delete" method="post">


			<table class="customer">
				<tr>
					<th class="customer-item">ISBN</th>
					<td class="customer-body"><fmt:formatNumber
							value="${delete_textbooks.ISBN}" pattern="0000000000000" /></td>
				</tr>
				<tr>
					<th class="customer-item">タイトル
					<td class="customer-body">${delete_textbooks.title}</td>
				</tr>

				<tr>
					<th class="customer-item">分類
					<td class="customer-body">${delete_textbooks.dep_name}</td>
				</tr>
				<tr>
					<th class="customer-item">著者
					<td class="customer-body">${delete_textbooks.author}</td>
				</tr>
				<tr>
					<th class="customer-item">金額
					<td class="customer-body">${delete_textbooks.price}</td>
				</tr>
				<tr>
					<th class="customer-item">使用状況
					<td class="customer-body">${delete_textbooks.use}</td>
				</tr>
			</table>

			<div align="center">
				<h5>上記を削除します。よろしいですか？</h5>
			</div>
			<button class="button1" type="submit" value="決定">決定</button>

			<br>
			<button class="button2" name="back" value="前ページに戻る"
				onclick="javascript:history.back()">前ページに戻る</button>
			
			<br>
			<div class="buttons">
			<button class="goodbye" name="logout" value="ログアウト"
				onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">
				ログアウト</button>
			</div>	

		</form>
	</div>	
</body>
</html>