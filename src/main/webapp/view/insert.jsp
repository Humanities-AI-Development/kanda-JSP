<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList,bms.Book"%>

<%
String error = (String)request.getAttribute("error");	
%>

<html>
	<head>
		<title>update</title>
	</head>
	<body>
<!-- -------------ここからがヘッダー ---------------------------------------------------------------->

		<h1 style="text-align:center">書籍管理システムweb版ver.1.0</h1>
		<hr style="text-align:center; height:5px; background-color:blue; width:950px">

		<table style="margin:auto; width:850px">
			<tr>
				<td style="text-align:center; width:80px">[<a href="<%=request.getContextPath() %>/view/menu.jsp">メニュー</a>]</td>
				<td style="text-align:center; width:80px">[<a href="<%=request.getContextPath() %>/view/insert.jsp">書籍登録</a>]</td>
				<td style="text-align:center; width:508px; font-size:24px;">書籍一覧</td>
				<td style="width:80px">&nbsp;</td>
				<td style="width:80px">&nbsp;</td>
			</tr>
		</table>

		<hr style="text-align:center; height:2px; background-color:black; width:950px">
<!-- -------------ここまでがヘッダー ---------------------------------------------------------------->

		<div style="text-align:center;margin-top:80px;">
		
		<% if (error != null && !error.isEmpty()) { %>
        <div style="color: red;">
            <%= error %>
        </div>
    <% } %>
		<!-- サーブレットのアノテーションを指定する -->
		<form action="<%=request.getContextPath()%>/insert">
		
			<table style="margin: 0 auto">
				<tr>
					<th style="background-color: #6666ff; width: 150">ISBN</th>
					<td><input type=text size="30" name="isbn"></input></td>
				</tr>

				<tr>
					<th style="background-color: #6666ff; width: 150">TITLE</th>
					<td><input type=text size="30" name="title"></input></td>
				</tr>

				<tr>
					<th style="background-color: #6666ff; width: 150">価格</th>
					<td><input type=text size="30" name="price"></input></td>
				</tr>
				
				<tr>
				
					<td colspan=2 style="text-align: center;padding-top:60px;"><input type="submit"
						value="登録"></td>
				</tr>
				
			</table>
		</form>
		<br><br><br><br><br>



	</div>
		
		
<!-- -------------ここまからフッター ---------------------------------------------------------------->


		<hr style="text-align:center; height:5px; background-color:blue; width:950px">

		<table style="margin:auto; border:0; width:950px; text-align:center">
			<tr><td>copyright (c) 2023 all rights reserved.</td></tr>
		</table>
	</body>
</html>