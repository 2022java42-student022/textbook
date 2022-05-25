<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member</title>
</head>
<body>

	<h3>会員変更</h3>

	<form action="/textbook/MemberServlet?action=preChange" method="post">
			<p>名前<input type="text" name="name" value="${member2.name}"> <p>
			<p>メール<input type="email"name="email" value="${member2.email}" size="40"><p>
			<p>パスワード<input type="pass" name="pass" value="${member2.pass}"><p>
		<p><input type="submit" value="送信"></p>
		
		
	</form>
	<input type="button" name="back" value="前ページに戻る"
			onclick="javascript:history.back()">
	<input type="button" name="logout" value="ログアウト"
		onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">
</body>
</html>