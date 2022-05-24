<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者ホーム</title>
</head>
<body>

	管理者画面
	<hr>
	<a href="/textbook/Text/textSearchMg.jsp">教科書の検索</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="/textbook/Member/memSearch.jsp">会員の検索</a>
	<br>
	<br>
	<input type="button" name="logout" value="ログアウト"
		onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">
</body>
</html>