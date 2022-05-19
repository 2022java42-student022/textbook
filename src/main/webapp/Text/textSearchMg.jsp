<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search</title>
</head>
<body>

<h2>教科書検索</h2>

<form action="/TextServlet" method="post">
		<p>ISBN<input type="text" name="ISBN" size="40"> <p>
		<p>タイトル<input type="text" name="title" size="40"> <p>
		   <p>分類 <select size="1" name="sort">
		<option value="0">文学部系</option>
		<option value="1">教育学部系</option>
		<option value="2">法学部系</option>
		<option value="3">社会学部系</option>
		<option value="4">経済学部系</option>
		<option value="5">理学部系</option>
		<option value="6">医学部系</option>
		<option value="7">歯学部系</option>
		<option value="8">薬学部系</option>
		<option value="9">工学部系</option>
		<option value="10">農学部系</option>
		</select>
		<p>著者<input type="text" name="author" size="40"> <p>
	<p><input type="submit" value="検索"></p>
	<input type ="hidden" name="action" value="search">
</form>

<a href="/textbook/Login/mgHome.jsp">戻る</a>

</body>
</html>