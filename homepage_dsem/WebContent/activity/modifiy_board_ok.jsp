<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*,java.io.*"%>
<%@ page
	import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%!Connection connection = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";%>
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
		String realFolder = "";
		String filename = "";
		String imagename = "";
		String filerealname = "";
		int maxSize = 1024 * 1024 * 15;
		String encType = "euc-kr";
		String savefile = "image";
		ServletContext scontext = getServletContext();
		realFolder = scontext.getRealPath(savefile);
		Class.forName(global.DEFAULT_DRIVER);
		Connection conn = DriverManager.getConnection(global.DEFAULT_URL, global.DEFAULT_USERID,
				global.DEFAULT_PASSWORD);
		sql = "select filename from homepage.board;";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery(sql);
		if (rs.next()) {
			imagename = rs.getString(1);
			System.out.println(imagename);
			String path = realFolder + "\\" + imagename;
			File file = new File(path);
			if (file.exists()) {
				file.delete();
			}
		}

		try {
			MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType,
					new DefaultFileRenamePolicy());
			Enumeration files = multi.getFileNames();
			while (files.hasMoreElements()) {
				String name = (String) files.nextElement();
				filename = multi.getFilesystemName(name);
				//    String original = multi.getOriginalFileName(name);
				String fullpath = realFolder + "\\" + filename;
				//System.out.println(fullpath);
			}
			int idx = Integer.parseInt(request.getParameter("idx"));
			String title = multi.getParameter("title");
			String memo = multi.getParameter("memo");
			String pw = multi.getParameter("password");
			String filename1 = multi.getParameter("filename1");
			sql = "select time, filename from homepage.board where num =" + idx;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			String time = null;
			String imgname = null;
			if (rs.next()) {
				time = rs.getString(1);
				imgname = rs.getString(2);
			}
			sql = "select num from homepage.board where password = MD5('" + pw + "') and time = '" + time + "'";
			pstmt = conn.prepareStatement(sql);
			int n = 0;
			rs = pstmt.executeQuery(sql);
			if (rs.next()) {
				n = rs.getInt(1);
			}
			if (idx == n || pw.equals(global.DEFAULT_ADMINPW)) {
				if (imgname.equals(filename)) {
					sql = "UPDATE homepage.board SET TITLE='" + title + "' ,MEMO='" + memo
							+ "' ,time = now() WHERE NUM=" + idx;
					pstmt.executeUpdate(sql);
					%>
					<script>
						self.window.alert("글이 수정되었습니다.");
						opener.document.location.href = "activity.jsp?idx=<%=idx%>";
						self.window.close();
					</script>
					<%
					rs.close();
					pstmt.close();
					conn.close();
					}
				else {
					sql = "UPDATE homepage.board SET TITLE='" + title + "' ,MEMO='" + memo + "' , filename='"
							+ filename1 + "' ,time = now()" + " WHERE NUM=" + idx;
					pstmt.executeUpdate(sql);
					%>
				<script>
					self.window.alert("글이 수정되었습니다.");
					opener.document.location.href = "activity.jsp?idx=<%=idx%>";
					self.window.close();
				</script>
				<%
				rs.close();
				pstmt.close();
				conn.close();
					} 
			}else {
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