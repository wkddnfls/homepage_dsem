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
			String part = request.getParameter("����");
			String application_date = request.getParameter("�����");
			String application_num = request.getParameter("�����ȣ");
			String registration_date = request.getParameter("�����");
			String registration_num = request.getParameter("��Ϲ�ȣ");
			String license_name = request.getParameter("�߸��� ��Ī");
			String application_place = request.getParameter("�����");
			String inventor = request.getParameter("�߸���");
			String work = request.getParameter("����");
			
			Class.forName(global.DEFAULT_DRIVER);
			conn = DriverManager.getConnection(global.DEFAULT_URL, global.DEFAULT_USERID, global.DEFAULT_PASSWORD);

			String sql = "UPDATE homepage.license SET part='" + part + "', application_date ='" + application_date + "' ,application_num= '" + application_num
					+ "' ,registration_date='" + registration_date + "', registration_num= '" + registration_num + "', license_name= '" + license_name
					+ "', application_place= '" + application_place + "', inventor= '" + inventor + "', work= '" + work + "' WHERE seq_id= '" + seq_id + "';";
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
		response.sendRedirect("license_list.jsp");
	%>
</body>
</html>