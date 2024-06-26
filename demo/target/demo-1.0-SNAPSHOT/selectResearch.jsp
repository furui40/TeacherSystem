<%@ page import="com.example.entity.Research" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.dao.impl.ResearchDaoImpl" %>
<%@ page import="com.example.dao.impl.UsersDaoImpl" %>
<%@ page import="com.example.dao.impl.TeachersDaoImpl" %>
<%@ include file="checklogin.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>成果展示管理</title>
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <link rel="stylesheet" type="text/css" href="css/sidebar.css">
</head>
<body>
<h1>成果展示管理</h1>
<table>
    <tr>
        <th>项目序号</th>
        <th>项目名称</th>
        <th>项目描述</th>
        <th>修改</th>
        <th>删除</th>
    </tr>
    <%-- 从数据库获取项目数据，并遍历展示 --%>
    <%
        String id = null;

        // 遍历Cookie数组，查找名为 "id" 的Cookie
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("id")) {
                    id = cookie.getValue();
                    break;
                }
            }
        }
        int uid = Integer.parseInt(id);
        TeachersDaoImpl teachersDao = new TeachersDaoImpl();
        int uuid = teachersDao.getTeacherByUserId(uid).getTeacherID();
    %>
    <%

        ResearchDaoImpl ResearchDao = new ResearchDaoImpl();
        // 假设从数据库获取到的项目数据存储在一个List中，每个项目是一个Research对象
        List<Research> researchList = ResearchDao.getResearchByTeacherId(uuid); // 从数据库获取所有项目数据

        // 遍历项目列表，展示每个项目的信息
        for (int i = 0; i < researchList.size(); i++) {
            Research research = researchList.get(i);
    %>
    <tr>
        <td><%= i + 1 %></td>
        <td><%= research.getTitle() %></td>
        <td><%= research.getDescription() %></td>
        <td><a href="modifyResearch.jsp?id=<%= research.getResearchID() %>">修改</a></td>
        <td>
            <form action="ResearchServlet" method="post">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" value="<%= research.getResearchID() %>">
                <input type="submit" value="删除">
            </form>
        </td>
    </tr>
    <%
        }
    %>
</table>
<button class="center-button" onclick="window.location.href = 'addResearch.jsp'">新增项目</button>
<div><button class="center-button" onclick="window.location.href = 'homepaget.jsp'">返回主页</button></div>
<%int tid = (int) session.getAttribute("tid");%>
<div class="sidebar">
    <h2>欢迎访问</h2>
    <h2>教师信息管理系统</h2>
    <button class="sideButton" onclick="window.location.href = 'homepaget.jsp'">返回主页</button>
    <button class="sideButton"  onclick="window.location.href = 'modifyTeacher.jsp?tid=<%=tid%>'">编辑教师基本信息</button>
    <button class="sideButton"  onclick="window.location.href = 'selectResearch.jsp?uid=<%=tid%>'">修改个人成果展示</button>
    <button class="sideButton"  onclick="window.location.href = 'teacherSetSchedule.jsp?uid=<%=tid%>'">设置个人日程</button>
    <button class="sideButton"  onclick="window.location.href = 'teacherAppointmentShow.jsp?uid=<%=tid%>'">查看预约情况</button>
    <button class="sideButton"  onclick="window.location.href = 'login.jsp'">退出登录</button>
</div>
</body>
</html>