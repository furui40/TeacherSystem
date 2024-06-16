<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.dao.StudentDao" %>
<%@ page import="com.example.dao.impl.StudentDaoImpl" %>
<%@ page import="com.example.entity.Student" %>

<%
  Cookie[] cookies = request.getCookies(); // 获取所有的Cookie
  String username = null;
  int userId = -1; // 初始化为-1，表示未找到有效的用户ID

// 遍历Cookie数组，查找名为 "username" 和 "id" 的Cookie
  if (cookies != null) {
    for (Cookie cookie : cookies) {
      if (cookie.getName().equals("username")) {
        username = cookie.getValue();
      }
      if (cookie.getName().equals("id")) {
        userId = Integer.parseInt(cookie.getValue());
      }
    }
  }

  int studentId = -1; // 初始化为-1，表示未找到有效的StudentID
  if (userId != -1) {
    // 使用StudentDao查找Student对象
    StudentDao studentDao = new StudentDaoImpl(); // 假设这里是你的StudentDao实现类
    studentId = studentDao.getStudentIdByUserId(userId);

  }
// 现在你可以继续使用 studentId 进行你的后续逻辑，比如展示学生的预约记录等

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
<button class="center-button" onclick="window.location.href = 'listTeacher.jsp'">进入教师详细页后可预约</button>
</div>
<div class="buttons">
  <button class="center-button"  onclick="window.location.href = 'searchTeacher.jsp'">检索教师</button>
  <button class="center-button"  onclick="window.location.href = 'recommendTeacher.jsp'">推荐教师</button>
  <button class="center-button" onclick="window.location.href = 'studentShowAppointment.jsp?studentId=<%=studentId%>';">查看预约记录</button>
</div>
</body>
</html>