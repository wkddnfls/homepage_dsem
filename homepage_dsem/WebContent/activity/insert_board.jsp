<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="configue.*"%>
<%@ page import="java.util.*,java.io.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%!Connection connection = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "INSERT INTO homepage.board(num,name,password,title,memo,time,filename) VALUES(?, ?, MD5(?), ?, ?,now(), ?);";%>
<!DOCTYPE html>
<jsp:useBean id="global" class="configue.global" scope="page" />
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
	self.window.alert("입력한 글을 저장하였습니다.");
	opener.document.location.href = "./activity.jsp"
	self.window.close();
</script>
</head>
<body>
	<%
		int total = 0;
		int idx = 0;
		Class.forName(global.DEFAULT_DRIVER);
		Connection conn = DriverManager.getConnection(global.DEFAULT_URL, global.DEFAULT_USERID,global.DEFAULT_PASSWORD);
		Statement stmt = conn.createStatement();
		String sqlCount = "SELECT COUNT(*) FROM homepage.board;";
		ResultSet rs = stmt.executeQuery(sqlCount);
		if (rs.next()) {
			total = rs.getInt(1);
		}
		if (total == 0) {
			request.setCharacterEncoding("euc-kr");
			String realFolder = "";
			String filename = "";
			String filerealname = "";
			int maxSize = 1024 * 1024 * 5;
			String encType = "euc-kr";
			String savefile = "image";
			ServletContext scontext = getServletContext();
			realFolder = scontext.getRealPath(savefile);
			MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
			Enumeration<?> files = multi.getFileNames();
			String file1 = (String) files.nextElement();
			filename = multi.getFilesystemName(file1);
			String fullpath = realFolder + "\\" + filename;

			idx = 1;
			String name = multi.getParameter("name"); //write.jsp에서 name에 입력한 데이터값
			String password = multi.getParameter("password");//write.jsp에서 password에 입력한 데이터값
			String title = multi.getParameter("title"); //write.jsp에서 title에 입력한 데이터값
			String memo = multi.getParameter("memo"); //write.jsp에서 memo에 입력한 데이터값
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, idx);
				pstmt.setString(2, name);
				pstmt.setString(3, password);
				pstmt.setString(4, title);
				pstmt.setString(5, memo);
				pstmt.setString(6, filename);
				pstmt.execute();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} finally { //모든 자원 해제
				try {
					if (rs != null)
						rs.close();
					if (pstmt != null)
						pstmt.close();
					if (connection != null)
						connection.close();
				} catch (Exception e2) {
					System.out.println(e2.getMessage());
				}
			}
		} else {
			request.setCharacterEncoding("euc-kr");
			String realFolder = "";
			String filename = "";
			String filerealname = "";
			int maxSize = 1024 * 1024 * 5;
			String encType = "euc-kr";
			String savefile = "image";
			ServletContext scontext = getServletContext();
			realFolder = scontext.getRealPath(savefile);
			MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
			Enumeration<?> files = multi.getFileNames();
			String file1 = (String) files.nextElement();
			filename = multi.getFilesystemName(file1);
			String fullpath = realFolder + "\\" + filename;
			String name = multi.getParameter("name"); //write.jsp에서 name에 입력한 데이터값
			String password = multi.getParameter("password");//write.jsp에서 password에 입력한 데이터값
			String title = multi.getParameter("title"); //write.jsp에서 title에 입력한 데이터값
			String memo = multi.getParameter("memo"); //write.jsp에서 memo에 입력한 데이터값
			
			String sql1 = "select max(num) from homepage.board;";
			ResultSet rs1 = stmt.executeQuery(sql1);
			request.setCharacterEncoding("euc-kr");
			if (rs1.next()) {
				idx = rs1.getInt(1);
				rs1.close();
			}
			idx++;
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, idx);
				pstmt.setString(2, name);
				pstmt.setString(3, password);
				pstmt.setString(4, title);
				pstmt.setString(5, memo);
				pstmt.setString(6, filename);
				pstmt.execute();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} finally { //모든 자원 해제
				try {
					if (rs != null)
						rs.close();
					if (pstmt != null)
						pstmt.close();
					if (connection != null)
						connection.close();
				} catch (Exception e2) {
					System.out.println(e2.getMessage());
				}
			}
		}
	%>

</body>
</html>