<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
</head>
<body>
<a href="">教科書検索</a>|<a href="">カートの確認</a>

<hr>
	<h3>現在のカートの中身</h3>

	<table border="1">
		<tr>
			<td>ISBM番号</td>
			<td>分類</td>
			<td>タイトル</td>
			<td>著者</td>
			<td>金額</td>
			<td>小計</td>
			<td>削除</td>
		</tr>
		<tr>
					<td align="center"></td>
					<td align="center"></td>
					<td align="center"></td>
					<td align="center"></td>
					<td align="right"></td>
					<td align="right"></td>
					<td>
						<form action="" method="post">
							<input type="hidden" name="" value="">
							<input type="submit" value="削除">
						</form>
					</td>
		<tr>
			<td align="right" colspan="6">総計：円</td>
		</tr>
	</table>
	<form action="" method="post">
		<input type="submit" value="注文する"><br>
		<br>
		<a href="/Member/memSearchResult.jsp">戻る</a>
	</form>
</body>
</html>