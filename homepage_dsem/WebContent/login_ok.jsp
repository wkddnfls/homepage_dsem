<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="global" class="configue.global" scope="page" />
	<% request.setCharacterEncoding("utf-8"); %>
	<%
	String pass = request.getParameter("password");
	System.out.println(pass);
	if(pass.equals(global.DEFAULT_ADMINPW)){
		session.setAttribute("password",pass);
		System.out.println("session:" + session.getAttribute("password"));
	}else{ %>
		<script>
		self.window.alert("비밀번호를 틀렸습니다.");
		location.href = "javascript:history.back(-1)";
	</script>
	<% 
		}
	%>
</body>
</html>