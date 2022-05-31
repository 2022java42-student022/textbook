<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SerchResult</title>
<link rel="stylesheet" type="text/css"
	href="/textbook/CSS/memSearch.css">
</head>
<body>

	<h1>検索結果</h1>

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
			onclick="javascript:history.back()">前ページに戻る</button>
		<br>
		<form action="/textbook/MemberServlet?action=delete" method="post">
			<button class="button1" type="button" value="削除"
				onclick="javascript:location.href='/textbook/Member/memDeleteConfirmation.jsp'">削除</button>
		</form>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
		<form action="/textbook/MemberServlet?action=change" method="post">
			<button class="button1" type="submit" value="変更">変更</button>
		</form>
		<button class="goodbye" type="button" name="logout" value="ログアウト"
			onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">ログアウト</button>
	</div>

</body>
</html>