<%@ page import="com.example.dao.impl.TeachersDaoImpl" %>
<%@ page import="com.example.entity.Teacher" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.dao.TeachersDao" %>
<%@ include file="checklogin.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>所有老师列表</title>
    <link rel="stylesheet" type="text/css" href="css/list.css">
</head>
<body>
<h1>所有老师列表</h1>
<table>
    <tr>
        <th>姓名</th>
        <th>邮箱</th>
        <th>专业</th>
        <th>简介</th>
        <th>操作</th>
    </tr>
    <% TeachersDao teachersDao = new TeachersDaoImpl();
        List<Teacher> teachers = teachersDao.getAllTeachers();
        for (Teacher teacher : teachers) { %>
    <tr>
        <td><%= teacher.getName() %></td>
        <td><%= teacher.getEmail() %></td>
        <td><%= teacher.getProfession() %></td>
        <td><%= teacher.getBio() %></td>
        <td><a href="InfoTeacher.jsp?uid=<%= teacher.getTeacherID() %>">跳转主页，选择预约</a></td>
    </tr>
    <% } %>
</table>
<div><button class="center-button" onclick="window.location.href = 'homepages.jsp'">返回主页</button></div>
</body>
</html>
