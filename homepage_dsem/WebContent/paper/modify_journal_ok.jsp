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
			String date = request.getParameter("��¥");
			String authors = request.getParameter("����");
			String title1 = request.getParameter("����");
			String journal_name = request.getParameter("���θ�");
			String other = request.getParameter("��Ÿ");
			String ISSN = request.getParameter("����ȣ");
			String paper_index = request.getParameter("������");
			String IF = request.getParameter("�ο�����");
			String found = request.getParameter("������");
			String doi = request.getParameter("�ĺ���ȣ");
			

			System.out.println("year : " + year);
			System.out.println("part : " + part);
			System.out.println("date : " + date);
			System.out.println("authors : " + authors);
			System.out.println("title1 : " + title1);
			System.out.println("journal_name : " + journal_name);
			System.out.println("��Ÿ : " + other);
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
		} finally { //��� �ڿ� ����
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