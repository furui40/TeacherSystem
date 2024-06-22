<%@ page import="com.example.dao.impl.ResearchDaoImpl" %>
<%@ page import="com.example.entity.Research" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.dao.impl.TeachersDaoImpl" %>
<%@ page import="com.example.entity.Teacher" %>
<%@ include file="checklogin.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>教师详细页</title>
    <link rel="stylesheet" type="text/css" href="css/info.css">
    <link rel="stylesheet" type="text/css" href="css/sidebar.css">
</head>
<body>
<h1>教师详细页</h1>
<%
    // 获取完整的查询字符串
    String queryString = request.getQueryString();
    String uid = null;
    if (queryString != null) {
        String parameterName = "uid=";
        int index = queryString.indexOf(parameterName);

        if (index != -1) {
            index += parameterName.length();
            int endIndex = queryString.indexOf("&", index);
            uid = (endIndex != -1) ? queryString.substring(index, endIndex) : queryString.substring(index);
        }
    }
%>
<%
    int uuid = Integer.parseInt(uid);
    TeachersDaoImpl TeacherDao = new TeachersDaoImpl();
    ResearchDaoImpl ResearchDao = new ResearchDaoImpl();
    Teacher teacher = TeacherDao.getTeacherById(uuid);
    List<Research> researchList = ResearchDao.getResearchByTeacherId(uuid); // 从数据库获取所有项目数据
%>
<div class="container">
    <div class="left-section">
        <h2>基本信息</h2>
        <p><strong>姓名:</strong> <%= teacher.getName() %></p>
        <p><strong>专业:</strong> <%= teacher.getProfession() %></p>
        <p><strong>邮箱:</strong> <%= teacher.getEmail() %></p>
        <p><strong>简介:</strong> <%= teacher.getBio() %></p>
    </div>
    <div class="right-section">
        <h2>学术成果或项目展示</h2>
        <%
            // 遍历项目列表，展示每个项目的信息
            for (int i = 0; i < researchList.size(); i++) {
                Research research = researchList.get(i);
        %>
        <div class="achievement">
            <h3><%= research.getTitle() %></h3>
            <p><%= research.getDescription() %></p>
            <p><strong>完成时间:</strong> <%= research.getDate() %></p>
        </div>
        <% } %>
    </div>
</div>
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
<button class="center-button" onclick="window.location.href = 'studentAppointment.jsp?TeacherId=<%= teacher.getTeacherID() %>'">预约查询</button>
<div><button class="center-button" onclick="window.location.href = 'homepages.jsp'">返回主页</button></div>
</body>
</html>