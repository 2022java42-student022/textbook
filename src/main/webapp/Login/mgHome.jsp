<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者ホーム</title>
<link rel = "stylesheet" type = "text/css" href = "/textbook/CSS/mgHome.css">
</head>
<body>
<div align = "center"> 
<br>
	<h1>管理者画面</h1>
	</div>
	<hr>
	<div align ="center"><a href="/textbook/Text/textSearchMg.jsp">教科書の検索</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="/textbook/Member/memSearch.jsp">会員の検索</a></div>
	<br>
	<br>
	<div class="buttons">
	<button class ="goodbye" type="button" name="logout" value="ログアウト"
		onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">ログアウト</button>
		</div>
</body>
</html>