<%@ page import="com.example.entity.Teacher" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.dao.impl.TeachersDaoImpl" %>
<%@ page import="com.example.entity.Research" %>
<%@ page import="com.example.dao.impl.ResearchDaoImpl" %>
<%@ page import="com.example.dao.TeachersDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>成果管理</title>
    <link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
<h1>成果管理</h1>
<div class="form-wrapper">
    <form class="search-form" action="ResearchServlet" method="GET">
        <label class="form-label" for="keyword">请输入关键词：</label>
        <input class="form-input" type="text" id="keyword" name="keyword" required>
        <input class="form-submit" type="submit" value="查找">
    </form>
</div>
<%-- 搜索结果显示部分 --%>
<% if (request.getAttribute("researches") != null) { %>
<h2>搜索结果：</h2>
<table>
    <tr>
        <th>序号</th>
        <th>教师姓名</th>
        <th>成果名称</th>
        <th>成果简介</th>
        <th>获得时间</th>
        <th>修改</th>
        <th>删除</th>
    </tr>
    <%
        List<Research> researches = (List<Research>) request.getAttribute("researches");
        TeachersDaoImpl teachersDao = new TeachersDaoImpl();
        Teacher teacher = new Teacher();
        for (int i = 0; i < researches.size(); i++) {
    %>
    <tr>
        <td><%= i + 1 %></td>
        <%
            teacher = teachersDao.getTeacherById(researches.get(i).getTeacherID());
        %>
        <td><%=teacher.getName()%></td>
        <td><%= researches.get(i).getTitle() %></td>
        <td><%= researches.get(i).getDescription() %></td>
        <td><%= researches.get(i).getDate() %></td>
        <td><a href="modifyResearchAdmin.jsp?id=<%= researches.get(i).getResearchID() %>">修改</a></td>
        <td>
            <form action="ResearchServlet" method="post">
                <input type="hidden" name="action" value="deletey">
                <input type="hidden" name="id" value="<%= researches.get(i).getResearchID() %>">
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
        <th>教师姓名</th>
        <th>成果名称</th>
        <th>成果简介</th>
        <th>获得时间</th>
        <th>修改</th>
        <th>删除</th>
    </tr>
    <%
        ResearchDaoImpl researchDao = new ResearchDaoImpl();
        List<Research> researches = researchDao.getAllResearches();
        TeachersDaoImpl teachersDao = new TeachersDaoImpl();
        Teacher teacher = new Teacher();
        for (int i = 0; i < researches.size(); i++) {
    %>
    <tr>
        <td><%= i + 1 %></td>
        <%
            teacher = teachersDao.getTeacherById(researches.get(i).getTeacherID());
        %>
        <td><%=teacher.getName()%></td>
        <td><%= researches.get(i).getTitle() %></td>
        <td><%= researches.get(i).getDescription() %></td>
        <td><%= researches.get(i).getDate() %></td>
        <td><a href="modifyResearchAdmin.jsp?id=<%= researches.get(i).getResearchID() %>">修改</a></td>
        <td>
            <form action="ResearchServlet" method="post">
                <input type="hidden" name="action" value="deletey">
                <input type="hidden" name="id" value="<%= researches.get(i).getResearchID() %>">
                <input type="submit" value="删除">
            </form>
        </td>
    </tr>
    <% } %>
</table>
<% } %>
<div><button class="center-button" onclick="window.location.href = 'addNewResearch.jsp'">新增研究成果</button></div>
<div><button class="center-button" onclick="window.location.href = 'homepageadmin.jsp'">返回主页</button></div>
</body>
</html>

