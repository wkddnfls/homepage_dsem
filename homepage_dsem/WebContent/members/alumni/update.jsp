<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="../imagefile.css?version=1.1">
<title>Member update</title>
</head>
<script>
function file_change(file){
	var str=file.lastIndexOf("\\")+1;	//파일 마지막 "\" 루트의 길이 이후부터 글자를 잘라 파일명 저장
	file = file.substring(str, file.length);
	document.getElementById('fileName_alumni').value=file;
}
</script>
<body>
<% 
	String koreanName = request.getParameter("koreanName"); 
	String englishName = request.getParameter("englishName"); 
	String department = request.getParameter("department");
	String email = request.getParameter("email");
	String admissionYear = request.getParameter("admissionYear");
	String graduationYear = request.getParameter("graduationYear");
	String interest = request.getParameter("interest");
	String imageName = request.getParameter("imageName");
%>
	<h1>Member 수정</h1>
  	<form action="<%=request.getContextPath()%>/members/alumni/updateAction.jsp?imageName=<%=imageName%>" enctype="multipart/form-data" method="post">
    <div>koreanName : </div>
    <div><input name="koreanName" id="koreanName" type="text" value="<%=koreanName %>"/></div>
    <div>englishName : </div>
    <div><input name="englishName" id="englishName" type="text" value="<%=englishName %>"/></div>
    <div>Department : </div>
    <div><input name="department" id="department" type="text" value="<%=department %>"/></div>
    <div>Email : </div>
    <div><input name="email" id="email" type="text" value="<%=email %>"/></div>
    <div>Admission Year : </div>
    <div><input name="admissionYear" id="admissionYear" type="text" value="<%=admissionYear %>"/></div>
    <div>Graduation Year : </div>
    <div><input name="graduationYear" id="graduationYear" type="text" value="<%=graduationYear %>"/></div>
    <div>Interests : </div>
    <div><input name="interest" id="interest" type="text" value="<%=interest %>"/></div><br>
    <div class="file_input_div">
		<input type="button" value="파일 선택" class="file_input_button" />
		<input type="file" id="upfile" name="upfile" class="file_input_hidden" onchange="javascript:file_change(this.value);" />
	</div> 
		<input id="fileName_alumni" name="filename" value="<%=imageName%>" /><br>
    <div>
      <input type="submit" value="수정 확인" />
      <button  type="button" onclick="location.href='./memberList.jsp'">뒤로가기</button>
    </div>
  </form>
</body>
</html>