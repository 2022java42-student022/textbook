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

<form action="/textbook/TextServlet?action=delete" method="post">

		
			<p>ISBN:${delete_textbooks.ISBN}<p>
			<p>タイトル:${delete_textbooks.title}<p>
			<p>分類:${delete_textbooks.dep_name}<p>
			<p>著者:${delete_textbooks.author}<p>
			<p>金額:${delete_textbooks.price}<p>
			<p>使用状況:${delete_textbooks.use}<p>
		
			
			<h5>上記を削除します。よろしいですか？</h5>
		<p><input type="submit" value="決定"></p> 
		
	</form>
<input type="button" name="back" value="前ページに戻る"
			onclick="javascript:history.back()">
<input type="button" name="logout" value="ログアウト"
		    onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">
</body>
</html>