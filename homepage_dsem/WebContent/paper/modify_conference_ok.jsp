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
			String date = request.getParameter("��¥");
			String authors = request.getParameter("����");
			String title1 = request.getParameter("����");
			String proceeding = request.getParameter("��ǥ��");
			String ISSN = request.getParameter("����ȣ");
			String place = request.getParameter("���");
			String found = request.getParameter("������");
			String remarks = request.getParameter("���");
			
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
		} finally { //��� �ڿ� ����
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