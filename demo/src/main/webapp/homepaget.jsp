<%@ page import="com.example.dao.impl.TeachersDaoImpl" %>
<%@ page import="com.example.entity.Teacher" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Cookie[] cookies = request.getCookies(); // 获取所有的Cookie
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
    Teacher teacher = null;
    int uid = -1;
    int tid = -1;
    String name = null;
    uid = Integer.parseInt(id);
    if(uid != -1){
        TeachersDaoImpl TeacherDao = new TeachersDaoImpl();
        teacher = TeacherDao.getTeacherByUserId(uid);
        if(teacher != null){
            name = teacher.getName();
            tid = teacher.getTeacherID();
        }
    }
    String welcomeMessage = null;
    String identity;

    if (name != null) {
        welcomeMessage = "欢迎访问教师信息管理系统，" + name + "老师";
        identity = "您的身份是：老师";
    } else {
        welcomeMessage = "欢迎访问教师信息管理系统";
        identity = "请去编辑教师基本信息";
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

</div>
<div class="buttons">
    <button class="center-button"  onclick="window.location.href = 'modifyTeacher.jsp?uid=<%=tid%>'">编辑教师基本信息</button>
    <button class="center-button"  onclick="window.location.href = 'selectResearch.jsp?uid=<%=tid%>'">修改个人成果展示</button>
    <button class="center-button"  onclick="window.location.href = 'modifyTeacher.jsp?uid=<%=tid%>'">设置个人日程</button>
    <button class="center-button"  onclick="window.location.href = 'modifyTeacher.jsp?uid=<%=tid%>'">查看预约情况</button>
</div>
</body>
</html>