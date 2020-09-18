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
	<h1> software_copyright List
	<button  type="button" onclick="location.href='othersForm.html'" style="font-size: 15px;">등록</button>
	</h1>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>구분</th>
			<th>기관</th>
			<th>호수</th>
			<th>저작물 명칭</th>
			<th>저작자</th>
			<th>창작일</th>
			<th>등록일</th>
			<th>창작자</th>
			<th>과제</th>
			<th>비고</th>
		</tr>
		<tbody>
		<%
			try {
				Class.forName(global.DEFAULT_DRIVER);
				Connection conn = DriverManager.getConnection(global.DEFAULT_URL, global.DEFAULT_USERID, global.DEFAULT_PASSWORD);
				String sql = "SELECT * FROM homepage.software order by seq_id desc;";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					int seq_id = Integer.parseInt(rs.getString("seq_id"));
					String part = rs.getString("part");
					String institution = rs.getString("institution");
					String number = rs.getString("number");
					String designation = rs.getString("designation");
					String writer = rs.getString("writer");
					String creative_date = rs.getString("creative_date");
					String registration_date = rs.getString("registration_date");
					String originator = rs.getString("originator");
					String found_ = rs.getString("found_");
					String remarks = rs.getString("remarks");
		%>		
				<tr>
					<td> <%=seq_id %> </td>
					<td> <%=part%> </td>
					<td> <%=institution %> </td>
					<td> <%=number %> </td>
					<td> <%=designation %> </td>
					<td> <%=writer %> </td>
					<td> <%=creative_date %> </td>
					<td> <%=registration_date %> </td>
					<td> <%=originator %> </td>
					<td> <%=found_ %> </td>
					<td> <%=remarks %> </td>
					<td> <a href="delete_software.jsp?seq_id=<%=seq_id%>">삭제</a></td>
					<td> <a href="modify_software.jsp?seq_id=<%=seq_id%>">수정</a></td>
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