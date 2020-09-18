<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%!
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
%>
<!DOCTYPE html>
<jsp:useBean id="global" class="configue.global" scope="page" />
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<% 
		int seq_id = Integer.parseInt(request.getParameter("seq_id"));
		try {
			Class.forName(global.DEFAULT_DRIVER);
			Connection conn = DriverManager.getConnection(global.DEFAULT_URL, global.DEFAULT_USERID, global.DEFAULT_PASSWORD);
			String sql = "delete from homepage.license where seq_id=" + seq_id;
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			
			sql = "set @cnt =0;";
			pstmt.executeUpdate(sql);
			sql = "update homepage.license set seq_id =@cnt:=@cnt+1 order by application_date asc;";
			pstmt.executeUpdate(sql);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		} finally { //모든 자원 해제
			try {
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