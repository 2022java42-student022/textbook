<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登録済教科書参照</title>
<link rel="stylesheet" type="text/css"
	href="/textbook/CSS/showMyText.css">
</head>
<body>


	<h3>登録済み教科書</h3>

	<c:if test="${empty textbooks}">
		<h5>現在、登録している教科書はありません。</h5>
	</c:if>

	<c:if test="${not empty textbooks}">
		<table class="order-table">
			<tr>
				<th class="order-th">ISBN</th>
				<th class="order-th">タイトル</th>
				<th class="order-th">分類</th>
				<th class="order-th">著者名</th>
				<th class="order-th">金額</th>
				<th class="order-th"></th>
			</tr>
			<c:forEach items="${textbooks}" var="textbooks">
				<tr>
					<td class="order-body"><fmt:formatNumber
							value="${textbooks.ISBN}" pattern="0000000000000" /></td>
					<td class="order-body">${textbooks.title}</td>
					<td class="order-body">${textbooks.dep_name}</td>
					<td class="order-body">${textbooks.author}</td>
					<td class="order-body">${textbooks.price}</td>
					<td class="order-body">
						<form action="/textbook/TextServlet?action=inputChange"
							method="post">
							<input type="hidden" name="text_id" value="${textbooks.text_id}">
							<button class="button1" type="submit" value="登録内容変更">登録内容変更</button>
							<%-- input→buttonタグ変更、エラー発生したら確認--%>
						</form>
					</td>
				</tr>
			</c:forEach>
		</table>
		<br>

	</c:if>

	<br>
	<button class="button2" type="button" name="back" value="前ページに戻る"
		onclick="javascript:history.back()">前ページに戻る</button>
	<br>
	<button class="goodbye" type="button" name="logout" value="ログアウト"
		onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">ログアウト</button>


</body>
</html>