<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%!
	Connection connection = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	%>
<!DOCTYPE html>
<jsp:useBean id="global" class="configue.global" scope="page" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> Conference List
	<button  type="button" onclick="location.href='paperdb.html'" style="font-size: 15px;">등록</button>
	</h1>
	<table border="1">
		<tr>
			<th>year</th>
			<th>part</th>
			<th>date</th>
			<th>authors</th>
			<th>title</th>
			<th>proceeding</th>
			<th>ISSN</th>
			<th>place</th>
			<th>연구비</th>
			<th>비고</th>
			<th>삭제</th>
			<th>수정</th>
		</tr>
		<tbody>
		<%
			try {
				Class.forName(global.DEFAULT_DRIVER);
				Connection conn = DriverManager.getConnection(global.DEFAULT_URL, global.DEFAULT_USERID, global.DEFAULT_PASSWORD);
				String sql = "SELECT * FROM homepage.conference order by year desc,date asc;";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
				//	int seq_id = Integer.parseInt(rs.getString("seq_id"));
					int year = Integer.parseInt(rs.getString("year"));
					String part = rs.getString("part");
					String date = rs.getString("date");
					String authors = rs.getString("authors");
					String title = rs.getString("title");
					String proceeding = rs.getString("proceeding");
					String ISSN = rs.getString("ISSN");
					String place = rs.getString("place");
					String found = rs.getString("found");
					String remarks = rs.getString("remarks");
		%>		
				<tr>
					<td> <%=year %> </td>
					<td> <%=part%> </td>
					<td> <%=date %> </td>
					<td> <%=authors %> </td>
					<td> <%=title %> </td>
					<td> <%=proceeding %> </td>
					<td> <%=ISSN %> </td>
					<td> <%=place %> </td>
					<td> <%=found %> </td>
					<td> <%=remarks %> </td>
					<td> <a href="delete_conference.jsp?title=<%=title%>">삭제</a></td>
					<td> <a href="modify_conference.jsp?title=<%=title%>">수정</a></td>
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