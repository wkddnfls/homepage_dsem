<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../menu.jsp" %>
<%!Connection connection = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
%>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
%>
<!DOCTYPE html>
<jsp:useBean id="global" class="configue.global" scope="page" />
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="activity.css?ver=1.1">
<title>Insert title here</title>
<script>
	function popup() {
		var url = "delete_board.jsp?idx=<%=idx%>";
		var name = "삭제";
		var option = "width = 560, height = 200, top = 250, left = 550, location = no"
		window.open(url, name, option);
	}
	function popup1() {
		var url = "modify_board.jsp?idx=<%=idx%>";
		var name = "수정";
		var option = "width = 600, height = 630, top = 200, left = 500, location = no"
		window.open(url, name, option);
	}
</script>
</head>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
		String sql = "SELECT name, TITLE, MEMO, TIME, HIT ,filename FROM homepage.board WHERE NUM=" + idx;
		Class.forName(global.DEFAULT_DRIVER);
		Connection conn = DriverManager.getConnection(global.DEFAULT_URL, global.DEFAULT_USERID, global.DEFAULT_PASSWORD);
		pstmt = conn.prepareStatement(sql);

		try {
			ResultSet rs = pstmt.executeQuery(sql);
			if (rs.next()) {
				String name = rs.getString(1);
				String title = rs.getString(2);
				String memo = rs.getString(3);
				String time = rs.getString(4);
				int hit = rs.getInt(5);
				String filename = rs.getString(6);
				hit++;
	%>

	<div style="padding: 150px 0px 0px 30%;">
		<table width="60%" height="10">
			<tr>
				<td>
					<div
						style="height: 30px; border: 2px solid #A4A4A4; border-radius: 5px;">
						<p
							style="text-align: center; line-height: 28px; font-weight: bold;">내용</p>
					</div>
				</td>
			</tr>
		</table>
		<br>
		<table style="width: 60%;">
			<tr height="2" bgcolor="#dddddd">
				<td colspan="3"></td>
			</tr>
			<tr height="5" bgcolor="#82B5DF">
				<td colspan="3"></td>
			</tr>
			<tr>
				<td height="40">
					<p style="text-align: center;">&nbsp;&nbsp;조회수 :</p>
				</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;<%=hit%></td>
				<td width="0">&nbsp;</td>
			</tr>
			<tr height="2" bgcolor="#dddddd">
				<td colspan="3"></td>
			</tr>
			<tr>
				<td height="40" width="76"><p style="text-align: center;">&nbsp;&nbsp;&nbsp;이름
						&nbsp; :</p></td>
				<td width="0">&nbsp;&nbsp;&nbsp;&nbsp;<%=name%></td>
				<td width="0">&nbsp;</td>
			</tr>
			<tr height="2" bgcolor="#dddddd">
				<td colspan="3"></td>
			</tr>
			<tr>
				<td height="40"><p style="text-align: center;">&nbsp;&nbsp;작성일
						:</p></td>
				<td >&nbsp;&nbsp;&nbsp;&nbsp;<%=time%></td>
				<td width="0">&nbsp;</td>
			</tr>
			<tr height="2" bgcolor="#dddddd">
				<td colspan="3" width="407"></td>
			</tr>
			<tr>
				<td height="40" width="76"><p style="text-align: center;">&nbsp;&nbsp;&nbsp;제목
						&nbsp; :</p></td>
				<td width="319">&nbsp;&nbsp;&nbsp;&nbsp;<%=title%></td>
				<td width="0">&nbsp;</td>
			</tr>
			<tr height="2" bgcolor="#dddddd">
				<td colspan="3" width="407"></td>
			</tr>
			<tr>
				<td height="100"></td>
				<td width="0"><%=memo%></td>
			</tr>
			<%
				if (filename == null || filename.equals("null")) {
			%>
			<tr>
				<td height="100"></td>
				<td width="400"></td>
            	<td height="100"></td>
         </tr>
         <%
         	} else {
         %>
         <tr>
            <td height="100"></td>
            <td><img src="../image/<%=filename%>" max-width=512></img></td>
            <td height="100"></td>
         </tr>
		<%
			}
		%>
			<br>
			<tr height="2" bgcolor="#dddddd">
				<td colspan="3" width="512"></td>
			</tr>
			<tr height="5" bgcolor="#82B5DF">
				<td colspan="3" width="512"></td>
			</tr>
			<%
				sql = "UPDATE homepage.board SET HIT=" + hit + " where NUM=" + idx;
				pstmt.executeUpdate(sql);
					}
				} catch (Exception e) {
					System.out.println(e.getMessage());
				} finally { //모든 자원 해제
					try {
						if (rs != null)
							rs.close();
						if (pstmt != null)
							pstmt.close();
						if (connection != null)
							connection.close();
					} catch (Exception e2) {
						System.out.println(e2.getMessage());
					}
				}
			%>
			<tr align="center">
				<td width="0">&nbsp;</td>
				<td colspan="3" width="399"><br>
				<br> 
					<input type=button style="position: absolute; left:1210px; font-size: 15px;" onclick="location.href='activity.jsp'" value="목록">
					<input type=button style="position: absolute; left:1255px; font-size: 15px;" value="수정" OnClick="window.location='javascript:popup1()'"> 
					<input type=button style="position: absolute; left:1300px; font-size: 15px;" onClick="window.location='javascript:popup()'" value="삭제">
					<br> 
					<br> 
				</td>
			</tr>
		</table>
	</div>
</body>
</html>