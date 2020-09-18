<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Member List</title>
</head>
<body>
	<h1>Member List</h1>

	<table width="100%" border="1">
		<thead>
			<tr>
				<th>koreanName</th>
				<th>englishName</th>
				<th>remark</th>
				<th>Department</th>
				<th>Email</th>
				<th>AdmissionYear</th>
				<th>Interests</th>
				<th>Course</th>
				<th>삭제</th>
				<th>수정</th>
			</tr>
		</thead>
		<tbody>
	<%   
	try{
    	Class.forName(global.DEFAULT_DRIVER);
		conn = DriverManager.getConnection(global.DEFAULT_URL, global.DEFAULT_USERID, global.DEFAULT_PASSWORD);
		pstmt = conn.prepareStatement("SELECT * FROM homepage.researcher ORDER BY koreanName ASC;");
		rs = pstmt.executeQuery();
		 
        while(rs.next()){
        	String seq_id = rs.getString("seq_id");
        	String koreanName = rs.getString("koreanName");
        	String englishName = rs.getString("englishName");
        	String remark = rs.getString("remark");
			String department = rs.getString("department");
			String email = rs.getString("email");
			String admissionYear = rs.getString("admissionYear");
			String interest = rs.getString("interest");
			String course = rs.getString("course");
			String imageName = rs.getString("filename");
   %>
			<tr>
				<td><%=koreanName%></td>
				<td><%=englishName%></td>
				<td><%=remark%></td>
				<td><%=department%></td>
				<td><%=email%></td>
				<td><%=admissionYear%></td>
				<td><%=interest%></td>
				<td><%=course%></td>
				<td><a href="./delete.jsp?seq_id=<%=seq_id%>">삭제</a></td>
				<td><a href="./update.jsp?seq_id=<%=seq_id%>">수정</a></td>
			</tr>
	<%
        }
    %>
			<button type="button" onclick="location.href='./memberForm.jsp'">등록하기</button>
			<button type="button" onclick="location.href='./researcher.jsp'">홈페이지 돌아가기</button>
			<br><br>
			<%	
        
      }catch(SQLException se){
         se.printStackTrace();
      }finally{
         if(rs != null) rs.close();
         if(pstmt != null) pstmt.close();
         if(conn != null) conn.close();
      }
   %>
		</tbody>
	</table>
</body>
</html>
