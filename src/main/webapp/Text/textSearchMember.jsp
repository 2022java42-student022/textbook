<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Text Sertch</title>
<link rel="stylesheet" type="text/css"
	href="/textbook/CSS/textChange.css">
</head>
<body>

	<h2>教科書検索画面</h2>
	<form action="/textbook/TextServlet?action=search_title_member"
		method="post">
		<table class="customer">
			<tr>
				<th class="customer-item">タイトル</th>
				<td class="customer-body"><input type="text" name="title"></td>
				<td class="customer-button"><button class="goodbye" type="submit"
						value="タイトルで検索">タイトルで検索</button></td>
			</tr>
		</table>
	</form>

	<form action="/textbook/TextServlet?action=search_sort_id_member"
		method="post">
		<table class="customer">
			<tr>
				<th class="customer-item">分類</th>
				<td class="customer-body"><select size="1" name="sort_id">
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
				<td class="customer-button"><button class="goodbye" type="submit"
						value="タイトルで検索">学部で検索</button></td>
			</tr>
		</table>
	</form>
	<br>
	<br>




	<form action="/textbook/TextServlet?action=searchAll_member"
		method="post">
		<button class = "goodbye" type="submit" value="全商品表示">全商品表示</button>
	</form>
	<br>
	<br>


	<!--  
	 <form>
	 <input type ="submit" value ="タイトルで検索" formaction="/textbook/TextServlet?action=search_title_member">
	 タイトル <input type="text" name="title">
	 <br>
	 <input type ="submit" value ="学部で検索" formaction="/textbook/TextServlet?action=search_sold_id_member">
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
		</select>	
	 <br>	
	 <input type ="submit" value ="検索" formaction="/textbook/TextServlet?action=search_title_sort_member"> 
	 </form>
	 -->


	<%-- 必要か分からないのでコメントアウト
	<input type="button" name="button_test" value="戻る"
		onclick="javascript:history.back()"> --%>


	&nbsp;&nbsp;&nbsp;&nbsp;
	<!-- JavaScript -->
	<button class = "goodbye" type="button" name="logout" value="カートの確認"
		onclick="javascript:location.href='/textbook/CartServlet?action=show'">カートの確認</button>
	<br>
	<button class = "button2" type="button" name="back" value="前ページに戻る"
		onclick="javascript:history.back()">前ページに戻る</button><br>
	<button class = "goodbye" type="button" name="logout" value="ログアウト"
		onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">ログアウト</button>

</body>
</html>