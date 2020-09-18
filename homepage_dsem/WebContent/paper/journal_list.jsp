<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="configue.*"%>
<%!
	Connection connection = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	%>
<!DOCTYPE html>
<jsp:useBean id="global" class="configue.global" scope="page" />
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1> Journal List
	<button  type="button" onclick="location.href='paperdb.html'" style="font-size: 15px;">등록</button>
	</h1>
	<table border="1">
		<tr>
			<th>year</th>
			<th>part</th>
			<th>date</th>
			<th>authors</th>
			<th>title</th>
			<th>journal_name</th>
			<th>other</th>
			<th>ISSN</th>
			<th>paper_index</th>
			<th>IF_</th>
			<th>found_</th>
			<th>doi</th>
			<th>삭제</th>
			<th>수정</th>
		</tr>
		<tbody>
		<%
			try {
				Class.forName(global.DEFAULT_DRIVER);
				Connection conn = DriverManager.getConnection(global.DEFAULT_URL, global.DEFAULT_USERID, global.DEFAULT_PASSWORD);
				String sql = "select * from homepage.journal order by year desc,date asc;";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
				//	int seq_id = Integer.parseInt(rs.getString("seq_id"));
					int year = Integer.parseInt(rs.getString("year"));
					String part = rs.getString("part");
					String date = rs.getString("date");
					String authors = rs.getString("authors");
					String title = rs.getString("title");
					String journal_name = rs.getString("journal_name");
					String other = rs.getString("other");
					String ISSN = rs.getString("ISSN");
					String paper_index = rs.getString("paper_index");
					String IF = rs.getString("IF_");
					String found = rs.getString("found_");
					String doi = rs.getString("doi");
		%>
				<tr>
					<td> <%=year %> </td>
					<td> <%=part%> </td>
					<td> <%=date %> </td>
					<td> <%=authors %> </td>
					<td> <%=title %> </td>
					<td> <%=journal_name %> </td>
					<td> <%=other %> </td>
					<td> <%=ISSN %> </td>
					<td> <%=paper_index %> </td>
					<td> <%=IF %> </td>
					<td> <%=found %> </td>
					<td> <%=doi %> </td>
					<td> <a href="delete_journal.jsp?title=<%=title%>">삭제</a></td>
					<td> <a href="modify_journal.jsp?title=<%=title%>">수정</a></td>
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