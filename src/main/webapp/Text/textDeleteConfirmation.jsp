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
<input type="button" name="back" value="前ページに戻る"
			onclick="javascript:history.back()">
<input type="button" name="logout" value="ログアウト"
		    onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">
</body>
</html>