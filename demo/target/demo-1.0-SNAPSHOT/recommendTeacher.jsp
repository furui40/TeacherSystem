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
            <option value="电气工程">电气工程</option>
            <option value="机械工程">机械工程</option>
            <option value="控制科学与工程">控制科学与工程</option>
            <option value="材料科学与工程">材料科学与工程</option>
            <option value="物理学">物理学</option>
            <option value="计算机科学与技术">计算机科学与技术</option>
            <option value="动力工程及工程热物理">动力工程及工程热物理</option>
            <option value="核科学与技术">核科学与技术</option>
            <option value="马克思主义理论">马克思主义理论</option>
            <option value="哲学">哲学</option>
            <option value="交通运输工程">交通运输工程</option>
            <option value="土木工程">土木工程</option>
            <option value="城乡规划学">城乡规划学</option>
            <option value="建筑学">建筑学</option>
            <option value="设计学">设计学</option>
            <option value="风景园林学">风景园林学</option>
            <option value="城市规划">城市规划</option>
            <option value="体育学">体育学</option>
            <option value="仪器科学与技术">仪器科学与技术</option>
            <option value="统计学">统计学</option>
            <option value="材料科学与工程,化学">材料科学与工程,化学</option>
            <option value="生物医学工程">生物医学工程</option>
            <option value="食品科学与工程">食品科学与工程</option>
            <option value="生物学">生物学</option>
            <option value="航空宇航科学与技术">航空宇航科学与技术</option>
            <option value="社会学">社会学</option>
            <option value="外国语言文学">外国语言文学</option>
            <option value="应用经济学">应用经济学</option>
            <option value="教育学">教育学</option>
            <option value="翻译">翻译</option>
            <option value="法学">法学</option>
            <option value="力学">力学</option>
            <option value="光学工程,电子科学与技术">光学工程,电子科学与技术</option>
            <option value="光学工程">光学工程</option>
            <option value="电子科学与技术">电子科学与技术</option>
            <option value="信息与通信工程">信息与通信工程</option>
            <option value="计算机科学与技术,软件工程">计算机科学与技术,软件工程</option>
            <option value="网络空间安全">网络空间安全</option>
            <option value="软件工程">软件工程</option>
            <option value="环境科学与工程">环境科学与工程</option>
            <option value="工程管理">工程管理</option>
            <option value="化学">化学</option>
            <option value="测试用专业">测试用专业</option>
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
