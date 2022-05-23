<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン</title>
</head>
<body>
	<div class="login_form_top">
		<h1>ログイン画面</h1>
		<p>メールアドレス、パスワードをご入力の上、「ログイン」ボタンをクリックしてください。</p>
	</div>

	<form action="/textbook/LoginServlet" method="post">


		<input type="text" name="user_id" placeholder="IDを入力してください"><br>
		<input type="password" name="pass" placeholder="パスワードを入力してください">

		<input type="submit" value="ログイン">
		<input type="hidden" name="action" value="login">
		 <select name="login">
			<option value="member">会員</option>
			<option value="manager">管理者</option>
		</select> <br> <br>
		<hr>

	</form>

	<a href="Member/memRegister.jsp">初めての方はこちら</a>
</body>
</html>