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

<table border="1">
<tr><td>ID</td><td>名前</td><td>メール</td><td>パスワード</td></tr>

<c:forEach items="${}" var="item">
<tr><td>${.user_id}</td><td>${.name}</td><td>${.email}</td><td>${.pass}</td></tr>
</c:forEach>
</table>
		

<input type="submit" value="削除">
</form>
<form action="/textbook/MemberServlet?action=change" method="post">
<input type="submit" value="変更">

	</form>
<a href="/Member/memSearch.jsp">戻る</a>
</body>
</html>