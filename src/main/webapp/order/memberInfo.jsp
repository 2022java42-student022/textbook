<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザー情報確認</title>
</head>
<body>

	<h4>ご注文商品</h4>
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
			<td height = "20"></td>
			<td height = "20"></td>
			<td height = "20"></td>
			<td height = "20"></td>
			<td height = "20"></td>
			<td height = "20"></td>
		</tr>
		<tr>
			<td height = "20"></td>
			<td height = "20"></td>
			<td height = "20"></td>
			<td height = "20"></td>
			<td height = "20"></td>
			<td height = "20"></td>
		</tr>
		<tr><td align = "right" colspan = "6">総計円</td></tr>
	</table>
	
	<h4>お客様情報を入力してください。</h4>
	<form action = "/textbook/OrderServlet?action=confirm" method = "post">
	　　　　　名前：<input type = "text" name = "name"><br>
	　　　　　住所：<input type = "text" name = "name"><br>
	　　　電話番号：<input type = "text" name = "name"><br>
	メールアドレス：<input type = "text" name = "name"><br>
	
	<h4>お支払方法を選択してください。</h4>
	<input type = "radio" name = "pay" value = "card">クレジットカード<br>
	<input type = "radio" name = "pay" value = "bank">銀行振込<br>
	<input type = "radio" name = "pay" value = "cash">代引き<br><br>
	<input type = "submit" value = "確認画面へ"><br>
	<a href = "/textbook/cart/cart.jsp">戻る</a>
	</form>
	
</body>
</html>