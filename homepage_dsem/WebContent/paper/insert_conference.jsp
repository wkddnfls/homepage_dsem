<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%!Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String query = "insert into homepage.conference values(?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";%>
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
		Connection conn = DriverManager.getConnection(global.DEFAULT_URL, global.DEFAULT_USERID, global.DEFAULT_PASSWORD);
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
			int year = Integer.parseInt(request.getParameter("year"));
			String part = request.getParameter("part");
			String date = request.getParameter("��¥");
			String authors = request.getParameter("����");
			String title = request.getParameter("����");
			String proceeding = request.getParameter("��ǥ��");
			String ISSN = request.getParameter("����ȣ");
			String place = request.getParameter("���");
			String found = request.getParameter("������");
			String remarks = request.getParameter("���");
			try {
			pstmt.setInt(1, n);
			pstmt.setInt(2, year);
			pstmt.setString(3, part);
			pstmt.setString(4, date);
			pstmt.setString(5, authors);
			pstmt.setString(6, title);
			pstmt.setString(7, proceeding);
			pstmt.setString(8, ISSN);
			pstmt.setString(9, place);
			pstmt.setString(10, found);
			pstmt.setString(11, remarks);
			pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		} else {
			pstmt = conn.prepareStatement(query);
			n++;
			request.setCharacterEncoding("euc-kr");
			int year = Integer.parseInt(request.getParameter("year"));
			String part = request.getParameter("part");
			String date = request.getParameter("��¥");
			String authors = request.getParameter("����");
			String title = request.getParameter("����");
			String proceeding = request.getParameter("��ǥ��");
			String ISSN = request.getParameter("����ȣ");
			String place = request.getParameter("���");
			String found = request.getParameter("������");
			String remarks = request.getParameter("���");
			try {
			pstmt.setInt(1, n);
			pstmt.setInt(2, year);
			pstmt.setString(3, part);
			pstmt.setString(4, date);
			pstmt.setString(5, authors);
			pstmt.setString(6, title);
			pstmt.setString(7, proceeding);
			pstmt.setString(8, ISSN);
			pstmt.setString(9, place);
			pstmt.setString(10, found);
			pstmt.setString(11, remarks);
			pstmt.executeUpdate();
			} catch (Exception e) {
			System.out.println(e.getMessage());
			}
		}
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
	response.sendRedirect("./paper.jsp");
	%>
</body>
</html>