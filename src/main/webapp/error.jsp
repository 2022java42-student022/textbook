<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
</head>
<body>

	<h1>${message}</h1>
	<br>
	<input type="button" name="restart" value="ログインページへ"
		onclick="javascript:location.href='/textbook/Login/top.jsp'">
	<input type="button" name="back" value="前ページに戻る"
		onclick="javascript:history.back()">
</body>
</html>