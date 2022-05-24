<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注文完了</title>
</head>
<body>

	<h4>ご注文ありがとうございました。</h4>

	お客様の注文番号は

	<h4>「00000000000」</h4>

	になります。<br>

	<input type="button" name="restart" value="ホームページへ"
			onclick="javascript:location.href='/textbook/Login/memHome.jsp'">
	<input type="button" name="logout" value="ログアウト"
		onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">
	
	
</body>
</html>