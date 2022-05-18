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
		<p>ユーザーID、パスワードをご入力の上、「ログイン」ボタンをクリックしてください。</p>
	</div>

	<form action="/textbook/LoginServlet">


		<input type="text" name="user_id" placeholder="ユーザーIDを入力してください"><br>
		<input type="password" name="pass" placeholder="パスワードを入力してください">

		<input type="submit" value="ログイン"> <select name="login">
			<option value="member">会員</option>
			<option value="manager">管理者</option>
		</select> <br> <br>
		<hr>

	</form>

	<a href="/memRegister.jsp">初めての方はこちら</a>
</body>
</html>