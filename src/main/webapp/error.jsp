<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
<link rel="stylesheet" type="text/css"
	href="/textbook/CSS/memberInfo.css">
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
		<c:when test="${login eq 'manager'}">
			<button class="goodbye" type="button" name="restart" value="ホームページへ"
				onclick="javascript:location.href='/textbook/Login/mgHome.jsp'">ホームページへ</button><br>
			<button class="button2" type="button" name="back" value="前ページに戻る"
				onclick="javascript:history.back()">前ページに戻る</button>
		</c:when>
		<c:when test="${login eq 'member'}">
			<button class="goodbye" type="button" name="restart" value="ホームページへ"
				onclick="javascript:location.href='/textbook/Login/memHome.jsp'">ホームページへ</button><br>
			<button class="button2" type="button" name="back" value="前ページに戻る"
				onclick="javascript:history.back()">前ページに戻る</button>
		</c:when>
		<c:when test="${login eq 'register'}">
			<button class="goodbye" type="button" name="restart" value="ログインページへ"
				onclick="javascript:location.href='/textbook/LoginServlet?action=noregister'">ログインページへ</button><br>
			<button class="button2" type="button" name="back" value="前ページに戻る"
				onclick="javascript:history.back()">前ページに戻る</button>
		</c:when>
		<c:otherwise>
			<button class="goodbye" type="button" name="restart" value="ログインページへ"
				onclick="javascript:location.href='/textbook/Login/top.jsp'">ログインページへ</button>
		</c:otherwise>
	</c:choose>
</body>
</html>