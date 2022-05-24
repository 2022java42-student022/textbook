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

		<p>
			メール<input type="email" name="email" size="40">
		<p>
		<p>
			パスワード<input type="password" name="pass">
		<p>
		<input type="submit" value="検索">
	</form>
	
		<input type="button" name="back" value="前ページに戻る"
			onclick="javascript:history.back()">
	<input type="button" name="logout" value="ログアウト"
		onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">
</body>
</html>