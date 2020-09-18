<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>Member 등록</title>
</head>

<body>
  <h1>Member 등록</h1>
  <form action="<%=request.getContextPath()%>/members/alumni/memberAction.jsp"  enctype="multipart/form-data" method="post">
    <div>koreanName : </div>
    <div><input name="koreanName" id="koreanName" type="text" /></div>
    <div>englishName : </div>
    <div><input name="englishName" id="englishName" type="text" /></div>
    <div>Department : </div>
    <div><input name="department" id="department" type="text" /></div>
    <div>Email : </div>
    <div><input name="email" id="email" type="text" /></div>
    <div>Admission Year : </div>
    <div><input name="admissionYear" id="admissionYear" type="text" /></div>
    <div>Graduation Year : </div>
    <div><input name="graduationYear" id="graduationYear" type="text" /></div>
    <div>Interests : </div>
    <div><input name="interest" id="interest" type="text" /></div><br>
	<div><input type="file" name="filename" size=40> </div><br>
 
    <div>
      <input type="submit" value="등록" />
      <input type="reset" value="초기화" />
      <button  type="button" onclick="location.href='./alumni.jsp'">뒤로가기</button>
      <button  type="button" onclick="location.href='./memberList.jsp'">목록보기</button>
    </div>
  </form>
</body>

</html>