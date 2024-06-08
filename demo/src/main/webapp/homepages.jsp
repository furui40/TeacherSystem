<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  Cookie[] cookies = request.getCookies(); // 获取所有的Cookie
  String username = null;

  // 遍历Cookie数组，查找名为 "username" 的Cookie
  if (cookies != null) {
    for (Cookie cookie : cookies) {
      if (cookie.getName().equals("username")) {
        username = cookie.getValue();
        break;
      }
    }
  }
  String welcomeMessage;
  String identity;

  if (username != null) {
    welcomeMessage = "欢迎访问教师信息管理系统，" + username + "同学";
    identity = "您的身份是：学生";
  } else {
    welcomeMessage = "欢迎访问教师信息管理系统";
    identity = "";
  }
%>

<!DOCTYPE html>
<html>
<head>
  <title>教师信息管理系统</title>
  <link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
<h1><p><%= welcomeMessage %></p>
  <div class="identity">
      <%= identity %>
</h1>
<button class="center-button" onclick="window.location.href = 'searchTeacher.jsp'">进入教师详细页后可预约</button>
</div>
<div class="buttons">
  <button class="center-button"  onclick="window.location.href = 'searchTeacher.jsp'">检索教师</button>
  <button class="center-button"  onclick="window.location.href = 'recommendTeacher.jsp'">推荐教师</button>
  <button class="center-button"  onclick="window.location.href = 'searchTeacher.jsp'">查看预约记录</button>
</div>
</body>
</html>