<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Text Register</title>
</head>
<body>

<h2>教科書登録画面</h2>

<form action="/textbook/TextServlet?action=preRegister" method="post">
	ISBN <input type="text" name="ISBN"><br> 
	タイトル <input type="text" name="title"><br> 
	分類 <select size="1" name="sort_id">
		<option value="1">文学部系</option>
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
	著者名 <input type="text" name="author"><br>
	金額 <input type="number" name="price"><br>
	使用状況<input type="text" name="use"><br><br>  

	<input type="submit" value="登録">
	
</form>
<a href ="textbook/Login/memHome">戻る</a>

</body>
</html>