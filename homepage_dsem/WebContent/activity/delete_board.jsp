<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>  // 자바 스크립트 시작

function deleteCheck() {
   var form = document.deleteform;
   if( !form.password.value ) {
    alert( "비밀번호를 적어주세요" );
    form.password.focus();
    return;
   }
 	form.submit();
 }
 
 function delete_back() {
	 self.window.close();
 }
 </script>
 <%
 	int idx = Integer.parseInt(request.getParameter("idx"));
 %>
</head>
<body>
	<div style="padding: 20px 0px 0px 50px;">
		<table width="85%">
		<form name=deleteform method=post action="delete_board_ok.jsp?idx=<%=idx%>">
			<tr>
				<td>
					<div style="height: 30px; width: 105%; display:table; border: 2px solid #A4A4A4; border-radius: 5px;">
						<p style="text-align: center; display:table-cell; vertical-align:middle; font-weight: bold;">삭제</p>
					</div>
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<br>
				<td align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비밀번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td><input name="password" type="password" size="40" maxlength="100"></td>
			</tr>
			<tr height="2" bgcolor="#dddddd">
				<td colspan="3"></td>
			</tr>
			<tr height="5" bgcolor="#82B5DF">
				<td colspan="3"></td>
			</tr>
			<tr align="center">
				<td>
				<br>
					<input type=button value="삭제" style="position: absolute; left:400px;" OnClick="javascript:deleteCheck();"> 
					<input type=button value="취소" style="position: absolute; left:450px;" OnClick="javascript:delete_back();">
				</td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>