<%@ page import="com.example.entity.Teacher" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.dao.impl.TeachersDaoImpl" %>
<%@ include file="checklogin.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>教师信息管理</title>
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <link rel="stylesheet" type="text/css" href="css/sidebar.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        function updateTeacherInfo() {
            $.ajax({
                url: 'dataFetch',
                type: 'POST',
                success: function(response) {
                    alert('教师信息已更新');
                    location.reload();
                },
                error: function() {
                    alert('更新失败');
                }
            });
        }
    </script>
</head>
<body>
<h1>教师信息管理</h1>
<div><button class="center-button" onclick="updateTeacherInfo()">更新官网教师信息</button></div>
<div class="form-wrapper">
    <form class="search-form" action="TeacherSearchServlet" method="GET">
        <input type="hidden" name="action" value="adminSearch">
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
        <th>修改</th>
        <th>删除</th>
    </tr>
    <% List<Teacher> teachers = (List<Teacher>) request.getAttribute("teachers"); %>
    <% for (int i = 0; i < teachers.size(); i++) { %>
    <tr>
        <td><%= i + 1 %></td>
        <td><%= teachers.get(i).getName() %></td>
        <td><%= teachers.get(i).getProfession() %></td>
        <td><%= teachers.get(i).getBio() %></td>
        <td><a href="modifyTeacher.jsp?admintid=<%= teachers.get(i).getTeacherID() %>">修改</a></td>
        <td>
            <form action="TeacherServlet" method="post">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" value="<%= teachers.get(i).getTeacherID() %>">
                <input type="submit" value="删除">
            </form>
        </td>
    </tr>
    <% } %>
</table>
<% } else { %>
<table>
    <tr>
        <th>序号</th>
        <th>姓名</th>
        <th>专业</th>
        <th>简介</th>
        <th>主页</th>
        <th>删除</th>
    </tr>
    <%
        TeachersDaoImpl teachersDao = new TeachersDaoImpl();
        List<Teacher> teachers = teachersDao.getAllTeachers();
        for (int i = 0; i < teachers.size(); i++) {
    %>
    <tr>
        <td><%= i + 1 %></td>
        <td><%= teachers.get(i).getName() %></td>
        <td><%= teachers.get(i).getProfession() %></td>
        <td><%= teachers.get(i).getBio() %></td>
        <td><a href="modifyTeacher.jsp?admintid=<%= teachers.get(i).getTeacherID() %>">修改</a></td>
        <td>
            <form action="TeacherServlet" method="post">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" value="<%= teachers.get(i).getTeacherID() %>">
                <input type="submit" value="删除">
            </form>
        </td>
    </tr>
    <% } %>
</table>
<% } %>
<div class="sidebar">
    <h2>欢迎访问</h2>
    <h2>教师信息管理系统</h2>
    <button class="sideButton"  onclick="window.location.href = 'homepageadmin.jsp'">返回主页</button>
    <button class="sideButton"  onclick="window.location.href = 'manageTeacher.jsp'">教师信息管理</button>
    <button class="sideButton"  onclick="window.location.href = 'manageResearch.jsp'">教师成果管理</button>
    <button class="sideButton"  onclick="window.location.href = 'manageAppointment.jsp'">预约管理</button>
    <button class="sideButton" onclick="window.location.href = 'login.jsp'">退出登录</button>
</div>
<div><button class="center-button" onclick="window.location.href = 'addNewTeacher.jsp'">新增教师</button></div>
<div><button class="center-button" onclick="window.location.href = 'homepageadmin.jsp'">返回主页</button></div>
</body>
</html>

