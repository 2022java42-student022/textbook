<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DeleteConfirmation</title>
<link rel="stylesheet" type="text/css"
	href="/textbook/CSS/memDelete.css">
</head>
<body>

	<h1>退会確認画面</h1>
	
	<form action="/textbook/MemberServlet?action=decision" method="post">
	
	<table class="customer">
		<tr>
			<th class="customer-item">ID</th>
			<td class="customer-body">${member_search.user_id}</td>
		</tr>

		<tr>
			<th class="customer-item">名前</th>
			<td class="customer-body">${member_search.name}</td>
		</tr>

		<tr>
			<th class="customer-item">メールアドレス</th>
			<td class="customer-body">${member_search.email}</td>
		</tr>

		<tr>
			<th class="customer-item">パスワード</th>
			<td class="customer-body">${member_search.pass}</td>
		</tr>


	</table>
<br>
		<div class="buttons">
			<button class="button2" type="button" name="back" value="前ページに戻る"
				onclick="javascript:location.href='/textbook/Member/memSearchResult.jsp'">前ページに戻る</button>
			<br>
			<button class="button1" type="submit" value="削除">削除</button>
		</div>
		<button class="goodbye" type="button" name="logout" value="ログアウト"
			onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">ログアウト</button>

	
		

		</form>
	
		
			<input type="hidden" name="user_id" value="${member2.user_id}">
			
</body>
</html>