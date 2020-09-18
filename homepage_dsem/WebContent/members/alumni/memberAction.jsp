<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:useBean id="global" class="configue.global" scope="page" />
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%!
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title></title>
</head>

<body>
    <%
	request.setCharacterEncoding("utf-8");
	String koreanName = "";
	String englishName = "";
	String department = "";
	String email = "";
	String admissionYear = "";
	String graduationYear = "";
	String interest = "";
	

// imgup
	String realFolder ="";
	String filename = "";
	int maxSize = 1024*1024*5;
	String encType = "utf-8";
	String saveflie = "image";
	
	ServletContext scontext = getServletContext();
	realFolder = scontext.getRealPath(saveflie);
	
	try {
		// imgup
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		Enumeration<?> files = multi.getFileNames();
		String file1 = (String)files.nextElement();
		filename = multi.getFilesystemName(file1);
	
		koreanName = multi.getParameter("koreanName");
		System.out.println("insert koreanName:"+ koreanName);
		englishName = multi.getParameter("englishName");
		System.out.println("insert englishName:"+ englishName);
		department = multi.getParameter("department");
		System.out.println("insert department:"+ department);
		email = multi.getParameter("email");
		System.out.println("insert email:"+ email);
		admissionYear = multi.getParameter("admissionYear");
		System.out.println("insert admissionYear:"+ admissionYear);
		graduationYear = multi.getParameter("graduationYear");
		System.out.println("insert graduationYear:"+ graduationYear);
		interest = multi.getParameter("interest");
		System.out.println("insert interest:"+ interest);
		System.out.println("insert filename:"+ filename);
	
		String fullpath = realFolder + "\\" + filename;
		System.out.println(fullpath);
		
		Class.forName(global.DEFAULT_DRIVER);
		conn = DriverManager.getConnection(global.DEFAULT_URL, global.DEFAULT_USERID, global.DEFAULT_PASSWORD);
	   	String sql = "INSERT INTO homepage.alumni(koreanName, englishName, department, email, admissionYear, graduationYear, interest, filename, imagepath) values(?,?,?,?,?,?,?,?,?)";
   	
	   	pstmt = conn.prepareStatement(sql);
	   	pstmt.setString(1,koreanName);
	   	pstmt.setString(2,englishName);
	   	pstmt.setString(3,department);
	   	pstmt.setString(4,email);
	   	pstmt.setString(5,admissionYear);
	    pstmt.setString(6,graduationYear);
	    pstmt.setString(7,interest);
	    pstmt.setString(8,filename);
	    pstmt.setString(9,fullpath);
	    pstmt.executeUpdate();
	    response.sendRedirect(request.getContextPath()+"/members/alumni/memberList.jsp"); 
	} catch(Exception e) {
	    e.printStackTrace();
	    out.print("입력 예외 발생");
	} finally {
	    try {pstmt.close();} catch(Exception e){}
	    try {conn.close();} catch(Exception e){}
	}

%>
</body>

</html>