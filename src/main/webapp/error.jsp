<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
</head>
<body>

	<h1>${message}</h1>
	<br>
	<c:choose>
		<%--
		<c:when test="${empty login}">
		<input type="button" name="restart" value="ログインページへ"
			onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">
		</c:when>
		 --%>
		<c:when test="${login eq 'maneger'}">
			<input type="button" name="restart" value="ホームページへ"
				onclick="javascript:location.href='/textbook/Login/mgHome.jsp'">
			<input type="button" name="back" value="前ページに戻る"
				onclick="javascript:history.back()">
		</c:when>
		<c:when test="${login eq 'member'}">
			<input type="button" name="restart" value="ホームページへ"
				onclick="javascript:location.href='/textbook/Login/memHome.jsp'">
			<input type="button" name="back" value="前ページに戻る"
				onclick="javascript:history.back()">
		</c:when>
		<c:otherwise>
			<input type="button" name="restart" value="ログインページへ"
				onclick="javascript:location.href='/textbook/Login/top.jsp'">
		</c:otherwise>
	</c:choose>
</body>
</html>