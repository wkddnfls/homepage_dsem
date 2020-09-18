<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%!
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
%>
<!DOCTYPE html>
<jsp:useBean id="global" class="configue.global" scope="page" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Member delete</title>
</head>
<body>
<%
	String seq_id = request.getParameter("seq_id"); 
	String sql_imagepath = "SELECT * from homepage.alumni where seq_id='" + seq_id + "'";
	
	request.setCharacterEncoding("utf-8");
	try {
		Class.forName(global.DEFAULT_DRIVER);
		conn = DriverManager.getConnection(global.DEFAULT_URL, global.DEFAULT_USERID, global.DEFAULT_PASSWORD);
		
		// 이미지도 같이 삭제하는 부분
		pstmt = conn.prepareStatement(sql_imagepath);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			String imagepath = rs.getString("imagepath");
			File f = new File(imagepath);
			if (f.exists()) f.delete();	
		}
		
		pstmt = conn.prepareStatement("DELETE FROM homepage.alumni WHERE seq_id =?");
		pstmt.setString(1, seq_id);
		pstmt.executeUpdate();
		
		String sql = "set @cnt =0;";
		pstmt.executeUpdate(sql);
		sql = "update homepage.alumni set seq_id =@cnt:=@cnt+1;";
		pstmt.executeUpdate(sql);
		
		response.sendRedirect("./memberList.jsp");
	}catch (SQLException se) {
		se.printStackTrace();
	} finally {
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	}
%>
</body>
</html>