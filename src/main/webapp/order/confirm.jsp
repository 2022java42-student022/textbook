<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注文内容確認</title>
</head>
<body>

	下記の内容で注文を行いますか？
	<br>
	<br> ご注文商品
	<br>
	<table border="1">
		<tr>
			<td>ISBN</td>
			<td>分類</td>
			<td>タイトル</td>
			<td>著者</td>
			<td>金額</td>
			<td>使用状況</td>
		</tr>
		<tr>
			<td height="20"></td>
			<td height="20"></td>
			<td height="20"></td>
			<td height="20"></td>
			<td height="20"></td>
			<td height="20"></td>
		</tr>
		<tr>
			<td height="20"></td>
			<td height="20"></td>
			<td height="20"></td>
			<td height="20"></td>
			<td height="20"></td>
			<td height="20"></td>
		</tr>
		<tr>
			<td align="right" colspan="6">総計</td>
		</tr>
	</table>

	お客様情報
	<form action = "/textbook/OrderServlet?action=order" method = "post">
		<table border="1">
			<tr>
				<td>名前</td>
				<td width="180"></td>
			</tr>
			<tr>
				<td>住所</td>
				<td width="180"></td>
			</tr>
			<tr>
				<td>電話番号</td>
				<td width="180"></td>
			</tr>
			<tr>
				<td>メールアドレス</td>
				<td width="180"></td>
			</tr>
			<tr>
				<td>お支払方法</td>
				<td width="180"></td>
			</tr>
		</table>
		<br>
		<input type="submit" value="この内容で注文"><br>
	<input type="button" name="back" value="前ページに戻る"
		onclick="javascript:history.back()">
	<input type="button" name="logout" value="ログアウト"
		onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">
	</form>

</body>
</html>