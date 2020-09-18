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
		String title = request.getParameter("title");
		System.out.println(title);
	%>
	<form action="modify_conference_ok.jsp?title=<%=title%>" method="post">
		<h1>Conference 수정
		<button  type="button" onclick="location.href='conference_list.jsp'" style="font-size: 15px;">뒤로가기</button>
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
				<th>저장</th>
			</tr>
			<tbody>
				<%
					try {
						Class.forName(global.DEFAULT_DRIVER);
						Connection conn = DriverManager.getConnection(global.DEFAULT_URL, global.DEFAULT_USERID,
								global.DEFAULT_PASSWORD);
						String sql = "select * from homepage.conference where title = '" + title + "';";
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery();
						while (rs.next()) {
							//	int seq_id = Integer.parseInt(rs.getString("seq_id"));
							int year = Integer.parseInt(rs.getString("year"));
							String part = rs.getString("part");
							String date = rs.getString("date");
							String authors = rs.getString("authors");
							String title1 = rs.getString("title");
							String proceeding = rs.getString("proceeding");
							String ISSN = rs.getString("ISSN");
							String place = rs.getString("place");
							String found = rs.getString("found");
							String remarks = rs.getString("remarks");
				%>
				<tr>
					<td><input type="text" size="5" id="year" name="year" value="<%=year%>" /></td>
					<td><select id="part" name="part">
							<option value="DJ">DJ</option>
							<option value="IJ">IJ</option>
					</select></td>
					<td><input type="text" size="10" id="날짜" name="날짜" value="<%=date%>" /></td>
					<td><input type="text" id="authors" name="저자" value="<%=authors%>" /></td>
					<td><input type="text" id="title" name="제목" value="<%=title%>" /></td>
					<td><input type="text" id="proceeding" name="발표논문" value="<%=proceeding%>" /></td>
					<td><input type="text" id="ISSN" name="논문번호" value="<%=ISSN%>" /></td>
					<td><input type="text" id="place" name="장소" value="<%=place%>" /></td>
					<td><input type="text" id="연구비" name="연구비" value="<%=found%>" /></td>
					<td><input type="text" id="비고" name="비고" value="<%=remarks%>" /></td>
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