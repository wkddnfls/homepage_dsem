<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script>
function logincheck() {
	opener.document.location.href = "home.html";
	
	self.window.close();
}
function logoutcheck() {
	opener.document.location.href = "home.html";
	self.window.close();
	 
}
</script>
</head>
<body>
	<%
		if (session.getAttribute("password") == null) { //세션이 설정되지 않을 경우
	%>
	<form name=loginform method="post" action="login_ok.jsp">
		<table>
			<tr>
				<td align="center">비밀번호</td>
				<td><input name="password" type="password" size="20" maxlength="100"></td>
			</tr>
			<tr> 
				<td><input type="submit" value="로그인" style="position: absolute; top: 50px; left:120px;" OnClick="javascript:logincheck()"/></td> 
			</tr>
		</table>
	</form>
	<%
		} else {
	%>
	<form method="post" action="logout.jsp">
		<input type="submit" value="로그아웃" style="position: absolute; top:30px; left:110px;" OnClick="javascript:logoutcheck()"/>
	</form>
	<%
		}
	%>
</body>
</html>