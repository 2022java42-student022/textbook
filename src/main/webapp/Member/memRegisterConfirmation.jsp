<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirmation</title>
<link rel="stylesheet" type="text/css"
	href="/textbook/CSS/memRegisterConfirmation.css">
</head>
<body>
<div align="center">
<br>
	<h1>登録情報確認</h1>
</div>
	<form action="/textbook/MemberServlet?action=register" method="post">
	<table class="customer">
		<tr>
			<th class="customer-item">名前</th>
			<td class="customer-body">${member.name}</td>
		</tr>
			
		<tr>
		    <th class="customer-item">メール
		    <td class="customer-body">${member.email}</td>
		</tr>
		
		<tr>
			<th class="customer-item">パスワード
			<td class="customer-body">${member.pass}</td>
			</tr>

				
	</table>
<div align="center"><h3>※上記の内容でお間違えありませんか？</h3></div>
		<button class = "button1" type="submit" value="登録">登録</button>
		<br>
		<button class = "button2" type="button"
			name="back" value="前ページに戻る" onclick="javascript:history.back()">前ページに戻る</button>
		<br>
		<div class="buttons">
			<button class="goodbye" type="button" name="logout" value="ログアウト"
				onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">ログアウト</button>
		</div>
	</form>


</body>
</html>