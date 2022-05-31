<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member</title>
<link rel="stylesheet" type="text/css"
	href="/textbook/CSS/memChange.css">
</head>
<body>

	<h1>会員変更</h1>

	<form action="/textbook/MemberServlet?action=preChangemem" method="post">
	
	<table class="customer">
			<tr>
				<th class="customer-item">名前</th>
				<td class="customer-body"><input type="text" name="name"
					value="${memberchange.name}" placeholder="名前を入力してください"
					class="form-text" required></td>
			</tr>
	
		<tr>
				<th class="customer-item">メールアドレス</th>
				<td class="customer-body"><input type="email" name="email"
					value="${memberchange.email}" size="40"
					placeholder="メールアドレスを入力してください" class="form-text" required></td>
			</tr>
			
		<tr>
				<th class="customer-item">パスワード</th>
				<td class="customer-body"><input type="password" name="pass"
					class="form-text" value="${memberchange.pass}" size="25"
					placeholder="パスワードを入力してください" required></td>
			</tr>
				
		</table>
		
		<br>
		
			<button class="button1" type="submit" value="送信">送信</button><br>
			<button class="button2" type="button" name="back" value="前ページに戻る"
				onclick="javascript:history.back()">前ページに戻る</button>
			<br>
		<button class="goodbye" type="button" name="logout" value="ログアウト"
			onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">ログアウト</button>
		
	</form>

</body>
</html>