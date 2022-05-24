<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SearchConfirmation</title>
</head>
<body>

	<h3>変更内容確認</h3>

	<form action="/textbook/MemberServlet?action=change2" method="post">
		<p>名前:いがいがいがいが
		<p>
		<p>メール:iga
		<p>
		<p>パスワード:iga
		<p>
		<p>ユーザーID:igaiga555
		<h5>上記の内容でお間違えありませんか？</h5>

<input type="submit" value="変更">


	</form>
	<input type="button" name="back" value="前ページに戻る"
			onclick="javascript:history.back()">
	<input type="button" name="logout" value="ログアウト"
		onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">
</body>
</html>