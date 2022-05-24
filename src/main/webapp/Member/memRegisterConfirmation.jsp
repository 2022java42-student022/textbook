<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirmation</title>
</head>
<body>

	<h3>登録情報確認</h3>

	<form action="/textbook/MemberServlet?action=register" method="post">
		<p>名前:${member.name}
		<p>
		<p>メール:${member.email}
		<p>
		<p>パスワード:${member.pass}
		<p>
		<h5>上記の内容でお間違えありませんか？</h5>

<input type="submit" value="登録">
	</form>
		<input type="button" name="back" value="前ページに戻る"
			onclick="javascript:history.back()">
	<input type="button" name="logout" value="ログアウト"
		onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">

</body>
</html>