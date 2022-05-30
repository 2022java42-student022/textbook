<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search</title>
<link rel="stylesheet" type="text/css"
	href="/textbook/CSS/memSearch.css">
</head>
<body>

<h1>会員検索</h1>

<form action="/textbook/MemberServlet?action=search" method="post">
<table class="customer">
			
			<tr>
        <th class="customer-item">メールアドレス</th>
        <td class="customer-body"><input type="email" name="email" size="40" placeholder="メールアドレスを入力してください" required
         class="form-text"></td>
      </tr>
			
		
		</table>
		
		<br>
		<div class="buttons">
			<button class="button2" type="button" name="back" value="前ページに戻る"
				onclick="javascript:location.href='/textbook/Login/top.jsp'">前ページに戻る</button>
			<br>
			<button class="button1" type="submit" value="検索">検索</button>
		</div>
		<button class="goodbye" type="button" name="logout" value="ログアウト"
			onclick="javascript:location.href='/textbook/LoginServlet?action=logout'">ログアウト</button>
		
	</form>
	
</body>
</html>