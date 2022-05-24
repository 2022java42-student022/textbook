<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Text Change</title>
</head>
<body>

<h2>教科書変更画面</h2>

<form action="testChangeConfirmation.jsp" method="post">
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
	著者 <input type="text" name="author"><br>
	金額 <input type="number" name="price"><br><br>

	<input type="submit" value="変更">
	&nbsp;&nbsp;&nbsp;&nbsp;

<input type="button" name="back" value="前ページに戻る"
			onclick="javascript:history.back()">
<input type="button" name="logout" value="ログアウト"
		    onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">
</form>	



</body>
</html>