<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChangeConfirmation</title>
<link rel="stylesheet" type="text/css"
	href="/textbook/CSS/memChange.css">
</head>
<body>

	<h3>変更内容確認</h3>

	<form action="/textbook/MemberServlet?action=comfirm" method="post">
	<table class="customer">
		<tr>
			<th class="customer-item">ID</th>
			<td class="customer-body">${member2.user_id}</td>
		</tr>

		<tr>
			<th class="customer-item">名前</th>
			<td class="customer-body">${member2.name}</td>
		</tr>

		<tr>
			<th class="customer-item">メールアドレス</th>
			<td class="customer-body">${member2.email}</td>
		</tr>

		<tr>
			<th class="customer-item">パスワード</th>
			<td class="customer-body">${member2.pass}</td>
		</tr>


	</table>
	
	<br>
		<div class="buttons">
			<button class="button2" type="button" name="back" value="前ページに戻る"
				onclick="javascript:location.href='/textbook/Member/memChange.jsp'">前ページに戻る</button>
			<br>
			<button class="button1" type="submit" value="変更">変更</button>
		</div>
		<button class="goodbye" type="button" name="logout" value="ログアウト"
			onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">ログアウト</button>


		
	</form>

</body>
</html>