<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Text Delete</title>
</head>
<body>

	<h2>教科書削除画面</h2>
	
<form action="/textbook/TextServlet?action=delete" method="post">
	
		ISBN <input type="text" name="ISBN"><br> タイトル <input
			type="text" name="title"><br> <br> <input
			type="submit" value="削除"> 
	</form>
<a href="/memHome.jsp">戻る</a>
</body>
</html>