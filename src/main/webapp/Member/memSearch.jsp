<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search</title>
</head>
<body>

<h3>会員検索</h3>

<form action="/textbook/MemberServlet?action=search" method="post">
			<p>メールアドレス<input type="text" name="email" size="40" placeholder="メールアドレスを入力してください" required> <p>
			
		<p><input type="submit" value="検索"></p>
		
	</form>
	<input type="button" name="back" value="前ページに戻る"
			onclick="javascript:history.back()">
	<input type="button" name="logout" value="ログアウト"
		onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">

</body>
</html>