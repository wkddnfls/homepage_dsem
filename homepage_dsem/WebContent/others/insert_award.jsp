<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%!Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String query = "insert into homepage.award values(?, ?, ?, ?, ?, ?, ?);";%>
<!DOCTYPE html>
<jsp:useBean id="global" class="configue.global" scope="page" />
<html>
<head>
<meta charset="EUC-KR">
<title>award</title>
</head>
<body>

	<%
		try {
			Class.forName(global.DEFAULT_DRIVER);
			Connection conn = DriverManager.getConnection(global.DEFAULT_URL, global.DEFAULT_USERID,
					global.DEFAULT_PASSWORD);
			Statement stmt = conn.createStatement();
			int n = 0;
			String sql = "select count(*) from homepage.award";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				n = rs.getInt(1);
			}
			pstmt = conn.prepareStatement(query);
			request.setCharacterEncoding("euc-kr");
			String date = request.getParameter("날짜");
			String award_organization = request.getParameter("수상기관");
			String competition_name = request.getParameter("대회명");
			String ranking = request.getParameter("등급");
			String person = request.getParameter("대상자");
			String remarks = request.getParameter("비고");
			if (n == 0) {
				pstmt.setInt(1, 1);
			} else {
				n++;
				pstmt.setInt(1, n);
			}
			pstmt.setString(2, date);
			pstmt.setString(3, award_organization);
			pstmt.setString(4, competition_name);
			pstmt.setString(5, ranking);
			pstmt.setString(6, person);
			pstmt.setString(7, remarks);

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
		response.sendRedirect("others.jsp");
	%>
</body>
</html>