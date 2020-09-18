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
			int seq_id = Integer.parseInt(request.getParameter("seq_id"));
			String date = request.getParameter("date");
			String award_organization = request.getParameter("award_organization");
			String competition_name = request.getParameter("competition_name");
			String ranking = request.getParameter("ranking");
			String person = request.getParameter("person");
			String remarks = request.getParameter("remarks");
			
			Class.forName(global.DEFAULT_DRIVER);
			conn = DriverManager.getConnection(global.DEFAULT_URL, global.DEFAULT_USERID, global.DEFAULT_PASSWORD);

			String sql = "UPDATE homepage.award SET date='" + date + "', award_organization ='" + award_organization + "' ,competition_name= '" + competition_name
					+ "' ,ranking='" + ranking + "', person= '" + person + "', remarks= '" + remarks + "' WHERE seq_id= " + seq_id;
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
		response.sendRedirect("award_list.jsp");
	%>
</body>
</html>