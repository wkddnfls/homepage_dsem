<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../menu.jsp" %>
<%!
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
%>
<!DOCTYPE html>
<jsp:useBean id="global" class="configue.global" scope="page" />
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../member.css">
<title></title>
</head>

<body style="overflow-x:hidden; overflow-y:auto;">
<div id="btn">
		<%
			if(session.getAttribute("password")==null) { %>
				<button style="color: black; background: white; font-size: 20px; display:none;" onclick="location.href='memberList.jsp'">add</button>
		<% 
			}
			else { 
			%>	
				<button style="color: black; background: white; font-size: 20px;" onclick="location.href='memberList.jsp'">add</button>
		<%	}
		%>
	</div>
<%
	request.setCharacterEncoding("utf-8");

	try {
		Class.forName(global.DEFAULT_DRIVER);
		conn = DriverManager.getConnection(global.DEFAULT_URL, global.DEFAULT_USERID, global.DEFAULT_PASSWORD);
		pstmt = conn.prepareStatement("SELECT * from homepage.alumni ORDER BY graduationYear ASC, koreanName ASC LIMIT 10");
		rs = pstmt.executeQuery();

		%> <h2> Alumni </h2> <%
		while (rs.next()) {
			String koreanName = rs.getString("koreanName");
			String englishName = rs.getString("englishName");
			String department = rs.getString("department");
			String email = rs.getString("email");
			String admissionYear = rs.getString("admissionYear");
			String graduationYear = rs.getString("graduationYear");
			String interest = rs.getString("interest");
			String filename = rs.getString("filename");
			
			if (filename == null || filename.equals(""))
				filename = "img.PNG";
%>
	
	<div id="members">
		<img src="<%="../../image/" + filename%>" id="img1">
		<ul id="text">
			<h4>
				<koreanName><%=koreanName%></koreanName>
			</h4>
			<li>Department : <department><%=department%></department><br></li>
			<li>e-mail : <email><%=email%></email> </li>
			<li>Year of admission : <id><%=admissionYear%></id> </li>
			<li>Year of graduation : <id><%=graduationYear%></id> </li>
			<li>Research topics : <interest><%=interest%></interest> </li>
			<li><a href="../view_detail.jsp?koreanName=<%=koreanName%>&englishName=<%=englishName%>" 
			onclick="window.open(this.href,'startpop', 'top=400, left=900, width=900, height=500, scrollbars=yes, resizable=no ,status=no ,toolbar=no'); return false;">
			실적보기</a></li>
		</ul>
	</div>
	<div> <a href="#" style="visibility:hidden">??</a> </div>
	<%
		}
	} catch (SQLException se) {
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