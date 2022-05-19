<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Text Sertch</title>
</head>
<body>

	<h2>教科書検索画面</h2>
	
	<form action = "/TextServlet?action=search" method="post">

	ISBN <input type="text" name="ISBN"><br> 
	タイトル <input type="text" name="title"><br> 
	分類 <select size="1" name="sort">
		<option value="1">文学部系</option> <!-- valueは0から -->
		<option value="2">教育学部系</option>
		<option value="3">法学部系</option>
		<option value="4">社会学部系</option>
		<option value="5">経済学部系</option>
		<option value="6">理学部系</option>
		<option value="7">医学部系</option>
		<option value="8">歯学部系</option>
		<option value="9">薬学部系</option>
		<option value="10">工学部系</option>
		<option value="11">農学部系</option>
	</select> <br>
	著者名 <input type="text" name="author"><br><br>

	<input type="submit" value="検索">
	&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" name="button_test" value="戻る" onclick="javascript:history.back()">
	</form>

</body>
</html>