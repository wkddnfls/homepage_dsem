<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%!Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String query = "insert into homepage.software values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";%>
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
			String sql = "select count(*) from homepage.software";
			rs = stmt.executeQuery(sql);
			if (rs.next())
				n = rs.getInt(1);

			if (n == 0) {
				pstmt = conn.prepareStatement(query);
				n++;
				request.setCharacterEncoding("euc-kr");

				String part = request.getParameter("����");
				String institution = request.getParameter("���");
				String number = request.getParameter("ȣ��");
				String designation = request.getParameter("���۹� ��Ī");
				String writer = request.getParameter("������");
				String creative_date = request.getParameter("â����");
				String registration_date = request.getParameter("�����");
				String originator = request.getParameter("â����");
				String found_ = request.getParameter("����");
				String remarks = request.getParameter("���");
			try {
				pstmt.setInt(1,n);
				pstmt.setString(2, part);
				pstmt.setString(3, institution);
				pstmt.setString(4, number);
				pstmt.setString(5, designation);
				pstmt.setString(6, writer);
				pstmt.setString(7, creative_date);
				pstmt.setString(8, registration_date);
				pstmt.setString(9, originator);
				pstmt.setString(10, found_);
				pstmt.setString(11, remarks);
				pstmt.executeUpdate();
			}catch (Exception e) {
				System.out.println(e.getMessage());
			}
			}
			else {
				pstmt = conn.prepareStatement(query);
				n++;
				request.setCharacterEncoding("euc-kr");

				String part = request.getParameter("����");
				String institution = request.getParameter("���");
				String number = request.getParameter("ȣ��");
				String designation = request.getParameter("���۹� ��Ī");
				String writer = request.getParameter("������");
				String creative_date = request.getParameter("â����");
				String registration_date = request.getParameter("�����");
				String originator = request.getParameter("â����");
				String found_ = request.getParameter("����");
				String remarks = request.getParameter("���");

				pstmt.setString(2, part);
				pstmt.setString(3, institution);
				pstmt.setString(4, number);
				pstmt.setString(5, designation);
				pstmt.setString(6, writer);
				pstmt.setString(7, creative_date);
				pstmt.setString(8, registration_date);
				pstmt.setString(9, originator);
				pstmt.setString(10, found_);
				pstmt.setString(11, remarks);
				pstmt.executeUpdate();
			}
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
		response.sendRedirect("./others.jsp");
	%>
</body>
</html>