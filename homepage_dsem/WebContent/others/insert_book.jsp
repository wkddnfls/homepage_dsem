<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%!
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String query = "insert into homepage.book values(?, ?, ?, ?, ?, ?, ?, ?);";
%>
<!DOCTYPE html>
<jsp:useBean id="global" class="configue.global" scope="page"/>
<html>
<head>
<meta charset="EUC-KR">
<title>book</title>
</head>
<body>
<%
		Class.forName(global.DEFAULT_DRIVER);
		Connection conn = DriverManager.getConnection(global.DEFAULT_URL, global.DEFAULT_USERID, global.DEFAULT_PASSWORD);
		Statement stmt = conn.createStatement();
		try {
			int n = 0;
			String sql = "select count(*) from homepage.book";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				n = rs.getInt(1);
			}
			pstmt = conn.prepareStatement(query);
			request.setCharacterEncoding("euc-kr");
			String part = request.getParameter("����");
			String date = request.getParameter("��¥");
			String authors = request.getParameter("����");
			String book_name = request.getParameter("������");
			String publisher = request.getParameter("���ǻ�");
			String ISBN = request.getParameter("��ȣ");
			String remarks = request.getParameter("�������");
			if (n == 0) {
				pstmt.setInt(1, 1);
			} else {
				n++;
				pstmt.setInt(1, n);
			}
			pstmt.setString(2, part);
			pstmt.setString(3, date);
			pstmt.setString(4, authors);
			pstmt.setString(5, book_name);
			pstmt.setString(6, publisher);
			pstmt.setString(7, ISBN);
			pstmt.setString(8, remarks);

			pstmt.executeUpdate();
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
		response.sendRedirect("others.jsp");
	%>
</body>
</html>