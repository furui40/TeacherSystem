<%@ page import="com.example.entity.Teacher" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="checklogin.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>教师推荐</title>
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <link rel="stylesheet" type="text/css" href="css/sidebar.css">
</head>
<body>
<h1>教师推荐</h1>
<div class="form-wrapper">
    <form class="search-form" action="TeacherRecommendServlet" method="GET">
        <label class="form-label" for="profession">请选择专业：</label>
        <select class="form-select" id="profession" name="profession">
            <option value="计算机">计算机</option>
            <option value="英语">英语</option>
            <option value="数学">数学</option>
            <option value="生物">生物</option>
        </select>
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
<% } %>

<div><button class="center-button" onclick="window.location.href = 'homepages.jsp'">返回主页</button></div>
<%int studentId = (int) session.getAttribute("sid");%>
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
</body>
</html>
