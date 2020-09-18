<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%!Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;%>
<!DOCTYPE html>
<jsp:useBean id="global" class="configue.global" scope="page" />
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="../imagefile.css?version=1.1">
<title>Member update</title>
</head>
<script>
	function file_change(file) {
		var str = file.lastIndexOf("\\") + 1; //파일 마지막 "\" 루트의 길이 이후부터 글자를 잘라 파일명 저장
		file = file.substring(str, file.length);
		document.getElementById('fileName').value = file;
	}
</script>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	String seq_id = request.getParameter("seq_id");
	System.out.println(seq_id);

		try {
		Class.forName(global.DEFAULT_DRIVER);
		Connection conn = DriverManager.getConnection(global.DEFAULT_URL, global.DEFAULT_USERID, global.DEFAULT_PASSWORD);
		String sql = "select * from homepage.researcher where seq_id = '" + seq_id + "';";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			String koreanName = rs.getString("koreanName");
			String englishName = rs.getString("englishName");
			String remark = rs.getString("remark");
			String department = rs.getString("department");
			String email = rs.getString("email");
			String admissionYear = rs.getString("admissionYear");
			String interest = rs.getString("interest");
			String course = rs.getString("course");
			String imageName = request.getParameter("imageName");
	%>
	<h1>Member 수정</h1>
	<form action="updateAction.jsp?seq_id=<%=seq_id%>"
		enctype="multipart/form-data" method="post">
		<div>koreanName :</div>
		<div>
			<input name="koreanName" id="koreanName" type="text" value="<%=koreanName%>" />
		</div>
		<div>englishName :</div>
		<div>
			<input name="englishName" id="englishName" type="text" value="<%=englishName%>" />
		</div>
		<div>remark :</div>
		<div>
			<input name="remark" id="remark" type="text" value="<%=remark%>" />
		</div>
		<div>Department :</div>
		<div>
			<input name="department" id="department" type="text"
				value="<%=department%>" />
		</div>
		<div>Email :</div>
		<div>
			<input name="email" id="email" type="text" value="<%=email%>" />
		</div>
		<div>Admission Year :</div>
		<div>
			<input name="admissionYear" id="admissionYear" type="text"
				value="<%=admissionYear%>" />
		</div>
		<div>Interests :</div>
		<div>
			<input name="interest" id="interest" type="text"
				value="<%=interest%>" />
		</div>
		<div>Course :</div>
		<div>
			<select name="course" id="course">
				<option value="none">--선택--</option>
				<option value="PHD">박사</option>
				<option value="master">석사</option>
				<option value="undergraduate">학부생</option>
			</select>
		</div>
		<br>
		<div class="file_input_div">
			<input type="button" value="파일 선택" class="file_input_button" /> <input
				type="file" id="upfile" name="upfile" class="file_input_hidden"
				onchange="javascript:file_change(this.value);" />
		</div>
		<input id="fileName" name="filename" value="<%=imageName%>" /><br>
		<div>
			<input type="submit" value="수정 확인" />
			<button type="button" onclick="location.href='./memberList.jsp'">뒤로가기</button>
		</div>
	</form>
	<%		}
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
		} %>
</body>
</html>