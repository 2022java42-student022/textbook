<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Text Register</title>
<link rel="stylesheet" type="text/css"
	href="/textbook/CSS/textChange.css">
</head>
<body>
		<h2>教科書登録画面</h2>

		<form action="/textbook/TextServlet?action=preRegister" method="post">
			<!-- ISBN <input type="text" name="ISBN"><br> 
	タイトル <input type="text" name="title"><br> 
	分類 <select size="1" name="sort_id">
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
	</select> <br>
	著者名 <input type="text" name="author"><br>
	金額 <input type="number" name="price"><br>
	使用状況<input type="text" name="use"><br><br>  

	<input type="submit" value="登録">
	
</form>
<input type="button" name="back" value="前ページに戻る"
			onclick="javascript:history.back()">
<input type="button" name="logout" value="ログアウト"
		    onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">
		     -->

			<table class="customer">
				<tr>
					<th class="customer-item">ISBN</th>
					<td class="customer-body"><input type="text" name="ISBN"
						placeholder="ISBNを入力してください" required class="form-text"></td>
				</tr>

				<tr>
					<th class="customer-item">タイトル</th>
					<td class="customer-body"><input type="text" name="title"
						placeholder="タイトルを入力してください" required class="form-text"></td>
				</tr>
				<tr>
					<th class="customer-item">分類</th>
					<td class="customer-body"><select  size="1"
						name="sort_id">
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
					<th class="customer-item">著者名</th>
					<td class="customer-body"><input type="text" name="author"
						placeholder="著者名を入力してください" required class="form-text"></td>
				</tr>
				<tr>
					<th class="customer-item">金額</th>
					<td class="customer-body"><input type="number" name="price"
						placeholder="金額を入力してください" required class="form-text"></td>
				</tr>

				<tr>
					<th class="customer-item">使用状況</th>
					<td class="customer-body"><input type="text" name="use"
						placeholder="使用状況を入力してください" required class="form-text"></td>
				</tr>
			</table>
			<br>

			<div class="buttons">
				<button class="button1" type="submit" value="登録" type="button"
					name="back" value="前ページに戻る"
					onclick="javascript:location.href='/textbook/TextServlet?action=preRegister'">登録
				</button>
			</div>
			<br>

			<div class="buttons">
				<button class="button2" type="submit" value="戻る" type="button"
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