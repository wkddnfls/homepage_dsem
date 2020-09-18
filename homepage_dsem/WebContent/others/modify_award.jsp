<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%!Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;%>
<!DOCTYPE html>
<jsp:useBean id="global" class="configue.global" scope="page" />
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		int seq_id = Integer.parseInt(request.getParameter("seq_id"));
	%>
	<form action="modify_award_ok.jsp?seq_id=<%=seq_id%>" method="post">
		<h1>
			License 수정
			<button type="button" onclick="location.href='award_list.jsp'"
				style="font-size: 15px;">뒤로가기</button>
		</h1>
		<table border="1">
			<tr>
				<th>번호</th>
				<th>날짜</th>
				<th>수상기관</th>
				<th>대회명</th>
				<th>등급</th>
				<th>대상자</th>
				<th>비고</th>
				<th>저장</th>
			</tr>
			<tbody>
				<%
					try {
						Class.forName(global.DEFAULT_DRIVER);
						Connection conn = DriverManager.getConnection(global.DEFAULT_URL, global.DEFAULT_USERID,
								global.DEFAULT_PASSWORD);
						String sql = "select * from homepage.award where seq_id = "+ seq_id;
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery();
						while (rs.next()) {
							int seq_id1 = Integer.parseInt(rs.getString("seq_id"));
							String date = rs.getString("date");
							String award_organization = rs.getString("award_organization");
							String competition_name = rs.getString("competition_name");
							String ranking = rs.getString("ranking");
							String person = rs.getString("person");
							String remarks = rs.getString("remarks");
				%>
				<tr>
					<td> <%=seq_id1 %></td>
					<td><input type="text" name = "date"  value="<%=date%>" /></td>
					<td><input type="text" name = "award_organization"  value="<%=award_organization%>"/></td>
					<td><input type="text" name = "competition_name" value="<%=competition_name%>" /></td>
					<td><input type="text" name = "ranking"  value="<%=ranking%>" /></td>
					<td><input type="text" name = "person" value="<%=person%>" /></td>
					<td><input type="text" name = "remarks"  value="<%=remarks%>" /></td>
					<td><input type="submit" value="저장" /></td>
				</tr>
			</tbody>
			<%
				}
				} catch (Exception e) {
					System.out.println(e.getMessage());
				} finally { //모든 자원 해제
					try {
						if (rs != null)
							rs.close();
						if (pstmt != null)
							pstmt.close();
						if (conn != null)
							conn.close();
					} catch (Exception e2) {
						System.out.println(e2.getMessage());
					}
				}
			%>
		</table>
	</form>
</body>
</html>