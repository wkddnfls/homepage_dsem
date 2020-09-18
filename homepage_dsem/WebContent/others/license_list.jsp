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
	<h1> license List
	<button  type="button" onclick="location.href='othersForm.html'" style="font-size: 15px;">등록</button>
	</h1>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>구분</th>
			<th>출원일</th>
			<th>출원번호</th>
			<th>등록일</th>
			<th>등록번호</th>
			<th>발명의 명칭</th>
			<th>출원인</th>
			<th>발명자</th>
			<th>과제</th>
			<th>삭제</th>
			<th>수정</th>
		</tr>
		<tbody>
		<%
			try {
				Class.forName(global.DEFAULT_DRIVER);
				Connection conn = DriverManager.getConnection(global.DEFAULT_URL, global.DEFAULT_USERID,
						global.DEFAULT_PASSWORD);
				String sql = "SELECT * FROM homepage.license order by seq_id desc;";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					int seq_id = Integer.parseInt(rs.getString("seq_id"));
					String part = rs.getString("part");
					String application_date = rs.getString("application_date");
					String application_num = rs.getString("application_num");
					String registration_date = rs.getString("registration_date");
					String registration_num = rs.getString("registration_num");
					String license_name = rs.getString("license_name");
					String application_place = rs.getString("application_place");
					String inventor = rs.getString("inventor");
					String work = rs.getString("work");
		%>		
				<tr>
					<td> <%=seq_id %> </td>
					<td> <%=part%> </td>
					<td> <%=application_date %> </td>
					<td> <%=application_num %> </td>
					<td> <%=registration_date %> </td>
					<td> <%=registration_num %> </td>
					<td> <%=license_name %> </td>
					<td> <%=application_place %> </td>
					<td> <%=inventor %> </td>
					<td> <%=work %> </td>
					<td> <a href="delete_license.jsp?seq_id=<%=seq_id%>">삭제</a></td>
					<td> <a href="modify_license.jsp?seq_id=<%=seq_id%>">수정</a></td>
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