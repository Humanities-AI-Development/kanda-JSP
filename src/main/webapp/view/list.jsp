<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList,bms.Book"%>
<html>
	<head>
		<title>list</title>
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

		<div style="margin-bottom:250px">
		<table style="margin:auto">
				<tr>
					<td>
						<form action="<%=request.getContextPath()%>/search">
							isbn：<input type=text size="30" name="isbn"></input>
							title：<input type=text size="30" name="title"></input>
							価格：<input type=text size="30" name="price"></input>
							<input type="submit" name="search" value="検索"></input>
						</form>
					</td>
					<td>
						<form action="<%=request.getContextPath()%>/list">
							<input type="submit" name="searchall" value="全件表示"></input>
						</form>
					</td>
				</tr>
			</table>

			<table style="margin:auto">
				<tr>
					<th style="background-color:#6666ff; width:200px">isbn</th>
					<th style="background-color:#6666ff; width:200px">title</th>
					<th style="background-color:#6666ff; width:200px">価格</th>
					<th style="background-color:#6666ff; width:250px" colspan="2">変更/削除</th>
				</tr>
				<%
				ArrayList<Book> list =(ArrayList<Book>)request.getAttribute("book_list");
				if(list != null){
					for(int i=0;i<list.size();i++){
						Book books = (Book)list.get(i);
				%>
				<tr>
					<td style="text-align:center; width:200px"><a href="<%=request.getContextPath() %>/detail?isbn=<%=books.getIsbn()%>&cmd=detail"><%=books.getIsbn()%></a></td>
					<td style="text-align:center; width:200px"><%=books.getTitle()%></td>
					<td style="text-align:center; width:200px"><%=books.getPrice()%></td>
					<td style="text-align:center; width:125px">
						<a href="<%=request.getContextPath() %>/detail?isbn=<%=books.getIsbn()%>&cmd=update">変更</a>
					</td>
					<td style="text-align:left; width:125px">
						<a href="<%=request.getContextPath()%>/delete?isbn=<%=books.getIsbn()%>">削除</a>
					</td>
				</tr>
				<%
					}
				}else{
				%>
				<tr>
					<td style="text-align:center; width:200px">&nbsp;</td>
					<td style="text-align:center; width:200px">&nbsp;</td>
					<td style="text-align:center; width:200px">&nbsp;</td>
					<td style="text-align:center; width:250px" colspan="2">&nbsp;</td>
				</tr>
				<%
				}
				%>
			</table>
		</div>
		
		
<!-- -------------ここまからフッター ---------------------------------------------------------------->


		<hr style="text-align:center; height:5px; background-color:blue; width:950px">

		<table style="margin:auto; border:0; width:950px; text-align:center">
			<tr><td>copyright (c) 2023 all rights reserved.</td></tr>
		</table>
	</body>
</html>