<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.dao.AppointmentDao" %>
<%@ page import="com.example.dao.TeachersDao" %>
<%@ page import="com.example.dao.impl.AppointmentDaoImpl" %>
<%@ page import="com.example.dao.impl.TeachersDaoImpl" %>
<%@ page import="com.example.entity.Appointment" %>
<%@ page import="com.example.entity.Teacher" %>
<link rel="stylesheet" type="text/css" href="css/appoint.css">

<%
    int studentId = Integer.parseInt(request.getParameter("studentId"));

    // 获取所有预约信息
    AppointmentDao appointmentDao = new AppointmentDaoImpl();
    List<Appointment> appointments = appointmentDao.getAppointmentsByStudentId(studentId);

    // 创建TeachersDao对象
    TeachersDao teachersDao = new TeachersDaoImpl();
%>
<!DOCTYPE html>
<html>
<head>
    <title>学生预约记录</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
<h1>学生预约记录</h1>
<table border="1">
    <tr>
        <th>老师姓名</th>
        <th>日期</th>
        <th>地点</th>
        <th>预约时间</th>
    </tr>
    <% for (Appointment appointment : appointments) { %>
    <tr>
        <%-- 获取老师信息 --%>
        <% Teacher teacher = teachersDao.getTeacherById(appointment.getTeacherID()); %>
        <td><%= teacher.getName() %></td>
        <td><%= appointment.getDate() %></td>
        <td><%= appointment.getPlace() %></td>
        <td><%= appointment.getAppointmentTime() %></td>
    </tr>
    <% } %>
</table>
<div><button class="center-button" onclick="window.location.href = 'homepages.jsp'">返回主页</button></div>
</body>
</html>
