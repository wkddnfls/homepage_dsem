<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="configue.*"%>
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
		try {
			request.setCharacterEncoding("UTF-8");
			String title = request.getParameter("title");
			System.out.println(title);
			request.setCharacterEncoding("euc-kr");
			int year = Integer.parseInt(request.getParameter("year"));
			String part = request.getParameter("part");
			String date = request.getParameter("날짜");
			String authors = request.getParameter("저자");
			String title1 = request.getParameter("제목");
			String proceeding = request.getParameter("발표논문");
			String ISSN = request.getParameter("논문번호");
			String place = request.getParameter("장소");
			String found = request.getParameter("연구비");
			String remarks = request.getParameter("비고");
			
			Class.forName(global.DEFAULT_DRIVER);
			conn = DriverManager.getConnection(global.DEFAULT_URL, global.DEFAULT_USERID, global.DEFAULT_PASSWORD);

			String sql = "UPDATE homepage.conference SET year='" + year + "', part ='" + part + "' ,date= '" + date
					+ "' ,authors='" + authors + "', title= '" + title1 + "', proceeding= '" + proceeding
					+ "', ISSN= '" + ISSN + "', place= '" + place + "', found= '" + found + "', remarks = '"
					+ remarks + "' WHERE title= '" + title + "';";
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);

			pstmt.executeUpdate(sql);
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
		response.sendRedirect("conference_list.jsp");
	%>
</body>
</html>