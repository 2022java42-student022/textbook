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

<table border="1">
<tr><td>ID</td><td>名前</td><td>メール</td><td>パスワード</td></tr>

<tr><td>${member_search.user_id}</td><td>${member_search.name}</td><td>${member_search.email}</td><td>${member_search.pass}</td></tr>

</table>
		<br>
<table border="0">
<tr><td>
<form action="/textbook/MemberServlet?action=delete" method="post">
<input type="submit" value="削除">
</form></td>
<td><form action="/textbook/MemberServlet?action=change" method="post">
<input type="submit" value="変更">

	
	<input type="button" name="back" value="前ページに戻る"
			onclick="javascript:history.back()">
	<input type="button" name="logout" value="ログアウト"
		onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">
		</form>
</body>
</html>