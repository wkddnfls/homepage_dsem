<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ include file="../../menu.jsp" %>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
%>
<!DOCTYPE html>
<jsp:useBean id="global" class="configue.global" scope="page" />
<html>
<head>
<meta charset="utf-8">
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
			
			ArrayList<String> part_array = new ArrayList<String>();
			pstmt = conn.prepareStatement("SELECT distinct course from homepage.researcher");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String course = rs.getString("course");
				part_array.add(course);
			}
			pstmt = conn.prepareStatement("SELECT * from homepage.researcher where course='PHD' ORDER BY admissionYear ASC, koreanName ASC LIMIT 10");
			rs = pstmt.executeQuery();
			
			if (part_array.contains("PHD")) {
				%><h2>Ph.D. students</h2> <%
			}
			while (rs.next()) {
				String koreanName = rs.getString("koreanName");
				String englishName = rs.getString("englishName");
				String remark = rs.getString("remark");
				String department = rs.getString("department");
				String email = rs.getString("email");
				String admissionYear = rs.getString("admissionYear");
				String interest = rs.getString("interest");
				String course = rs.getString("course");
				String filename = rs.getString("filename");
				
				if (filename == null || filename.equals(""))
					filename = "img.PNG";

	%>
	<div id="members">
		<img src="<%="../../image/" + filename%>" id="img1">
		<ul id="text">
			<h4>
				<koreanName><%=koreanName%></koreanName><remark><%
				if (remark != null && !remark.equals("")) {
					out.println("(" + remark + ")");
				}
				%></remark>
			</h4>
			<li>Department : <department><%=department%></department><br></li>
			<li>e-mail : <email><%=email%></email> </li>
			<li>Year of admission : <id><%=admissionYear%></id> </li>
			<li>Research topics : <interest><%=interest%></interest> </li>
			<li><a href="../view_detail.jsp?koreanName=<%=koreanName%>&englishName=<%=englishName%>" 
			onclick="window.open(this.href,'startpop', 'top=400, left=900, width=900, height=500, scrollbars=yes, resizable=no ,status=no ,toolbar=no'); return false;">
			실적보기</a></li>
		</ul>
	</div>
	<div> <a href="#" style="visibility:hidden">??</a> </div>
	
	<%
			}
			
			pstmt = conn.prepareStatement("SELECT * from homepage.researcher where course='master' ORDER BY admissionYear ASC, koreanName ASC LIMIT 10");
			rs = pstmt.executeQuery();
			
			if (part_array.contains("master")) {
				%><h2>Master students</h2> <%
			}
			while (rs.next()) {
				String koreanName = rs.getString("koreanName");
				String englishName = rs.getString("englishName");
				String remark = rs.getString("remark");
				String department = rs.getString("department");
				String email = rs.getString("email");
				String admissionYear = rs.getString("admissionYear");
				String interest = rs.getString("interest");
				String course = rs.getString("course");
				String filename = rs.getString("filename");
				
				if (filename == null || filename.equals(""))
					filename = "img.PNG";

	%>
	<div id="members">
		<img src="<%="../../image/" + filename%>" id="img1">
		<ul id="text">
			<h4>
				<koreanName><%=koreanName%></koreanName><remark><%
				if (remark != null && !remark.equals("")) {
					out.println("(" + remark + ")");
				}
				%></remark>
			</h4>
			<li>Department : <department><%=department%></department><br></li>
			<li>e-mail : <email><%=email%></email> </li>
			<li>Year of admission : <id><%=admissionYear%></id> </li>
			<li>Research topics : <interest><%=interest%></interest> </li>
			<li><a href="../view_detail.jsp?koreanName=<%=koreanName%>&englishName=<%=englishName%>" 
			onclick="window.open(this.href,'startpop', 'top=400, left=900, width=900, height=500, scrollbars=yes, resizable=no ,status=no ,toolbar=no'); return false;">
			실적보기</a></li>
		</ul>
	</div>
	<div> <a href="#" style="visibility:hidden">??</a> </div>
	
	<%
			}	
			
			pstmt = conn.prepareStatement("SELECT * from homepage.researcher where course='undergraduate' ORDER BY admissionYear ASC, koreanName ASC LIMIT 10");
			rs = pstmt.executeQuery();
			
			if (part_array.contains("undergraduate")) {
				%> <h2>Undergraduate students</h2><%
			}
			while (rs.next()) {
				String koreanName = rs.getString("koreanName");
				String englishName = rs.getString("englishName");
				String remark = rs.getString("remark");
				String department = rs.getString("department");
				String email = rs.getString("email");
				String admissionYear = rs.getString("admissionYear");
				String interest = rs.getString("interest");
				String course = rs.getString("course");
				String filename = rs.getString("filename");
				
				if (filename == null || filename.equals(""))
					filename = "img.PNG";
				
	%>
	<div id="members">
		<img src="<%="../../image/" + filename%>" id="img1">
		<ul id="text">
			<h4>
				<koreanName><%=koreanName%></koreanName><remark><%
				if (remark != null && !remark.equals("")) {
					out.println("(" + remark + ")");
				}
				%></remark>
			</h4>
			<li>Department : <department><%=department%></department><br></li>
			<li>e-mail : <email><%=email%></email> </li>
			<li>Year of admission : <id><%=admissionYear%></id> </li>
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