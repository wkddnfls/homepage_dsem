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
			String part = request.getParameter("구분");
			String institution = request.getParameter("기관");
			String number = request.getParameter("호수");
			String designation = request.getParameter("저작물 명칭");
			String writer = request.getParameter("저작자");
			String creative_date = request.getParameter("창작일");
			String registration_date = request.getParameter("등록일");
			String originator = request.getParameter("창작자");
			String found_ = request.getParameter("과제");
			String remarks = request.getParameter("비고");
			
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
		response.sendRedirect("software_list.jsp");
	%>
</body>
</html>