<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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
				<th>金額</th>
			</tr>
			<c:forEach items="${textbooks}" var="textbooks">
				<tr>
					<td align="center"><fmt:formatNumber value="${textbooks.ISBN}" pattern="0000000000000" /></td>
					<td align="center">${textbooks.title}</td>
					<td align="center">${textbooks.dep_name}</td>
					<td align="center">${textbooks.author}</td>
					<td align="center">${textbooks.price}</td>
					<td>
						<form action="/textbook/TextServlet?action=inputChange"
							method="post">
							<input type="hidden" name="text_id" value="${textbooks.text_id}">
							<input type="submit" value="登録内容変更">
						</form>
					</td>
				</tr>
			</c:forEach>
		</table>

	</c:if>
	<input type="button" name="back" value="前ページに戻る"
		onclick="javascript:history.back()">
	<input type="button" name="logout" value="ログアウト"
		onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">

</body>
</html>