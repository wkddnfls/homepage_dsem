<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*,java.io.*"%>
<%!Connection connection = null;
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
		request.setCharacterEncoding("euc-kr");
		int idx = Integer.parseInt(request.getParameter("idx"));
		Class.forName(global.DEFAULT_DRIVER);
		Connection conn = DriverManager.getConnection(global.DEFAULT_URL, global.DEFAULT_USERID,
				global.DEFAULT_PASSWORD);
		String sql = "select password, filename, time from homepage.board where num =" + idx;
		String pw = request.getParameter("password");
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery(sql);
		int total = 0;
		String password = null;
		String filename = null;
		String time = null;
		try {
			if (rs.next()) {
				password = rs.getString(1);
				filename = rs.getString(2);
				time = rs.getString(3);
			}
			sql = "select num from homepage.board where password = MD5('" + pw + "') and time = '" + time + "'";
			pstmt = conn.prepareStatement(sql);
			int n = 0;
			rs = pstmt.executeQuery(sql);
			if (rs.next()) {
				n = rs.getInt(1);
			}
			if (idx == n || pw.equals(global.DEFAULT_ADMINPW)) {
				if (filename == null) {
					sql = "DELETE FROM homepage.board WHERE NUM=" + idx;
					pstmt.executeUpdate(sql);
					sql = "SELECT COUNT(*) FROM homepage.board;";
					ResultSet rs1 = pstmt.executeQuery(sql);
					if (rs1.next()) {
						total = rs1.getInt(1);
						//	System.out.println("total:" + total);
					}
					sql = "SET @cnt = 0;";
					pstmt.executeUpdate(sql);
					sql = "UPDATE homepage.board SET num = @cnt:=@cnt+1;";
					pstmt.executeUpdate(sql);
	%>
			<script>
				self.window.alert("해당 글을 삭제하였습니다.");
				opener.document.location.href = "./activity.jsp"
				self.window.close();
			</script>
	<%
					rs.close();
					pstmt.close();
					conn.close();
				}
				else {
					String folder = request.getServletContext().getRealPath("image");
					String filePath = folder + "\\" + filename;
					System.out.println(filePath);
					File file = new File(filePath);
					if (file.exists()) {
						file.delete();
					}
					sql = "DELETE FROM homepage.board WHERE NUM=" + idx;
					pstmt.executeUpdate(sql);
					sql = "SELECT COUNT(*) FROM homepage.board;";
					ResultSet rs1 = pstmt.executeQuery(sql);
					if (rs1.next()) {
						total = rs1.getInt(1);
						//	System.out.println("total:" + total);
					}
					sql = "SET @cnt = 0;";
					pstmt.executeUpdate(sql);
					sql = "UPDATE homepage.board SET num = @cnt:=@cnt+1;";
					pstmt.executeUpdate(sql);
	%>
	<script>
		self.window.alert("해당 글을 삭제하였습니다.");
		opener.document.location.href = "./activity.jsp"
		self.window.close();
	</script>
	<%
		rs.close();
					pstmt.close();
					conn.close();
				}
			} else {
	%>
	<script>
		self.window.alert("비밀번호를 틀렸습니다.");
		location.href = "javascript:history.back(-1)";
	</script>
	<%
		}
		} catch (SQLException e) {
			out.println(e.toString());
		}
	%>
</body>
</html>