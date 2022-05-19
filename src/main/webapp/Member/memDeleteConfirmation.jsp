<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DeleteConfirmation</title>
</head>
<body>

	<h3>退会確認画面</h3>

	<form action="/textbook/MemberServlet?action=delete" method="post">
		<p>名前:いがいがいがいが
		<p>
		<p>メール:iga
		<p>
		<p>パスワード:iga
		<p>
		<p>ユーザーID:igaiga555
		<h5>上記の内容でお間違えありませんか？</h5>
		<p>
			<input type="submit" value="決定">
		</p>


	</form>
	<a href="/Member/memDelete.jsp">戻る</a>
</body>
</html>