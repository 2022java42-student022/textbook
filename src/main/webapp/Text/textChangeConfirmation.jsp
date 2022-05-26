<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChangeConfirmation</title>
</head>
<body>

<h2>教科書変更確認画面</h2>

<form action="/textbook/TextServlet?action=change" method="post">
			<p>ISBN:${changetext.ISBN}<p>
			<p>タイトル:${changetext.title}<p>
			<p>分類:${changetext.dep_name}<p>
			<p>著者:${changetext.author}<p>
			<p>金額:${changetext.price}<p>
			<p>使用状況:${changetext.use}<p>
			<h5>上記の内容で変更します。よろしいですか？</h5>
		<p><input type="submit" value="決定"></p> 
<input type="button" name="back" value="前ページに戻る"
			onclick="javascript:history.back()">
<input type="button" name="logout" value="ログアウト"
		    onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">
		
	</form>

</body>
</html>