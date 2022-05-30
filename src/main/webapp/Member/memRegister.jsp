<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<link rel="stylesheet" type="text/css"
	href="/textbook/CSS/memRegister.css">
</head>
<body>
	<div align="center">
		<h1>会員登録</h1>
	</div>

	<form action="/textbook/MemberServlet?action=preRegister" method="post">
		<table class="customer">
			<tr>
				<th class="customer-item">名前</th>
				<td class="customer-body"><input type="text" name="name"
					placeholder="名前を入力してください" required class="form-text"></td>
			</tr>

			<tr>
				<th class="customer-item">メールアドレス</th>
				<td class="customer-body"><input type="email" name="email"
					placeholder="メールアドレスを入力してください" required class="form-text"></td>
			</tr>

			<tr>
				<th class="customer-item">パスワード</th>
				<td class="customer-body"><input type="password" name="pass"
					placeholder="パスワードを入力してください" class="form-text" required></td>
			</tr>
		</table>


		<div class="buttons">
			<button class="button2" type="submit" value="送信" type="button"
				name="back" value="前ページに戻る" onclick="javascript:history.back()">前ページに戻る

			</button>
		</div>
		<br>
		<div class="buttons">
			<button class="goodbye" type="button" name="logout" value="ログアウト"
				onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">ログアウト</button>
		</div>


	</form>


</body>
</html>