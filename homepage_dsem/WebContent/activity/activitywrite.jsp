<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="main.css?ver=1.1">
<title>�Խ���</title>
<script>
	// �ڹ� ��ũ��Ʈ ����

	function writeCheck() {
		var form = document.writeform;

		if (!form.title.value) {
			alert("������ �����ּ���");
			form.title.focus();
			return;
		}

		if (!form.name.value) // form �� �ִ� name ���� ���� ��
		{
			alert("�̸��� �����ּ���"); // ���â ���
			form.name.focus(); // form �� �ִ� name ��ġ�� �̵�
			return;
		}

		if (!form.password.value) {
			alert("��й�ȣ�� �����ּ���");
			form.password.focus();
			return;
		}

		if (!form.memo.value) {
			alert("������ �����ּ���");
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
							<p style="font-weight: bold;">�۾���</p>
						</div>
						<div style="padding: 20px;">
							<table>
								<tr height="5" bgcolor="#82B5DF">
									<td colspan="4"></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td align="center"><b>����</b></td>
									<td height="40"><input name="title" size="50"
										maxlength="100"></td>
									<td>&nbsp;</td>
								</tr>
								<tr height="2" bgcolor="#dddddd">
									<td colspan="4"></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td align="center"><b>�̸�</b></td>
									<td height="40"><input name="name" size="50"
										maxlength="50"></td>
									<td>&nbsp;</td>
								</tr>
								<tr height="2" bgcolor="#dddddd">
									<td colspan="4"></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td align="center"><b>��й�ȣ</b></td>
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
									<td align="center"><b>����</b></td>
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
										type='button' style="font-size: 15px;" value="���"
										OnClick="javascript:writeCheck();"> <input type=button
										style="font-size: 15px;" value="���"
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