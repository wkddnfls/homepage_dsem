<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%!
	Connection connection = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	%>
<!DOCTYPE html>
<jsp:useBean id="global" class="configue.global" scope="page"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> award List
	<button  type="button" onclick="location.href='othersForm.html'" style="font-size: 15px;">등록</button>
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
		</tr>
		<tbody>
		<%
			try {
				Class.forName(global.DEFAULT_DRIVER);
				Connection conn = DriverManager.getConnection(global.DEFAULT_URL, global.DEFAULT_USERID, global.DEFAULT_PASSWORD);
				String sql = "SELECT * FROM homepage.award order by seq_id desc;";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					int seq_id = Integer.parseInt(rs.getString("seq_id"));
					String date = rs.getString("date");
					String award_organization = rs.getString("award_organization");
					String competition_name = rs.getString("competition_name");
					String ranking = rs.getString("ranking");
					String person = rs.getString("person");
					String remarks = rs.getString("remarks");
		%>		
				<tr>
					<td> <%=seq_id %> </td>
					<td> <%=date%> </td>
					<td> <%=award_organization %> </td>
					<td> <%=competition_name %> </td>
					<td> <%=ranking %> </td>
					<td> <%=person %> </td>
					<td> <%=remarks %> </td>
					<td> <a href="delete_award.jsp?seq_id=<%=seq_id%>">삭제</a></td>
					<td> <a href="modify_award.jsp?seq_id=<%=seq_id%>">수정</a></td>
				</tr>
			</tbody>
		<% 
				}
			}catch (Exception e) {
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
	</table>
</body>
</html>