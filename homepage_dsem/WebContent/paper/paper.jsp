<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.*"%>
<%@ include file="../../menu.jsp"%>
<%!Connection connection = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String sql = "select * from homepage.journal order by year desc,date desc;";
	String sql1 = "select * from homepage.conference order by year desc,date desc;";
	String sql2 = "select distinct year from homepage.journal union select distinct year from homepage.conference order by year desc";
	%>
<!DOCTYPE>
<jsp:useBean id="global" class="configue.global" scope="page" />
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="paper.css?ver=1.1">
<title></title>
</head>
<body>
	<%
		try {
			ArrayList<String> DJarray = new ArrayList<String>();
			ArrayList<String> IJarray = new ArrayList<String>();
			ArrayList<String> DJ = new ArrayList<String>();
			ArrayList<String> IJ = new ArrayList<String>();
			
			ArrayList<String> DCarray = new ArrayList<String>();
			ArrayList<String> ICarray = new ArrayList<String>();
			ArrayList<String> DC = new ArrayList<String>();
			ArrayList<String> IC = new ArrayList<String>();
			
			String[] year1 = null;
			ArrayList<String> DJyear = new ArrayList<String>();
			ArrayList<String> IJyear = new ArrayList<String>();
			ArrayList<String> DCyear = new ArrayList<String>();
			ArrayList<String> ICyear = new ArrayList<String>();
			Class.forName(global.DEFAULT_DRIVER);
			Connection conn = DriverManager.getConnection(global.DEFAULT_URL, global.DEFAULT_USERID, global.DEFAULT_PASSWORD);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int cnt = 0;
			while (rs.next()) {
				//	int seq_id = Integer.parseInt(rs.getString("seq_id"));
				int year = Integer.parseInt(rs.getString("year"));
				String part = rs.getString("part");
				String date1 = rs.getString("date");
				date1 = date1.replace(".","-");	
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MMM. yyyy.",Locale.ENGLISH);
				SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
				Date a = dateformat.parse(date1);
				String date = simpleDateFormat.format(a);
				String authors = rs.getString("authors");
				String title = rs.getString("title");
				String journal_name = rs.getString("journal_name");
				String other = rs.getString("other");
				String ISSN = rs.getString("ISSN");
				String paper_index = rs.getString("paper_index");
				String IF = rs.getString("IF_");
				String research = rs.getString("found_");
				String doi = rs.getString("doi");

				String Jtext = year + "-" + part + "-" + date + "-" + authors + "-" + title + "-" + journal_name
						+ "-" + other + "-" + ISSN + "-" + paper_index + "-" + IF + "-" + research + "-" + doi;
				if (part.equals("DJ")) {

					if (IF.equals("") && research.equals("")) {
						String printtext = authors + ", " + '"' + title + '"' + ", " + journal_name + ", " + other
								+ ", " + date + " / " + ISSN + " / " + paper_index + " / " +doi;
						DJ.add(printtext);
					}
					else if (IF.equals("") && !research.equals("")) {
						String printtext = authors + ", " + '"' + title + '"' + ", " + journal_name + ", " + other
								+ ", " + date + " / " + ISSN + " / " + paper_index  + " / " + research + " / " + doi;
						DJ.add(printtext);
					}
					else if (!IF.equals("") && !research.equals("")) {
						String printtext = authors + ", " + '"' + title + '"' + ", " + journal_name + ", " + other
								+ ", " + date + " / " + ISSN + " / " + paper_index  + " / " + IF +  " / " + doi;
						DJ.add(printtext);
					}
					else {
						String printtext = authors + ", " + '"' + title + '"' + ", " + journal_name + ", " + other
								+ ", " + date + " / " + ISSN + " / " + paper_index + " / " + IF  + " / " + research + " / " + doi;
						DJ.add(printtext);
					}
					DJarray.add(Jtext);
				}
				if (part.equals("IJ")) {
					if (IF.equals("") && research.equals("")) {
						String printtext = authors + ", " + '"' + title + '"' + ", " + journal_name + ", " + other
								+ ", " + date + " / " + ISSN + " / " + paper_index  + " / " + doi;
						IJ.add(printtext);
					}
					else if (IF.equals("")) {
						String printtext = authors + ", " + '"' + title + '"' + ", " + journal_name + ", " + other
								+ ", " + date + " / " + ISSN + " / " + paper_index + " / " + research + " / " + doi;
						IJ.add(printtext);
					}
					else if(research.equals("")) {
						String printtext = authors + ", " + '"' + title + '"' + ", " + journal_name + ", " + other
								+ ", " + date + " / " + ISSN + " / " + paper_index + " / " + IF  + " / " + doi;
						IJ.add(printtext);
					}
					else {
						String printtext = authors + ", " + '"' + title + '"' + ", " + journal_name + ", " + other
								+ ", " + date + " / " + ISSN + " / " + paper_index + " / " + IF  + " / " + research + " / " + doi;
						IJ.add(printtext);
					}
					IJarray.add(Jtext);
				}
			}
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int year = Integer.parseInt(rs.getString("year"));
				String part = rs.getString("part");
				String date1 = rs.getString("date");
				date1 = date1.replace(" ","");
				date1 = date1.replace(".","-");
				String[] datelist = date1.split("~");		 
				SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("MMM. dd-",Locale.ENGLISH);
				SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("dd,yyyy.",Locale.ENGLISH);
				SimpleDateFormat simpleDateFormat3 = new SimpleDateFormat("MMM. d, yyyy.",Locale.ENGLISH);
				SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
				Date a = dateformat.parse(datelist[0]);
				Date a1 = dateformat.parse(datelist[1]);
				String[] split_list = datelist[0].split("-");
				String[] split_list1 = datelist[1].split("-");
				String date = "";
				if(split_list[1] == split_list1[1]) {
					date = simpleDateFormat1.format(a) + simpleDateFormat2.format(a1);
				}
				else {
					date = simpleDateFormat1.format(a) + simpleDateFormat3.format(a1);
				}
				//String date = simpleDateFormat1.format(a) + simpleDateFormat2.format(a1);
				String authors = rs.getString("authors");
				String title = rs.getString("title");
				String proceeding = rs.getString("proceeding");
				String ISSN = rs.getString("ISSN");
				String place = rs.getString("place");
				String research = rs.getString("found");
				String remarks = rs.getString("remarks");
				
				String Ctext = year + "-" + part + "-" + date + "-" + authors + "-" + title + "-" + proceeding
						 + "-" + ISSN + "-" + place + "-" + research + "-" + remarks;
				
				if (part.equals("DC")) {
					if(remarks.equals("") && ISSN.equals("") && research.equals("")) {
						String printtext = authors + ", " + '"' + title + '"' + ", " + proceeding + ", " + place + ", " +date;
						DC.add(printtext);
					}
					else if(remarks.equals("") && ISSN.equals("") && !research.equals("")) {
						String printtext = authors + ", " + '"' + title + '"' + ", " + proceeding + ", " + place + ", " +date +
								   " / " + research;
						DC.add(printtext);
					}
					else if(remarks.equals("") && !ISSN.equals("") && research.equals("")) {
						String printtext = authors + ", " + '"' + title + '"' + ", " + proceeding + ", " + place + ", " +date +
								" ISSN: "+ ISSN;
						DC.add(printtext);
					}
					else if(!remarks.equals("") && ISSN.equals("") && research.equals("")) {
						String printtext = authors + ", " + '"' + title + '"' + ", " + proceeding + ", " + place + ", " +date +
								" / " + remarks;
						DC.add(printtext);
					}
					else if(!remarks.equals("") && ISSN.equals("") && !research.equals("")) {
						String printtext = authors + ", " + '"' + title + '"' + ", " + proceeding + ", " + place + ", " +date +
								   " / " + research + " / " + remarks;
						DC.add(printtext);
					}
					else if(remarks.equals("") && !ISSN.equals("") && !research.equals("")) {
						String printtext = authors + ", " + '"' + title + '"' + ", " + proceeding + ", " + place + ", " +date +
								  " ISSN: "+ ISSN + " / " + research;
						DC.add(printtext);
					}
					else if(!remarks.equals("") && !ISSN.equals("") && research.equals("")) {
						String printtext = authors + ", " + '"' + title + '"' + ", " + proceeding + ", " + place + ", " +date +
								  " ISSN: "+ ISSN + " / " + remarks;
						DC.add(printtext);
					}
					else {
						String printtext = authors + ", " + '"' + title + '"' + ", " + proceeding + ", " + place +  ", " +date
								 + " ISSN: " + ISSN + " / " + research + " / " + remarks;
						DC.add(printtext);
					}
					DCarray.add(Ctext);
				}
				if (part.equals("IC")) {
					if(remarks.equals("") && ISSN.equals("") && research.equals("")) {
						String printtext = authors + ", " + '"' + title + '"' + ", " + proceeding + ", " + place + ", " +date;
						IC.add(printtext);
					}
					else if(remarks.equals("") && ISSN.equals("") && !research.equals("")) {
						String printtext = authors + ", " + '"' + title + '"' + ", " + proceeding + ", " + place + ", " +date +
								   " / " + research;
						IC.add(printtext);
					}
					else if(remarks.equals("") && !ISSN.equals("") && research.equals("")) {
						String printtext = authors + ", " + '"' + title + '"' + ", " + proceeding + ", " + place + ", " +date +
								" ISSN: "+ ISSN;
						IC.add(printtext);
					}
					else if(!remarks.equals("") && ISSN.equals("") && research.equals("")) {
						String printtext = authors + ", " + '"' + title + '"' + ", " + proceeding + ", " + place + ", " +date +
								" / " + remarks;
						IC.add(printtext);
					}
					else if(!remarks.equals("") && ISSN.equals("") && !research.equals("")) {
						String printtext = authors + ", " + '"' + title + '"' + ", " + proceeding + ", " + place + ", " +date +
								   " / " + research + " / " + remarks;
						IC.add(printtext);
					}
					else if(remarks.equals("") && !ISSN.equals("") && !research.equals("")) {
						String printtext = authors + ", " + '"' + title + '"' + ", " + proceeding + ", " + place + ", " +date +
								  " ISSN: "+ ISSN + " / " + research;
						IC.add(printtext);
					}
					else if(!remarks.equals("") && !ISSN.equals("") && research.equals("")) {
						String printtext = authors + ", " + '"' + title + '"' + ", " + proceeding + ", " + place + ", " +date +
								  " ISSN: "+ ISSN + " / " + remarks;
						IC.add(printtext);
					}
					else {
						String printtext = authors + ", " + '"' + title + '"' + ", " + proceeding + ", " + place +  ", " +date
								 + " ISSN: " + ISSN + " / " + research + " / " + remarks;
						IC.add(printtext);
					}
					ICarray.add(Ctext);
				}			
			}
		
			for (int i = 0; i < DJarray.size(); i++) {
				year1 = DJarray.get(i).split("-", 2);
				DJyear.add(year1[0]);
			}
			for (int i = 0; i < IJarray.size(); i++) {
				year1 = IJarray.get(i).split("-", 2);
				IJyear.add(year1[0]);
			}
			for (int i = 0; i < DCarray.size(); i++) {
				year1 = DCarray.get(i).split("-", 2);
				DCyear.add(year1[0]);
			}
			for (int i = 0; i < ICarray.size(); i++) {
				year1 = ICarray.get(i).split("-", 2);
				ICyear.add(year1[0]);
			}
	%>
	<div id="d">
		<%
			ArrayList<String> yearlist = new ArrayList<String>();
				pstmt = conn.prepareStatement(sql2);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					String year = rs.getString("year");
					yearlist.add(year);
		%>
		<a href="#<%=year%>">&nbsp;&nbsp;&nbsp; <%=year%>
		</a>
		<%
			}
		%>
	</div>
	<div> <a href="#" style="visibility:hidden">??</a> </div>
	<div id="btn">
		<%
			if(session.getAttribute("password")==null) { %>
				<button style="color: black; background: white; font-size: 20px; display:none;" onclick="location.href='paperdb.html'">add</button>
		<% 
			}
			else { 
			%>	
				<button style="color: black; background: white; font-size: 20px;" onclick="location.href='paperdb.html'">add</button>
		<%	}
		%>
	</div>
	<div id="a">
		<ul id="contents">
			</br>
			<% for(int j=0;j<yearlist.size();j++){ %>
				<year id="<%=yearlist.get(j)%>"> <%=yearlist.get(j)%> </year> <% 
					for (int k=0; k<IJyear.size();k++) { 
						if(IJyear.get(k).equals(yearlist.get(j))) {
			%>
			<li id="paper">International Journal</li>
			<ul id="J">
				<br>
				<%
					cnt =0;
					for (int i = 0; i < IJyear.size(); i++) {
						if (IJyear.get(i).equals(yearlist.get(j))) {
							cnt++;
							out.println("<li>" + cnt + ". " + IJ.get(i) + "</li>");
							out.println("</br>");
						}
					} %>
					</ul> <%
				break;
				}
			} %>
			
					<%for (int k=0; k<DJyear.size();k++) { 
								if(DJyear.get(k).equals(yearlist.get(j))) {
					
					%>
					<li id="paper">Domestic Journal</li>
					<ul id="J">
						<br>
						<%
							cnt =0;
							for (int i = 0; i < DJyear.size(); i++) {
								if (DJyear.get(i).equals(yearlist.get(j))) {
									cnt++;
									out.println("<li>" + cnt + ". " + DJ.get(i) + "</li>");
									out.println("</br>");
								}
							} %>
							</ul> <%
						break;
						}
					} %>
			
					<% 	for (int k=0; k<ICyear.size();k++) { 
								if(ICyear.get(k).equals(yearlist.get(j))) {
					
					%>
					<li id="paper">International Conference</li>
					<ul id="J">
						<br>
						<%
							cnt =0;
							for (int i = 0; i < ICyear.size(); i++) {
								if (ICyear.get(i).equals(yearlist.get(j))) {
									cnt++;
									out.println("<li>" + cnt + ". " + IC.get(i) + "</li>");
									out.println("</br>");
								}
							} %>
							</ul> <%
						break;
						}
					} %>
					<%  for (int k=0; k<DCyear.size();k++) { 
								if(DCyear.get(k).equals(yearlist.get(j))) {
					
					%>
					<li id="paper">Domestic Conference</li>
					<ul id="J">
						<br>
						<%
							cnt =0;
							for (int i = 0; i < DCyear.size(); i++) {
								if (DCyear.get(i).equals(yearlist.get(j))) {
									cnt++;
									out.println("<li>" + cnt + ". " + DC.get(i) + "</li>");
									out.println("</br>");
								}
							} %>
							</ul> <%
						break;
						}
					}
		}%>
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