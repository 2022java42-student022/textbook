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

<form action="/textbook/MemberServlet?action=register" method="post">
			<p>名前<input type="text" name="name"> <p>
			<p>メール<input type="email"name="email" size="40"><p>
			<p>パスワード<input type="password" name="pass"><p>
		<p><input type="submit" value="送信">　<input type="submit" value="戻る"></p>
	</form>

</body>
</html>