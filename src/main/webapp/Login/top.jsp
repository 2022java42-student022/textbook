<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン</title>
<link rel="stylesheet" type="text/css" href="/textbook/CSS/top.css">
</head>
<body>
<br>

	<div class="login_form_top">
		<h1>ログイン画面</h1>
		<p>メールアドレス、パスワードをご入力の上、「ログイン」ボタンをクリックしてください。</p>
	</div>

	<form action="/textbook/LoginServlet?action=login" method="post">
		<table class="customer">
			<tr>
				<td class="customer-body"><input type="text" name="user_id"
					placeholder="メールアドレスを入力してください" class="form-text" ></td>
				
			</tr>
			<tr>
				<td class="customer-body"><input type="password" name="pass"
					placeholder="パスワードを入力してください" class="form-text"></td>
					
			</tr>
			<tr>
			<td>		<div class="select">	
                <select name="login">
					<option value="member">会員</option>
					<option value="manager">管理者</option>
				</select>
			</div>
			</td>
			</tr>
			
			</table>
			<div  align="center">
			
			</div>
			<div class="button">
				<button class = "button1" type="submit" value="ログイン">ログイン</button>
				<input type="hidden"name="action" value="login">
			</div>
			
			<%--ログインページに戻った時にセッションを削除する機能追加 --%>
		
	</form>

	<div class="center"><a href="/textbook/LoginServlet?action=register">初めての方はこちら</a></div>
</body>
</html>