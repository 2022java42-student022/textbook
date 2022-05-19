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

	<form action="/textbook/MemberServlet?action=change" method="post">
			<p>名前<input type="text" name="name"> <p>
			<p>メール<input type="email"name="email" size="40"><p>
			<p>パスワード<input type="pass" name="pass"><p>
		<p><input type="submit" value="送信"></p>
		<a href="/Login/memHome.jsp">戻る</a>
	</form>
</body>
</html>