<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="main.css?ver=1.1">
<title>게시판</title>
<script>
	// 자바 스크립트 시작

	function writeCheck() {
		var form = document.writeform;

		if (!form.title.value) {
			alert("제목을 적어주세요");
			form.title.focus();
			return;
		}

		if (!form.name.value) // form 에 있는 name 값이 없을 때
		{
			alert("이름을 적어주세요"); // 경고창 띄움
			form.name.focus(); // form 에 있는 name 위치로 이동
			return;
		}

		if (!form.password.value) {
			alert("비밀번호를 적어주세요");
			form.password.focus();
			return;
		}

		if (!form.memo.value) {
			alert("내용을 적어주세요");
			form.memo.focus();
			return;
		}

		form.submit();
	}
</script>
</head>
<body>
	<div style="padding: 10px 0px 0px 35px;">
		<table>
			<form name=writeform method=post enctype="multipart/form-data" action="insert_board.jsp">
				<tr>
					<td>
						<div
							style="border: 2px solid #A4A4A4; text-align: center; border-radius: 5px;">
							<p style="font-weight: bold;">글쓰기</p>
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
										maxlength="100"></td>
									<td>&nbsp;</td>
								</tr>
								<tr height="2" bgcolor="#dddddd">
									<td colspan="4"></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td align="center"><b>이름</b></td>
									<td height="40"><input name="name" size="50"
										maxlength="50"></td>
									<td>&nbsp;</td>
								</tr>
								<tr height="2" bgcolor="#dddddd">
									<td colspan="4"></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td align="center"><b>비밀번호</b></td>
									<td height="40"><input name="password" size="50"
										maxlength="50"></td>
									<td>&nbsp;</td>
								</tr>
								<tr height="2" bgcolor="#dddddd">
									<td colspan="4"></td>
								</tr>
								<td>&nbsp;</td>
								<tr>
									<td>&nbsp;</td>
									<td align="center"><b>내용</b></td>
									<td height="40"><textarea name="memo" cols="52" rows="13"></textarea></td>
									<td>&nbsp;</td>
								</tr>
								<tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>
									<br>
										<input type="file" name="filename1" size=70> 
										<br> 
									</td>
								</tr>
								
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
										type='button' style="font-size: 15px;" value="등록"
										OnClick="javascript:writeCheck();"> <input type=button
										style="font-size: 15px;" value="취소"
										OnClick="javascript:history.back(-1)"></td>
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