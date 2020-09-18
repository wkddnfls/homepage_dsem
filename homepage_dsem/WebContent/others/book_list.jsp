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
<title>book list</title>
</head>
<body>
	<h1> book List
	<button  type="button" onclick="location.href='othersForm.html'" style="font-size: 15px;">등록</button>
	</h1>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>구분</th>
			<th>날짜</th>
			<th>저자</th>
			<th>저서명</th>
			<th>출판사</th>
			<th>ISBN</th>
			<th>비고</th>
		</tr>
		<tbody>
		<%
			try {
				Class.forName(global.DEFAULT_DRIVER);
				Connection conn = DriverManager.getConnection(global.DEFAULT_URL, global.DEFAULT_USERID, global.DEFAULT_PASSWORD);
				String sql = "SELECT * FROM homepage.book order by seq_id desc;";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					int seq_id = Integer.parseInt(rs.getString("seq_id"));
					String part = rs.getString("part");
					String date = rs.getString("date");
					String authors = rs.getString("authors");
					String book_name = rs.getString("book_name");
					String publisher = rs.getString("publisher");
					String ISBN = rs.getString("ISBN");
					String remarks = rs.getString("remarks");
		%>		
				<tr>
					<td> <%=seq_id %> </td>
					<td> <%=part%> </td>
					<td> <%=date%> </td>
					<td> <%=authors %> </td>
					<td> <%=book_name %> </td>
					<td> <%=publisher %> </td>
					<td> <%=ISBN %> </td>
					<td> <%=remarks %> </td>
					<td> <a href="delete_book.jsp?seq_id=<%=seq_id%>">삭제</a></td>
					<td> <a href="modify_book.jsp?seq_id=<%=seq_id%>">수정</a></td>
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