<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DeleteConfirmation</title>
</head>
<body>

<h3>削除確認</h3>

<form action="/textbook/TextServlet?action=delete" method="post">

			<table border ="1">
			<tr><td>ISBN</td><td>タイトル</td></tr>
			
			<c:forEach items="${text_id}" var="text">
			<tr><td>${text.ISBN}</td><td>${text.title}</td></tr>
			</c:forEach>
			</table>
		
	</form>
<input type="button" name="back" value="前ページに戻る"
			onclick="javascript:history.back()">
<input type="button" name="logout" value="ログアウト"
		    onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">
</body>
</html>