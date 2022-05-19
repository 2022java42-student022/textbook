<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SearchConfirmation</title>
</head>
<body>

<form action="/TextServlet" method="post">
			<p>ISBN:<p>
			<p>タイトル:<p>
			<h5>上記の内容でお間違えありませんか？</h5>
		<p><input type="submit" value="決定"></p> 
		<a href="/textbook/Text/textSearch.jsp">戻る</a>
		
	</form>

</body>
</html>