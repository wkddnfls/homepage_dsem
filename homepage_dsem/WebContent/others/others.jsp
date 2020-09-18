<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ include file="../../menu.jsp"%>
<%!Connection connection = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String sql = "select * from homepage.license order by application_date desc;";
	String sql1 = "select * from homepage.award order by date desc;";
	String sql2 = "select * from homepage.book order by date desc;";
	String sql3 = "select * from homepage.software order by registration_date desc;";%>
<!DOCTYPE>
<jsp:useBean id="global" class="configue.global" scope="page" />
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="../main.css?ver=1.1">
<link rel="stylesheet" href="others.css?ver=1.1">
<title></title>
</head>
<body>
	<div id="btn">
		<%
			if(session.getAttribute("password")==null) { %>
				<button style="color: black; background: white; font-size: 20px; display:none;" onclick="location.href='othersForm.html'">add</button>
		<% 
			}
			else { 
			%>
			
				<button style="color: black; background: white; font-size: 20px;" onclick="location.href='othersForm.html'">add</button>
		<%	}
		%>
	</div>
	<%
		try {

			ArrayList<String> array = new ArrayList<String>();
			Class.forName(global.DEFAULT_DRIVER);
			Connection conn = DriverManager.getConnection(global.DEFAULT_URL, global.DEFAULT_USERID,
					global.DEFAULT_PASSWORD);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int cnt = 0;
			while (rs.next()) {
				String part = rs.getString("part");
				String application_date = rs.getString("application_date");
				String application_num = rs.getString("application_num");
				String registration_date = rs.getString("registration_date");
				String registration_num = rs.getString("registration_num");
				String license_name = rs.getString("license_name");
				String application_place = rs.getString("application_place");
				String inventor = rs.getString("inventor");
				String work = rs.getString("work");
				if (registration_date.equals("") && registration_num.equals("") && work.equals("")) {
					String text = part + " / " + application_date + " / " + application_num + " / " + inventor + " / "
							+ license_name + " / " + application_place;
					array.add(text);
				}
				else if (registration_date.equals("")&& registration_num.equals("") && !work.equals("")) {
					String text = part + " / " + application_date + " / " + application_num + " / " + inventor + " / "
							+ license_name + " / " + application_place + " / " + work;
					array.add(text);
				}
				else if (!registration_date.equals("")&& !registration_num.equals("") &&work.equals("")) {
					String text = part + " / " + registration_date + " / " + registration_num + " / " + inventor + " / " + license_name + " / "
							+ application_place;
					array.add(text);
				}
				else {
					String text = part + " / " + registration_date + " / " + registration_num + " / " + inventor + " / "  + license_name  + " / "
							+ application_place + " / " + work;
					array.add(text);
				}
			}

			Connection connection = null;
			PreparedStatement pstmt1 = null;
			ResultSet rs = null;
			ArrayList<String> array1 = new ArrayList<String>();
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String date = rs.getString("date");
				String award_organization = rs.getString("award_organization");
				String competition_name = rs.getString("competition_name");
				String ranking = rs.getString("ranking");
				String person = rs.getString("person");
				String remarks = rs.getString("remarks");

				if (remarks.equals("")) {
					String text1 = person + ", " + award_organization + ", " + competition_name + ", " + ranking
							+ ", " + date;
					array1.add(text1);
				} else {
					String text1 = person + ", " + award_organization + ", " + competition_name + ", " + ranking
							+ ", " + date + " / " + remarks;
					array1.add(text1);
				}
			}

			ArrayList<String> array2 = new ArrayList<String>();
			pstmt = conn.prepareStatement(sql2);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String part = rs.getString("part");
				String date = rs.getString("date");
				String authors = rs.getString("authors");
				String book_name = rs.getString("book_name");
				String publisher = rs.getString("publisher");
				String ISBN = rs.getString("ISBN");
				String remarks = rs.getString("remarks");

				String text2 = part + ", " + authors + ", " + '"' + book_name + '"' + " , " + publisher + " / "
						+ date + " / " + remarks;
				array2.add(text2);
			}
			
			ArrayList<String> array3 = new ArrayList<String>();
			pstmt = conn.prepareStatement(sql3);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String part = rs.getString("part");
				String institution = rs.getString("institution");
				String number = rs.getString("number");
				String designation = rs.getString("designation");
				String writer = rs.getString("writer");
				String creative_date = rs.getString("creative_date");
				String registration_date = rs.getString("registration_date");
				String originator = rs.getString("originator");
				String found_ = rs.getString("found_");
				String remarks = rs.getString("remarks");
				
				if(remarks.equals("")) {
					String text3 = part + ", " + creative_date + ", " + registration_date + ", "  + number +  ", "+ originator + ", " + '"' + designation + '"' + " , " + writer + ", "
							+ institution + ", " + found_;
					array3.add(text3);
				}
				else if(found_.equals("")) {
					String text3 = part + ", " + creative_date + ", " + registration_date + ", "  + number +  ", "+ originator + ", " + '"' + designation + '"' + " , " + writer + ", "
							+ institution  +", " + remarks;
					array3.add(text3);
				}
				else if(found_.equals("") && remarks.equals("")) {
					String text3 = part + ", " + creative_date + ", " + registration_date + ", "  + number +  ", "+ originator + ", " + '"' + designation + '"' + " , " + writer + ", "
							+ institution;
					array3.add(text3);
				}
				else {
					String text3 = part + ", " + creative_date + ", " + registration_date + ", "  + number +  ", "+ originator + ", " + '"' + designation + '"' + " , " + writer + ", "
						+ institution + ", " + found_ +", " + remarks;
					array3.add(text3);
				}
			}
	%>
	<div id="a">
		<ul id="contents">
			<P>특허</P>
			<ul id="J">
				<br>
				<%
					cnt = 0;
						for (int i = 0; i < array.size(); i++) {
							cnt++;
							out.println("<li>" + cnt + ". " + array.get(i) + "</li>");
							out.println("</br>");
						}
				%>
			</ul>
		</ul>
	</div>
	<div id="a">
		<ul id="contents">
			<P>수상</P>
			<ul id="J">
				<br>
				<%
					cnt = 0;
						for (int i = 0; i < array1.size(); i++) {
							cnt++;
							out.println("<li>" + cnt + ". " + array1.get(i) + "</li>");
							out.println("</br>");
						}
				%>
			</ul>
		</ul>
	</div>
	<div id="a">
		<ul id="contents">
			<P>저서</P>
			<ul id="J">
				<br>
				<%
					cnt = 0;
						for (int i = 0; i < array2.size(); i++) {
							cnt++;
							out.println("<li>" + cnt + ". " + array2.get(i) + "</li>");
							out.println("</br>");
						}
				%>
			</ul>
		</ul>
	</div>
		<div id="a">
		<ul id="contents">
			<P>소프트웨어 등록</P>
			<ul id="J">
				<br>
				<%
					cnt = 0;
						for (int i = 0; i < array3.size(); i++) {
							cnt++;
							out.println("<li>" + cnt + ". " + array3.get(i) + "</li>");
							out.println("</br>");
						}
				%>
			</ul>
		</ul>
	</div>
	<%
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
	%>
</body>
</html>