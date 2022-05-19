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

			<p>ISBN:iga666<p>
			<p>タイトル:伊賀、Javaやめるってよ<p>
			
			<h5>上記の内容でお間違えありませんか？</h5>
		<p><input type="submit" value="決定"></p> 
		
	</form>
<a href="/textbook/Text/textSearchResultMg.jsp">戻る</a>
</body>
</html>