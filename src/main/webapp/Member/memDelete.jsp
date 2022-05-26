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

	<form action="/textbook/MemberDeleteServlet" method="post">

		<p>メールアドレス、パスワードをご入力してください。</p>


		<input type="text" name="email" placeholder="メールアドレスを入力してください"><br>
		<input type="password" name="pass" placeholder="パスワードを入力してください"><br>
		


		<input type="submit" value="退会"> <input type="button"
			name="back" value="前ページに戻る" onclick="javascript:history.back()">

		<input type="button" name="logout" value="ログアウト"
			onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">
	</form>
</body>
</html>