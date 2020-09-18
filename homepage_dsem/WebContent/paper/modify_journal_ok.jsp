<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="configue.*"%>
<%!Connection conn = null;
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
		try {
			request.setCharacterEncoding("UTF-8");
			String title = request.getParameter("title");
			System.out.println(title);
			request.setCharacterEncoding("euc-kr");
			int year = Integer.parseInt(request.getParameter("year"));
			String part = request.getParameter("part");
			String date = request.getParameter("날짜");
			String authors = request.getParameter("저자");
			String title1 = request.getParameter("제목");
			String journal_name = request.getParameter("저널명");
			String other = request.getParameter("기타");
			String ISSN = request.getParameter("논문번호");
			String paper_index = request.getParameter("등재지");
			String IF = request.getParameter("인용지수");
			String found = request.getParameter("연구비");
			String doi = request.getParameter("식별번호");
			

			System.out.println("year : " + year);
			System.out.println("part : " + part);
			System.out.println("date : " + date);
			System.out.println("authors : " + authors);
			System.out.println("title1 : " + title1);
			System.out.println("journal_name : " + journal_name);
			System.out.println("기타 : " + other);
			System.out.println("ISSN : " + ISSN);
			System.out.println("paper_index : " + paper_index);
			System.out.println("IF : " + IF);
			System.out.println("research : " + found);
			System.out.println("doi : " + doi);
			
			Class.forName(global.DEFAULT_DRIVER);
			conn = DriverManager.getConnection(global.DEFAULT_URL, global.DEFAULT_USERID, global.DEFAULT_PASSWORD);

			String sql = "UPDATE homepage.journal SET year='" + year + "', part ='" + part + "' ,date= '" + date
					+ "' ,authors='" + authors + "', title= '" + title1 + "', journal_name= '" + journal_name
					+ "', other= '" + other + "', ISSN= '" + ISSN + "', paper_index= '" + paper_index + "', IF_= '"
					+ IF + "', found_= '" + found + "', doi= '" + doi + "' WHERE title= '" + title + "';";
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);

			pstmt.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally { //모든 자원 해제
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		response.sendRedirect("journal_list.jsp");
	%>
</body>
</html>