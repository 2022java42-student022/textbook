<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ご登録情報確認</title>
</head>
<body>

<h2>教科書登録確認画面</h2>

<form action="/textbook/TextServlet?action=register" method="post">
			<p>ISBN:${text.ISBN}<p>
			<p>タイトル:${text.title}<p>
			<p>分類:${text.dep_name}<p>
			<p>著者:${text.author}<p>
			<p>金額:${text.price}<p>
			<p>使用状況:${text.use}<p>
			<h5>上記の内容でお間違えありませんか？</h5>
		<p><input type="submit" value="送信"><p>
		<a href="/textbook/Text/textRegister.jsp">戻る</a>
		
</form>

</body>
</html>