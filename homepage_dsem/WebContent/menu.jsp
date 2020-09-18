<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <link rel="stylesheet" href="/menu.css">
  <title></title>
  <script>
	function loginpopup() {
		var url = "/login.jsp";
		var name = "관리자";
		var option = "width = 300, height =100, top = 200, left = 500, location = no"
		window.open(url, name, option);
		
	}
</script>
</head>
<body>
  <div id="background">
    <img id = "logo" src="/Logo.png">
    <a href="/home.html"><h1>Data Semantics Laboratory</h1></a>
    <% if(session.getAttribute("password")==null) {%>
    	<a onClick="window.location='javascript:loginpopup()'"><p id="btn1">Login</p> </a> 
	<%  }
	 else { %> 
    	<a onClick="window.location='javascript:loginpopup()'"><p id="btn1">Logout</p> </a>
	<% }%>
  </div>
  <div>
    <ul id="main_menu">
      <li><a href="/home.html">Home</a></li>
      <li><a href="#">Members</a>
        <ul id="sub_menu">
          <li><a href="/members/professor/professor.html">Professor</a></li>
          <li><a href="/members/researcher/researcher.jsp">Researcher</a></li>
          <li><a href="/members/alumni/alumni.jsp">Alumni</a></li>
        </ul>
      </li>
      <li><a href="/paper/paper.jsp">Paper</a></li>
      <li><a href="/others/others.jsp">Others</a></li>
      <li><a href="/activity/activity.jsp">Activity</a></li>
    </ul>
  </div>
</body>
</html>