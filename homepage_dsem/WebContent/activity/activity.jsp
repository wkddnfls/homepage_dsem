<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ page import="configue.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../menu.jsp" %>

<%!Connection connection = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;%>
<!DOCTYPE>
<jsp:useBean id="global" class="configue.global" scope="page" />
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="activity.css?ver=1.1">
<title>게시판</title>
<script>
	function popup() {
		var url = "activitywrite.jsp";
		var name = "글쓰기";
		var option = "width = 620, height =700, top = 200, left = 500, location = no"
		window.open(url, name, option);
	}
</script>
</head>
<body>
	<div id="a">
		<%
			Class.forName(global.DEFAULT_DRIVER);
			int total = 0;

			try {
				Connection conn = DriverManager.getConnection(global.DEFAULT_URL, global.DEFAULT_USERID, global.DEFAULT_PASSWORD);
				Statement stmt = conn.createStatement();

				String sqlCount = "SELECT COUNT(*) FROM homepage.board;";
				ResultSet rs = stmt.executeQuery(sqlCount);

				if (rs.next()) {
					total = rs.getInt(1);
				}
				rs.close();
				out.print("총 게시물 : " + total + "개");

				String sqlList = "SELECT * from homepage.board order by num DESC;";
				rs = stmt.executeQuery(sqlList);
		%>


		<table width="100%" border="0">
			<tr height="10">
				<td width="5"></td>
			</tr>
			<tr
				style="background: url('img/table_mid.gif') repeat-x; text-align: center;">
				<td width="73">번호</td>
				<td width="379">제목</td>
				<td width="73">작성자</td>
				<td width="164">작성일</td>
				<td width="58">조회수</td>
			</tr>
			<%
				if (total == 0) {
			%>
			<tr align="center" bgcolor="#FFFFFF" height="30">
				<td colspan="7">등록된 글이 없습니다.</td>
			</tr>
			<%
				} else {
					int idx = total+1;
						while (rs.next()) {
							String title = rs.getString(4);
							String name = rs.getString(2);
							String time = rs.getString(6);
							int hit = rs.getInt(7);
							--idx;
							
			%>
			<trheight ="25" align="center">
			<td width="73" align="center"><%=idx%></td>
			<td width="379" align="center"><a href="board_view.jsp?idx=<%=idx%>"><%=title%></td>
			<td width="73" align="center"><%=name%></td>
			<td width="164" align="center"><%=time%></td>
			<td width="58" align="center"><%=hit%></td>
			</tr>
			<tr height="1" bgcolor="#D2D2D2">
				<td colspan="6"></td>
			</tr>
			<%
						}
					}
					rs.close();
					stmt.close();
					conn.close();
				} catch (SQLException e) {
					out.println(e.toString());
				}
			%>
			<tr height="1" bgcolor="#82B5DF">
				<td colspan="6" width="752"></td>
			</tr>
		</table>
	</div>
	<table width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td colspan="4" height="5"></td>
		</tr>
		<tr align="center">
			<td><input type=button style="font-size: 17px;"
				onclick="window.location='javascript:popup()'" value="글쓰기"></td>
		</tr>
	</table>
</body>
</html>