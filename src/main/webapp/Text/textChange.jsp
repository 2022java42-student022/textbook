<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Text Change</title>
<link rel="stylesheet" type="text/css"
	href="/textbook/CSS/textChange.css">
</head>
<body>

	<h2>教科書変更画面</h2>

	<form action="/textbook/TextServlet?action=preChange" method="post">

		<table class="customer">
			<tr>
				<th class="customer-item">ISBN</th>
				<td class="customer-body"><input class="form-text" type="text" name="ISBN"
					value="${text_prechange.ISBN}"></td>
			</tr>
			<tr>
				<th class="customer-item">タイトル</th>
				<td class="customer-body"><input class="form-text" type="text" name="title"
					value="${text_prechange.title}"></td>
			</tr>

			<tr>
				<th class="customer-item">分類</th>
				<td class="customer-body">
				<select size="1" name="sort_id">
					    <option value="" selected></option>
						<option value="1">文学部系</option>
						<option value="2">教育学部系</option>
						<option value="3">法学部系</option>
						<option value="4">社会学部系</option>
						<option value="5">経済学部系</option>
						<option value="6">理学部系</option>
						<option value="7">医学部系</option>
						<option value="8">歯学部系</option>
						<option value="9">薬学部系</option>
						<option value="10">工学部系</option>
						<option value="11">農学部系</option>
				</select></td>
			</tr>
			<tr>
				<th class="customer-item">著者</th>
				<td class="customer-body"><input class="form-text" type="text" name="author"
					value="${text_prechange.author}"></td>
			</tr>
			<tr>
				<th class="customer-item">金額</th>
				<td class="customer-body"><input class="form-text" type="number" name="price"
					value="${text_prechange.price}"></td>
			</tr>
			<tr>
				<th class="customer-item">使用状況</th>
				<td class="customer-body"><input class="form-text" type="text" name="use"
					value="${text_prechange.use}"></td>
			</tr>
		</table>
		<br>
		<div class="buttons">
			<button class=goodbye type="submit" value="変更">変更</button>
		</div>

		<br>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<button class="button2" type="button" name="back" value="前ページに戻る"
				onclick="javascript:history.back()">前ページに戻る</button><br>
			<button class="goodbye" type="button" name="logout" value="ログアウト"
				onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">ログアウト</button>
		
	</form>



</body>
</html>