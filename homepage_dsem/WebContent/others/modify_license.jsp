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
<title>modify_license</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		int seq_id = Integer.parseInt(request.getParameter("seq_id"));
	%>
	<form action="modify_license_ok.jsp?seq_id=<%=seq_id%>" method="post">
		<h1>
			License 수정
			<button type="button" onclick="location.href='license_list.jsp'"
				style="font-size: 15px;">뒤로가기</button>
		</h1>
		<table border="1">
			<tr>
				<th>번호 </th>
				<th>구분</th>
				<th>출원일</th>
				<th>출원번호</th>
				<th>등록일</th>
				<th>등록번호</th>
				<th>발명의 명칭</th>
				<th>출원인</th>
				<th>발명자</th>
				<th>과제</th>
				<th>저장</th>
			</tr>
			<tbody>
				<%
					try {
						Class.forName(global.DEFAULT_DRIVER);
						Connection conn = DriverManager.getConnection(global.DEFAULT_URL, global.DEFAULT_USERID,
								global.DEFAULT_PASSWORD);
						String sql = "select * from homepage.license where seq_id = " + seq_id;
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery();
						while (rs.next()) {
							int seq_id1 = Integer.parseInt(rs.getString("seq_id"));
							String part = rs.getString("part");
							String application_date = rs.getString("application_date");
							String application_num = rs.getString("application_num");
							String registration_date = rs.getString("registration_date");
							String registration_num = rs.getString("registration_num");
							String license_name1 = rs.getString("license_name");
							String application_place = rs.getString("application_place");
							String inventor = rs.getString("inventor");
							String work = rs.getString("work");
				%>
				<tr>
					<td> <%=seq_id1 %></td>
					<td><input type="text" id="part" name="구분" value="<%=part%>" /></td>
					<td><input type="text" id="application_date" name="출원일"
						value="<%=application_date%>" /></td>
					<td><input type="text" id="application_num" name="출원번호"
						value="<%=application_num%>" /></td>
					<td><input type="text" id="registration_date" name="등록일"
						value="<%=registration_date%>" /></td>
					<td><input type="text" id="registration_num" name="등록번호"
						value="<%=registration_num%>" /></td>
					<td><input type="text" id="license_name" name="발명의 명칭"
						value="<%=license_name1%>" /></td>
					<td><input type="text" id="application_place" name="출원인"
						value="<%=application_place%>" /></td>
					<td><input type="text" id="inventor" name="발명자"
						value="<%=inventor%>" /></td>
					<td><input type="text" id="work" name="과제" value="<%=work%>" /></td>
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