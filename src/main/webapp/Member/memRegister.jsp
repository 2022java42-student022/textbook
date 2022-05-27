<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
</head>
<body>

<h3>会員登録</h3>

<form action="/textbook/MemberServlet?action=preRegister" method="post">
			<p>名前<input type="text" name="name" placeholder="名前を入力してください" > <p>
			<p>メール<input type="email"name="email" size="40" placeholder="メールアドレスを入力してください"><p>
			<p>パスワード<input type="password" name="pass" size="25" placeholder="パスワードを入力してください" ><p>
		<p><input type="submit" value="送信" ></p>
		
	</form>
	<input type="button" name="back" value="前ページに戻る"
			onclick="javascript:history.back()">
	<input type="button" name="logout" value="ログアウト"
		onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">
	
</body>
</html>