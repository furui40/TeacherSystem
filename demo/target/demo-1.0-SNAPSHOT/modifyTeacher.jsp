<%@ page import="com.example.entity.Teacher" %>
<%@ page import="com.example.dao.impl.TeachersDaoImpl" %>
<%@ page import="com.example.dao.TeachersDao" %><%--<%@ page import="com.example.entity.Teacher" contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ include file="checklogin.jsp"%>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setAttribute("pageRole", "Teacher");
    // 获取id
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
    TeachersDaoImpl teachersDao = new TeachersDaoImpl();
    int uuid = Integer.parseInt(uid);
    Teacher teacher = teachersDao.getTeacherById(uuid);
    String Name = "请填写姓名";
    String Mail = "请填写邮箱";
    String Bio = "请填写简介";
    if(teacher != null){
        Name = teacher.getName();
        Mail = teacher.getEmail();
        Bio = teacher.getBio();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>教师信息编辑</title>
    <link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
<h1>教师信息编辑</h1>
<table>
    <form name="modifyForm" id="modify-form" action="TeacherServlet" method="POST">
        <tr>
            <td>姓名:</td>
            <td><input type="text" id="name" name="name" required value="<%=Name%>"></td>
        </tr>
        <tr>
            <td>专业:</td>
            <td>
                <select id="profession" name="profession">
                    <option value="数学">数学</option>
                    <option value="英语">英语</option>
                    <option value="历史">历史</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>邮箱:</td>
            <td><input type="email" id="email" name="email" required value="<%=Mail%>"></td>
        </tr>
        <tr>
            <td>简介:</td>
            <td><textarea id="bio" name="bio" rows="4" required><%=Bio%></textarea></td>
        </tr>
        <tr>
            <td colspan="2">
                <button type="submit">提交</button>
            </td>
        </tr>
    </form>
</table>
<div><button class="center-button" onclick="window.location.href = 'homepaget.jsp'">返回主页</button></div>
</body>
</html>