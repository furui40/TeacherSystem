<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.dao.AppointmentDao" %>
<%@ page import="com.example.dao.TeachersDao" %>
<%@ page import="com.example.dao.impl.AppointmentDaoImpl" %>
<%@ page import="com.example.dao.impl.TeachersDaoImpl" %>
<%@ page import="com.example.entity.Appointment" %>
<%@ page import="com.example.entity.Teacher" %>
<%@ include file="checklogin.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>学生预约记录</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <link rel="stylesheet" type="text/css" href="css/sidebar.css">
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
    <%
        int studentId = Integer.parseInt(request.getParameter("studentId"));

        // 获取所有预约信息
        AppointmentDao appointmentDao = new AppointmentDaoImpl();
        List<Appointment> appointments = appointmentDao.getAppointmentsByStudentId(studentId);

        // 创建TeachersDao对象
        TeachersDao teachersDao = new TeachersDaoImpl();

        for (Appointment appointment : appointments) {
    %>
    <tr>
        <%-- 获取老师信息 --%>
        <% Teacher teacher = teachersDao.getTeacherById(appointment.getTeacherID()); %>
        <td><%= teacher.getName() %></td>
        <td><%= appointment.getDate() %></td>
        <td>
            <%-- 地点的中文翻译 --%>
            <%
                String place = appointment.getPlace();
                String chinesePlace;
                switch (place) {
                    case "classroom":
                        chinesePlace = "教室";
                        break;
                    case "office":
                        chinesePlace = "办公室";
                        break;
                    case "library":
                        chinesePlace = "图书馆";
                        break;
                    default:
                        chinesePlace = "未知"; // 处理未知情况
                }
            %><%= chinesePlace %>

        </td>
        <td>
            <%-- 预约时间的翻译处理 --%>
            <%
                String appointmentTime = appointment.getAppointmentTime();
                String chineseTime;

                // 根据实际需要处理预约时间的翻译
                switch (appointmentTime) {
                    case "morning":
                        chineseTime = "上午";
                        break;
                    case "afternoon":
                        chineseTime = "下午";
                        break;
                    case "evening":
                        chineseTime = "晚上";
                        break;
                    default:
                        chineseTime = "未知"; // 处理未知情况
                }
            %><%= chineseTime %>

        </td>
    </tr>
    <% } %>
</table>
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
