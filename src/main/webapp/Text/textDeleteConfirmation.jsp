<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DeleteConfirmation</title>
</head>
<body>

<h3>削除確認</h3>

<form action="/textbook/TextServlet?action=predelete" method="post">

		<c:forEach items="${delete_textbooks}" var="text">
			<p>ISBN:${text.ISBN}<p>
			<p>タイトル:${text.title}<p>
		</c:forEach>	
			
			<h5>上記を削除します。よろしいですか？</h5>
		<p><input type="submit" value="決定"></p> 
		
	</form>
<input type="button" name="back" value="前ページに戻る"
			onclick="javascript:history.back()">
<input type="button" name="logout" value="ログアウト"
		    onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">
</body>
</html>