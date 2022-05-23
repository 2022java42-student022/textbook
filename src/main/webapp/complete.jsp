<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Complete</title>
</head>
<body>

	<h1>${message}</h1>
	<br>

	<c:if test="${empty login}">
		<input type="button" name="restart" value="ログインページへ"
			onclick="javascript:location.href='/textbook/Login/top.jsp'">
	</c:if>
	<c:if test="${login eq 'maneger'}">
		<input type="button" name="restart" value="ホームページへ"
			onclick="javascript:location.href='/textbook/Login/mgHome.jsp'">
	</c:if>
	<c:if test="${login eq 'member'}">
		<input type="button" name="restart" value="ホームページへ"
			onclick="javascript:location.href='/textbook/Login/memHome.jsp'">
	</c:if>
</body>
</html>