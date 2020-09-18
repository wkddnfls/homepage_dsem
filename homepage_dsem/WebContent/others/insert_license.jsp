<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%!Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String query = "insert into homepage.license values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";%>
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
			Class.forName(global.DEFAULT_DRIVER);
			Connection conn = DriverManager.getConnection(global.DEFAULT_URL, global.DEFAULT_USERID,
					global.DEFAULT_PASSWORD);
			Statement stmt = conn.createStatement();

			int n = 0;
			String sql = "select count(*) from homepage.license";
			rs = stmt.executeQuery(sql);
			if (rs.next())
				n = rs.getInt(1);

			if (n == 0) {
				pstmt = conn.prepareStatement(query);
				n++;
				request.setCharacterEncoding("euc-kr");

				String part = request.getParameter("구분");
				String application_date = request.getParameter("출원일");
				String application_num = request.getParameter("출원번호");
				String registration_date = request.getParameter("등록일");
				String registration_num = request.getParameter("등록번호");
				String license_name = request.getParameter("발명의 명칭");
				String application_place = request.getParameter("출원인");
				String inventor = request.getParameter("발명자");
				String work = request.getParameter("과제");
			try {
				pstmt.setInt(1,n);
				pstmt.setString(2, part);
				pstmt.setString(3, application_date);
				pstmt.setString(4, application_num);
				pstmt.setString(5, registration_date);
				pstmt.setString(6, registration_num);
				pstmt.setString(7, license_name);
				pstmt.setString(8, application_place);
				pstmt.setString(9, inventor);
				pstmt.setString(10, work);
				pstmt.executeUpdate();
			}catch (Exception e) {
				System.out.println(e.getMessage());
			}
			}
			else {
				pstmt = conn.prepareStatement(query);
				n++;
				request.setCharacterEncoding("euc-kr");

				String part = request.getParameter("구분");
				String application_date = request.getParameter("출원일");
				String application_num = request.getParameter("출원번호");
				String registration_date = request.getParameter("등록일");
				String registration_num = request.getParameter("등록번호");
				String license_name = request.getParameter("발명의 명칭");
				String application_place = request.getParameter("출원인");
				String inventor = request.getParameter("발명자");
				String work = request.getParameter("과제");

				pstmt.setInt(1,n);
				pstmt.setString(2, part);
				pstmt.setString(3, application_date);
				pstmt.setString(4, application_num);
				pstmt.setString(5, registration_date);
				pstmt.setString(6, registration_num);
				pstmt.setString(7, license_name);
				pstmt.setString(8, application_place);
				pstmt.setString(9, inventor);
				pstmt.setString(10, work);
				pstmt.executeUpdate();
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
		response.sendRedirect("./others.jsp");
	%>
</body>
</html>