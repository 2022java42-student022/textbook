<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SerchResult</title>
</head>
<body>

<h3>検索結果</h3>

<form action="/textbook/MemberServlet?action=delete" method="post">
		<p>名前:
		<p>
		<p>メール:
		<p>
		<p>パスワード:
		<p>
		<p>ユーザーID:
		<h5>上記の内容でお間違えありませんか？</h5>

<input type="submit" value="削除">
</form>
<form action="/textbook/MemberServlet?action=change" method="post">
<input type="submit" value="変更">

	</form>
<a href="/Member/memSearch.jsp">戻る</a>
</body>
</html>