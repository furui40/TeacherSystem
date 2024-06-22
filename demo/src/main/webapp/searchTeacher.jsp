<%@ page import="com.example.entity.Teacher" %>
<%@ page import="java.util.List" %>
<%@ include file="checklogin.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%int studentId = (int) session.getAttribute("sid");%>

<!DOCTYPE html>
<html>
<head>
  <title>教师信息检索</title>
  <link rel="stylesheet" type="text/css" href="css/login.css">
  <link rel="stylesheet" type="text/css" href="css/sidebar.css">
</head>
<body>
<h1>教师信息检索</h1>
<div class="form-wrapper">
  <form class="search-form" action="TeacherSearchServlet" method="GET">
    <input type="hidden" name="action" value="search">
    <label class="form-label" for="keyword">请输入关键词：</label>
    <input class="form-input" type="text" id="keyword" name="keyword" required>
    <input class="form-submit" type="submit" value="查找">
  </form>
</div>

<%-- 搜索结果显示部分 --%>
<% if (request.getAttribute("teachers") != null) { %>
<h2>搜索结果：</h2>
<table>
  <tr>
    <th>序号</th>
    <th>姓名</th>
    <th>专业</th>
    <th>简介</th>
    <th>主页</th>
  </tr>
  <% List<Teacher> teachers = (List<Teacher>) request.getAttribute("teachers"); %>
  <% for (int i = 0; i < teachers.size(); i++) { %>
  <tr>
    <td><%= i + 1 %></td>
    <td><%= teachers.get(i).getName() %></td>
    <td><%= teachers.get(i).getProfession() %></td>
    <td><%= teachers.get(i).getBio() %></td>
    <td><a href="InfoTeacher.jsp?uid=<%= teachers.get(i).getTeacherID() %>">主页</a></td>
  </tr>
  <% } %>
</table>
<% } else { %>
<h2>没有搜索到符合条件的教师信息。</h2>
<% } %>
<div><button class="center-button" onclick="window.location.href = 'homepages.jsp'">返回主页</button></div>
</body>

<div class="sidebar">
  <h2>欢迎访问</h2>
  <h2>教师信息管理系统</h2>
  <button class="sideButton" onclick="window.location.href = 'homepages.jsp'">返回主页</button>
  <button class="sideButton" onclick="window.location.href = 'listTeacher.jsp'">教师列表</button>
  <button class="sideButton"  onclick="window.location.href = 'searchTeacher.jsp'">检索教师</button>
  <button class="sideButton"  onclick="window.location.href = 'recommendTeacher.jsp'">推荐教师</button>
  <button class="sideButton" onclick="window.location.href = 'studentShowAppointment.jsp?studentId=<%=studentId%>';">查看预约记录</button>
  <button class="sideButton"  onclick="window.location.href = 'login.jsp'">退出登录</button>
</div>

</html>

