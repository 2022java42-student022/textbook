<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member</title>
</head>
<body>

	<h3>会員退会</h3>

	<form action="/textbook/MemberServlet?action=preDelete" method="post">

		<table border="1">
			<tr>
				<td>ID</td>
				<td>名前</td>
				<td>メール</td>
				<td>パスワード</td>
			</tr>



			<tr>
				<td>${member_search.user_id}</td>
				<td>${member_search.name}</td>
				<td>${member_search.email}</td>
				<td>${member_search.pass}</td>
			</tr>

		</table>
	</form>
	<td><input type="submit" value="退会">
		<input type="button" name="back" value="前ページに戻る"
			onclick="javascript:history.back()">
	<input type="button" name="logout" value="ログアウト"
		onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">
</body>
</html>