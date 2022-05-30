<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member</title>
<link rel="stylesheet" type="text/css"
	href="/textbook/CSS/memDelete.css">
</head>
<body>

	<h1>会員退会</h1>

	<form action="/textbook/MemberDeleteServlet" method="post">
	<table class="customer">

			<tr>
				<th class="customer-item">パスワード</th>
				<td class="customer-body"><input type="pass" name="pass"
					class="form-text" size="25"
					placeholder="パスワードを入力してください" required></td>
			</tr>

</table>
<br>
		<div class="buttons">
			<button class="button2" type="button" name="back" value="前ページに戻る"
				onclick="javascript:history.back()">前ページに戻る</button>
			<br>
			<button class="button1" type="submit" value="退会">退会</button>
		</div>
		<button class="goodbye" type="button" name="logout" value="ログアウト"
			onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">ログアウト</button>

	</form>
</body>
</html>