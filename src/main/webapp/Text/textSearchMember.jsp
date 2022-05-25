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


	<form action="/TextServlet?action=search_title" method="post">
		タイトル <input type="text" name="title"> <input type="submit"
			value="タイトルで検索">
	</form>
	<form action="/TextServlet?action=search_sort_id" method="post">
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
		</select> <input type="submit" value="学部で検索">
	</form>
	<br>
	<br>
	
	
	<form action="/TextServlet?action=search_title_sort" method="post">
	<input type="submit" value="検索">
	</form>
	<br>

  	<form action="/TextServlet?action=searchAll" method="post">
	<input type="submit" value="全商品表示">
	</form>
	<br>
	<br>
	
	
	<%-- 必要か分からないのでコメントアウト
	<input type="button" name="button_test" value="戻る"
		onclick="javascript:history.back()"> --%>

	
	&nbsp;&nbsp;&nbsp;&nbsp; <!-- JavaScript -->
	<input type="button" name="back" value="前ページに戻る"
			onclick="javascript:history.back()">
<input type="button" name="logout" value="ログアウト"
		    onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">

</body>
</html>