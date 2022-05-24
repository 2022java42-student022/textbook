<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SearchConfirmation</title>
</head>
<body>

<h3>会員情報変更確認画面</h3>

	<form action="/textbook/MemberServlet?action=change2" method="post">
	    <table border="1">
<tr><td>ID</td><td>名前</td><td>メール</td><td>パスワード</td></tr>


<tr><td>${member2.user_id}</td><td>${member2.name}</td><td>${member2.email}</td><td>${member2.pass}</td></tr>

</table>
		<br>
<table border="0">
<input type="hidden" name="email" value="${member2.email}">
<tr><td><input type="submit" value="変更">

</form></td></tr>
</table>
	<a href="/memChange.jsp">戻る</a>
</body>
</html>