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

<form action="/Text/textRegisterConfimation" method="post">
	ISBN <input type="text" name="ISBN"><br> 
	タイトル <input type="text" name="title"><br> 
	分類 <select size="1" name="sort">
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
	</select> <br>
	著者名 <input type="text" name="author"><br>
	金額 <input type="number" name="value"><br><br>

	<input type="submit" value="登録">
	
</form>
<a href ="/Login/memHome">戻る</a>

</body>
</html>