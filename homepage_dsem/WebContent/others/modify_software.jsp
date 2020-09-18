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
	<form action="modify_software_ok.jsp?seq_id=<%=seq_id%>" method="post">
		<h1>
			software_copyright 수정
			<button type="button" onclick="location.href='software_list.jsp'"
				style="font-size: 15px;">뒤로가기</button>
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
						Connection conn = DriverManager.getConnection(global.DEFAULT_URL, global.DEFAULT_USERID,
								global.DEFAULT_PASSWORD);
						String sql = "select * from homepage.software where seq_id = "+ seq_id;
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery();
						while (rs.next()) {
							int seq_id1 = Integer.parseInt(rs.getString("seq_id"));
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
					<td> <%=seq_id1 %></td>
					<td><input type="text" id = "part" name="구분" value="<%=part%>" /></td>
					<td><input type="text" id = "institution" name="기관" value="<%=institution%>"/></td>
					<td><input type="text" id = "number" name="호수" value="<%=number%>" /></td>
					<td><input type="text" id = "designation" name="저작물 명칭" value="<%=designation%>" /></td>
					<td><input type="text" id = "writer" name="저작자" value="<%=writer%>" /></td>
					<td><input type="text" id = "creative_date" name="창작일" value="<%=creative_date%>" /></td>
					<td><input type="text" id = "registration_date" name="등록일" value="<%=registration_date%>" /></td>
					<td><input type="text" id = "originator" name="창작자" value="<%=originator%>" /></td>
					<td><input type="text" id = "found_" name="과제" value="<%=found_%>" /></td>
					<td><input type="text" id = "remarks" name="구분" value="<%=remarks%>" /></td>
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