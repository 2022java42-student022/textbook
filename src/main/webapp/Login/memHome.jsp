<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会員ホーム</title>
<link rel="stylesheet" type="text/css" href="/textbook/CSS/memHome.css">
</head>
<body>
	<div align="center">
<br>
		<h1>会員画面</h1>
	</div>

	<hr>
	<div align="center">
		<a href="/textbook/Text/textSearchMember.jsp">教科書の検索</a> <br> <a
			href="/textbook/Text/textRegister.jsp">教科書の登録</a> <br> <a
			href="/textbook/Member/memChange2.jsp">会員情報の変更</a> <br> <a
			href="/textbook/TextServlet?action=reference">登録済み教科書参照</a> <br>
		<a href="/textbook/Member/memDelete.jsp">会員の退会</a>
	</div>
	<br>
	<br>
	<div class="buttons">
		<button class="goodbye" type="button" name="logout" value="ログアウト"
			onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">ログアウト</button>
	</div>


</body>
</html>