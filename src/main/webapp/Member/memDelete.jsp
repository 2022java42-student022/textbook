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

	<form action="/textbook/MemberServlet?action=delete" method="post">

		<p>
			メール<input type="email" name="email" size="40">
		<p>
		<p>
			パスワード<input type="password" name="pass">
		<p>
	</form>
	<a href="/memHome.jsp">戻る</a>
</body>
</html>