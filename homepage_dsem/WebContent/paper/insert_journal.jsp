<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%!
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String query = "insert into homepage.journal values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
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
		try {
			request.setCharacterEncoding("euc-kr");
			int year = Integer.parseInt(request.getParameter("year"));
			String part = request.getParameter("part");
			String date = request.getParameter("날짜");
			String authors = request.getParameter("저자");
			String title = request.getParameter("제목");
			String journal_name = request.getParameter("저널명");
			String other = request.getParameter("기타");
			String ISSN = request.getParameter("논문번호");
			String paper_index = request.getParameter("등재지");
			String IF = request.getParameter("인용지수");
			String found = request.getParameter("연구비");
			String doi = request.getParameter("식별번호");

			Class.forName(global.DEFAULT_DRIVER);
			Connection conn = DriverManager.getConnection(global.DEFAULT_URL, global.DEFAULT_USERID, global.DEFAULT_PASSWORD);
			PreparedStatement pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, year);
			pstmt.setString(2, part);
			pstmt.setString(3, date);
			pstmt.setString(4, authors);
			pstmt.setString(5, title);
			pstmt.setString(6, journal_name);
			pstmt.setString(7, other);
			pstmt.setString(8, ISSN);
			pstmt.setString(9, paper_index);
			pstmt.setString(10, IF);
			pstmt.setString(11, found);
			pstmt.setString(12, doi);

			pstmt.executeUpdate();
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
		response.sendRedirect("./paper.jsp");
	%>
</body>
</html>