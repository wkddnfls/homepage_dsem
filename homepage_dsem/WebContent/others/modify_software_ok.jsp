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
			String institution = request.getParameter("���");
			String number = request.getParameter("ȣ��");
			String designation = request.getParameter("���۹� ��Ī");
			String writer = request.getParameter("������");
			String creative_date = request.getParameter("â����");
			String registration_date = request.getParameter("�����");
			String originator = request.getParameter("â����");
			String found_ = request.getParameter("����");
			String remarks = request.getParameter("���");
			
			System.out.println(number);
			
			Class.forName(global.DEFAULT_DRIVER);
			conn = DriverManager.getConnection(global.DEFAULT_URL, global.DEFAULT_USERID, global.DEFAULT_PASSWORD);

			String sql = "UPDATE homepage.software SET part='" + part + "', institution ='" + institution + "' ,number= '" + number
					+ "' ,designation='" + designation + "', writer= '" + writer + "', creative_date= '" + creative_date +  "', registration_date= '" + registration_date 
					+ "' ,originator='" + originator + "', found_='" + found_ +"', remarks='" + remarks + "' WHERE seq_id= '" + seq_id + "';";
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
		response.sendRedirect("software_list.jsp");
	%>
</body>
</html>