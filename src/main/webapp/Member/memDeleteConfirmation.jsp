<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DeleteConfirmation</title>
</head>
<body>

	<h3>退会確認画面</h3>

	<form action="/textbook/MemberServlet?action=decision" method="post">
		<table border="1">
			<tr>
				<td>ID</td>
				<td>名前</td>
				<td>メール</td>
				<td>パスワード</td>
			</tr>



			<tr>
				<td>${member2.user_id}</td>
				<td>${member2.name}</td>
				<td>${member2.email}</td>
				<td>${member2.pass}</td>
			</tr>

		</table>
		<br>
		<table border="0">
			<input type="hidden" name="user_id" value="${member2.user_id}">
			<tr>
				<td><input type="submit" value="削除">
					</form> <input type="button" name="back" value="前ページに戻る"
					onclick="javascript:history.back()"> <input type="button"
					name="logout" value="ログアウト"
					onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">
</body>
</html>