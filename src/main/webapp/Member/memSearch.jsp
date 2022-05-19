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
			<p>ユーザーID<input type="text" name="user_id" size="40"> <p>
			
		<p><input type="submit" value="検索"></p>
		<a href="/Login/memHome.jsp">戻る</a>
	</form>

</body>
</html>