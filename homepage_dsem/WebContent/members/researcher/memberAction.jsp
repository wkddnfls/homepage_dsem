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
	
		String query = "INSERT INTO homepage.researcher values(?,?,?,?,?,?,?,?,?,?,?)";
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
	String remark = "";
	String department = "";
	String email = "";
	String admissionYear = "";
	String interest = "";
	String course = "";

	// imgup
	String realFolder ="";
	String filename = "";
	int maxSize = 1024*1024*5;
	String encType = "utf-8";
	String saveflie = "image";
	
	ServletContext scontext = getServletContext();
	realFolder = scontext.getRealPath(saveflie);
	
	try {
		Class.forName(global.DEFAULT_DRIVER);
		conn = DriverManager.getConnection(global.DEFAULT_URL, global.DEFAULT_USERID, global.DEFAULT_PASSWORD);
		Statement stmt = conn.createStatement();
		int n = 0;
		String sql = "select count(*) from homepage.researcher";
		rs = stmt.executeQuery(sql);
		if (rs.next())
			n = rs.getInt(1);
		if (n == 0) {
			pstmt = conn.prepareStatement(query);
			n++;
			request.setCharacterEncoding("euc-kr");
		
		// imgup
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		Enumeration<?> files = multi.getFileNames();
		String file1 = (String)files.nextElement();
		filename = multi.getFilesystemName(file1);
	
		koreanName = multi.getParameter("koreanName");
		System.out.println("insert koreanName:"+ koreanName);
		englishName = multi.getParameter("englishName");
		System.out.println("insert englishName:"+ englishName);
		remark = multi.getParameter("remark");
		System.out.println("insert remark:"+ remark);
		department = multi.getParameter("department");
		System.out.println("insert department:"+ department);
		email = multi.getParameter("email");
		System.out.println("insert email:"+ email);
		admissionYear = multi.getParameter("admissionYear");
		System.out.println("insert admissionYear:"+ admissionYear);
		interest = multi.getParameter("interest");
		System.out.println("insert interest:"+ interest);
		course = multi.getParameter("course");
		System.out.println("insert course:"+ course);
		System.out.println("insert filename:"+ filename);
		
		String fullpath = realFolder + "\\" + filename;
		System.out.println(fullpath);
	try{
		pstmt.setInt(1, n);
   		pstmt.setString(2,koreanName);
   		pstmt.setString(3,englishName);
   		pstmt.setString(4,remark);
   		pstmt.setString(5,department);
   		pstmt.setString(6,email);
   		pstmt.setString(7,admissionYear);
   		pstmt.setString(8,interest);
   		pstmt.setString(9,course);
   		pstmt.setString(10,filename);
   		pstmt.setString(11,fullpath);
   		pstmt.executeUpdate();
	}catch (Exception e) {
		System.out.println(e.getMessage());
	}
} else {
	pstmt = conn.prepareStatement(query);
	n++;
	request.setCharacterEncoding("euc-kr");
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	Enumeration<?> files = multi.getFileNames();
	String file1 = (String)files.nextElement();
	filename = multi.getFilesystemName(file1);

	koreanName = multi.getParameter("koreanName");
	System.out.println("insert koreanName:"+ koreanName);
	englishName = multi.getParameter("englishName");
	System.out.println("insert englishName:"+ englishName);
	remark = multi.getParameter("remark");
	System.out.println("insert remark:"+ remark);
	department = multi.getParameter("department");
	System.out.println("insert department:"+ department);
	email = multi.getParameter("email");
	System.out.println("insert email:"+ email);
	admissionYear = multi.getParameter("admissionYear");
	System.out.println("insert admissionYear:"+ admissionYear);
	interest = multi.getParameter("interest");
	System.out.println("insert interest:"+ interest);
	course = multi.getParameter("course");
	System.out.println("insert course:"+ course);
	System.out.println("insert filename:"+ filename);
	
	String fullpath = realFolder + "\\" + filename;
	System.out.println(fullpath);
	
	try{
		pstmt.setInt(1, n);
   		pstmt.setString(2,koreanName);
   		pstmt.setString(3,englishName);
   		pstmt.setString(4,remark);
   		pstmt.setString(5,department);
   		pstmt.setString(6,email);
   		pstmt.setString(7,admissionYear);
   		pstmt.setString(8,interest);
   		pstmt.setString(9,course);
   		pstmt.setString(10,filename);
   		pstmt.setString(11,fullpath);
   		pstmt.executeUpdate();
	}catch (Exception e) {
		System.out.println(e.getMessage());
	}
}
    	response.sendRedirect(request.getContextPath()+"/members/researcher/memberList.jsp"); 
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