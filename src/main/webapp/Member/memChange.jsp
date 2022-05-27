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
			<p>名前<input type="text" name="name" value="${member_search.name}" placeholder="名前を入力してください" required> <p>
			<p>メール<input type="email"name="email" value="${member_search.email}" size="40" placeholder="メールアドレスを入力してください" required><p>
			<p>パスワード<input type="pass" name="pass" value="${member_search.pass}" size="25" placeholder="パスワードを入力してください" required><p>
		<p><input type="submit" value="送信"></p>
		
		
	</form>
	<input type="button" name="back" value="前ページに戻る"
			onclick="javascript:history.back()">
	<input type="button" name="logout" value="ログアウト"
		onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">
</body>
</html>