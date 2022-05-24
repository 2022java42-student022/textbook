<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登録済教科書参照</title>
</head>
<body>

	
	<h3>登録済み教科書</h3>

	<c:if test="${empty textbooks}">
現在、登録している教科書はありません。
</c:if>

	<c:if test="${not empty textbooks}">
		<table border="1">
			<tr>
				<th>ISBN</th>
				<th>タイトル</th>
				<th>分類</th>
				<th>著者名</th>
			</tr>
			<c:forEach items="${textbooks}" var="textbooks">
				<tr>
					<td align="center">${textbooks.ISBN}</td>
					<td align="center">${textbooks.title}</td>
					<td align="center">${textbooks.sort_id}</td>
					<td align="center">${textbooks.author}</td>
					<td>
						<form action="/textbook/TextServlet?action=inputChange"
							method="post">
							<input type="hidden" name="text_user_id" value="${text.user_id}">
							<input type="submit" value="登録内容変更">
						</form>
					</td>
				</tr>
			</c:forEach>
		</table>

		<form action="/textbook/TextServlet?action=inputChange" method="post">

		</form>
		
		<a href="/textbook/Login/memHome.jsp">戻る</a>
		
		</c:if>
		
</body>
</html>