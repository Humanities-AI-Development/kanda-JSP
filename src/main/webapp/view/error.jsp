<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList,bms.Book"%>
<%
String error = (String)request.getAttribute("error");
String link = (String)request.getAttribute("link");
%>

<html>
	<head>
		<title>error</title>
	</head>
	<body>
<!-- -------------ここからがヘッダー ---------------------------------------------------------------->

		<h1 style="text-align:center">書籍管理システムweb版ver.1.0</h1>
		<hr style="text-align:center; height:5px; background-color:blue; width:950px">

<!-- -------------ここまでがヘッダー ---------------------------------------------------------------->

		<div style="text-align:center;margin-top:80px;">
		<h2>●●エラー●●</h2>
		<br><br><br><br>
		<% if (error != null && !error.isEmpty()) { %>
            <%= error %>
            <br><br><br><br><br>
		
		<a href="<%=link %>">戻る</a>
    	<% } %>

	</div>
		
		
<!-- -------------ここまからフッター ---------------------------------------------------------------->


		<hr style="text-align:center; height:5px; background-color:blue; width:950px">

		<table style="margin:auto; border:0; width:950px; text-align:center">
			<tr><td>copyright (c) 2023 all rights reserved.</td></tr>
		</table>
	</body>
</html>