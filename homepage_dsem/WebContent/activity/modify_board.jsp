<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="configue.*"%>
<%!Connection connection = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;%>
<!DOCTYPE html>
<jsp:useBean id="global" class="configue.global" scope="page" />
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="file.css">
<title>Insert title here</title>
<script>
	function modifyCheck() {
		var form = document.modifyform;

		if (!form.password.value) {
			alert("비밀번호를 적어주세요");
			form.password.focus();
			return;
		}

		if (!form.title.value) {
			alert("제목을 적어주세요");
			form.title.focus();
			return;
		}

		if (!form.memo.value) {
			alert("내용을 적어주세요");
			form.memo.focus();
			return;
		}
		form.submit();
	}

	function modify_back() {
		self.window.close();
	}

	function file_change(file){
		var str=file.lastIndexOf("\\")+1;	//파일 마지막 "\" 루트의 길이 이후부터 글자를 잘라 파일명 저장
		file = file.substring(str, file.length);
		document.getElementById('fileName').value=file;
	}
</script>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
%>
</head>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
		String sql = "SELECT name, TITLE, MEMO, filename FROM homepage.board WHERE NUM=" + idx;
		Class.forName(global.DEFAULT_DRIVER);
		Connection conn = DriverManager.getConnection(global.DEFAULT_URL, global.DEFAULT_USERID,
				global.DEFAULT_PASSWORD);
		pstmt = conn.prepareStatement(sql);

		try {
			ResultSet rs = pstmt.executeQuery(sql);
			if (rs.next()) {
				request.setCharacterEncoding("euc-kr");
				String name = rs.getString(1);
				String title = rs.getString(2);
				String memo = rs.getString(3);
				String filename = rs.getString(4);
	%>
	<div style="padding: 10px 0px 0px 35px;">
		<table>
			<form name=modifyform method=post enctype="multipart/form-data" action="modifiy_board_ok.jsp?idx=<%=idx%>">
				<tr>
					<td>
						<div
							style="border: 2px solid #A4A4A4; height: 20px; text-align: center; border-radius: 5px;">
							<p
								style="font-weight: bold; position: absolute; top: 4px; left: 270px;">수정</p>
						</div>
						<div style="padding: 20px;">
							<table>
								<tr height="5" bgcolor="#82B5DF">
									<td colspan="4"></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td align="center"><b>제목</b></td>
									<td height="40"><input name="title" size="50"
										value="<%=title%>" maxlength="100"></td>
									<td>&nbsp;</td>
								</tr>
								<tr height="2" bgcolor="#dddddd">
									<td colspan="4"></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td align="center"><b>이름</b></td>
									<td height="40"><%=name%></td>
									<td>&nbsp;</td>
								</tr>
								<tr height="2" bgcolor="#dddddd">
									<td colspan="4"></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td align="center"><b>비밀번호</b></td>
									<td height="40"><input type="password" name="password"
										size="50" maxlength="50"></td>
									<td>&nbsp;</td>
								</tr>
								<tr height="2" bgcolor="#dddddd">
									<td colspan="4"></td>
								</tr>
								<td>&nbsp;</td>
								<tr>
									<td>&nbsp;</td>
									<td align="center"><b>내용</b></td>
									<td height="40"><textarea name="memo" cols="52" rows="13"><%=memo%></textarea></td>
									<td>&nbsp;</td>
								</tr>

								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td><br>
										<div class="file_input_div">
											<input type="button" value="파일 찾기" class="file_input_button" />
											<input type="file" id="upfile" name="upfile" class="file_input_hidden"
												onchange="javascript:file_change(this.value);" />
										</div> 
										<input id="fileName" name="filename1" value="<%=filename%>" />
											<br></td>
								</tr>
								<%
									}
										rs.close();
										pstmt.close();
										conn.close();
									} catch (SQLException e) {
										out.println(e.toString());
									}
								%>
								<td>&nbsp;</td>
								<tr height="2" bgcolor="#dddddd">
									<td colspan="4"></td>
								</tr>
								<td>&nbsp;</td>
								<tr height="5" bgcolor="#82B5DF">
									<td colspan="4"></td>
								</tr>
								<tr align="center">
									<td>&nbsp;</td>
									<td colspan="2" style="padding: 10px;"><input
										type='button' style="font-size: 15px;" value="수정"
										OnClick="javascript:modifyCheck();"> <input
										type=button style="font-size: 15px;" value="취소"
										OnClick="javascript:modify_back();"></td>
									<td>&nbsp;</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
			</form>
		</table>
	</div>
</body>
</html>