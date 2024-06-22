<%@ include file="checklogin.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
//    Cookie[] cookies = request.getCookies(); // 获取所有的Cookie
//    String username = null;

    // 遍历Cookie数组，查找名为 "username" 的Cookie
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("username")) {
                username = cookie.getValue();
                break;
            }
        }
    }
    String welcomeMessage = null;
    String identity;

    if (username != null) {
        welcomeMessage = "欢迎访问教师信息管理系统，" + username + "管理员";
        identity = "您的身份是：管理员";
    } else {
        welcomeMessage = "欢迎访问教师信息管理系统";
        identity = "";
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>教师信息管理系统</title>
    <link rel="stylesheet" type="text/css" href="css/login1.css">
</head>
<body>
<h1><p><%= welcomeMessage %></p>
    <div class="identity">
            <%= identity %>
</h1>

</div>
<div class="buttons">
    <button class="center-button"  onclick="window.location.href = 'manageTeacher.jsp'">教师信息管理</button>
    <button class="center-button"  onclick="window.location.href = 'manageResearch.jsp'">教师成果管理</button>
    <button class="center-button"  onclick="window.location.href = 'manageAppointment.jsp'">预约管理</button>
    <button class="center-button"  onclick="window.location.href = 'login.jsp'">退出登录</button>
</div>
</body>
</html>