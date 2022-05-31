<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ご登録情報確認</title>
<link rel="stylesheet" type="text/css"
	href="/textbook/CSS/memRegisterConfirmation.css">
</head>
<body>
<div align="center">
<br>
<h2>教科書登録確認画面</h2>

<form action="/textbook/TextServlet?action=register" method="post">
			<!-- <p>ISBN:
			<fmt:formatNumber value="${text.ISBN}" pattern="0000000000000" />
			<p>
			<p>タイトル:${text.title}<p>
			<p>分類:${text.dep_name}<p>
			<p>著者:${text.author}<p>
			<p>金額:${text.price}<p>
			<p>使用状況:${text.use}<p>
			<h5>上記の内容でお間違えありませんか？</h5>
		<p><input type="submit" value="送信"><p>
<input type="button" name="back" value="前ページに戻る"
			onclick="javascript:history.back()">
<input type="button" name="logout" value="ログアウト"
		    onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">
		 -->
		 <table class="customer">
		<tr>
			<th class="customer-item">ISBN</th>
			<td class="customer-body"><fmt:formatNumber value="${text.ISBN}" pattern="0000000000000" /></td>
		</tr>	
		<tr>
		    <th class="customer-item">タイトル
		    <td class="customer-body">${text.title}</td>
		</tr>
		
		<tr>
			<th class="customer-item">分類
			<td class="customer-body">${text.dep_name}</td>
		</tr>
	<tr>
		    <th class="customer-item">著者
		    <td class="customer-body">${text.author}</td>
		</tr>		
		<tr>
			<th class="customer-item">金額
			<td class="customer-body">${text.price}</td>
		</tr>
		<tr>
			<th class="customer-item">使用状況
			<td class="customer-body">${text.use}</td>
		</tr>		
	</table>
	<div align="center"><h3>※上記の内容でお間違えありませんか？</h3></div>
		<button class = "button1" type="submit" value="送信">送信</button>
		<br>
		<button class = "button2" type="button"
			name="back" value="前ページに戻る" onclick="javascript:history.back()">前ページに戻る</button>
		<br>
		<div class="buttons">	
		<button class="goodbye" type="button" name="logout" value="ログインページへ"
			onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">ログインページへ</button>
	</div>
	
</form>

</body>
</html>