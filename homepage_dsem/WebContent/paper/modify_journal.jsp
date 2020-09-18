<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%!Connection conn = null;
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
	<%
		request.setCharacterEncoding("UTF-8");
		String title = request.getParameter("title");
		System.out.println(title);
	%>
	<form action="modify_journal_ok.jsp?title=<%=title%>" method="post">
		<h1>Journal 수정
		<button  type="button" onclick="location.href='journal_list.jsp'" style="font-size: 15px;">뒤로가기</button>
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
				<th>수정</th>
			</tr>
			<tbody>
				<%
					try {
						Class.forName(global.DEFAULT_DRIVER);
						Connection conn = DriverManager.getConnection(global.DEFAULT_URL, global.DEFAULT_USERID,
								global.DEFAULT_PASSWORD);
						String sql = "select * from homepage.journal where title = '" + title + "';";
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery();
						while (rs.next()) {
							//	int seq_id = Integer.parseInt(rs.getString("seq_id"));
							int year = Integer.parseInt(rs.getString("year"));
							String part = rs.getString("part");
							String date = rs.getString("date");
							String authors = rs.getString("authors");
							String title1 = rs.getString("title");
							String journal_name = rs.getString("journal_name");
							String other = rs.getString("other");
							String ISSN = rs.getString("ISSN");
							String paper_index = rs.getString("paper_index");
							String IF = rs.getString("IF_");
							String found = rs.getString("found_");
							String doi = rs.getString("doi");
				%>
				<tr>
					<td><input type="text" size="5" id="year" name="year" value="<%=year%>"/>
					</td>
					<td><select id="part" name="part">
							<option value="DJ">DJ</option>
							<option value="IJ">IJ</option>
					</select></td>
					<td><input type="text" size="10" id="날짜" name="날짜" value="<%=date%>"/></td>
					<td><input type="text" id="authors" name="저자" value="<%=authors%>"/></td>
					<td><input type="text" id="title" name="제목" value="<%=title%>"/></td>
					<td><input type="text" id="journal_name" name="저널명" value="<%=journal_name%>"/></td>
					<td><input type="text" id="기타" name="기타" value="<%=other%>"/></td>
					<td><input type="text" id="ISSN" name="논문번호" value="<%=ISSN%>"/></td>
					<td><input type="text" size="10" id="paper_index" name="등재지" value="<%=paper_index%>"/></td>
					<td><input type="text" id="IF" name="인용지수" value="<%=IF%>"/></td>
					<td><input type="text" id="연구비" name="연구비" value="<%=found%>"/></td>
					<td><input type="text" id="doi" name="식별번호" value="<%=doi%>"/></td>
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