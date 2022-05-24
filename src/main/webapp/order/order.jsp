<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注文完了</title>
</head>
<body>

	<h4>ご注文ありがとうございます。</h4>

	お客様の注文番号は

	<h4><font color = "red">${orderID}</font></h4>

	になります。<br>

	<a href = "/textbook/Login/memHome.jsp">HOMEへ戻る</a>
	
</body>
</html>