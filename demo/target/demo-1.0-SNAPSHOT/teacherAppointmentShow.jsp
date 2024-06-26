<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.dao.AppointmentDao" %>
<%@ page import="com.example.dao.StudentDao" %>
<%@ page import="com.example.dao.impl.AppointmentDaoImpl" %>
<%@ page import="com.example.dao.impl.StudentDaoImpl" %>
<%@ page import="com.example.entity.Appointment" %>
<%@ page import="com.example.entity.Student" %>
<%@ include file="checklogin.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>教师预约记录</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <link rel="stylesheet" type="text/css" href="css/sidebar.css">
</head>
<body>
<h1>教师预约记录</h1>
<table border="1">
    <tr>
        <th>日期</th>
        <th>地点</th>
        <th>预约时间</th>
        <th>学生姓名</th>
    </tr>
    <%
        // 获取教师ID
        int teacherId = Integer.parseInt(request.getParameter("uid"));

        // 获取所有预约信息
        AppointmentDao appointmentDao = new AppointmentDaoImpl();
        List<Appointment> appointments = appointmentDao.getAppointmentsByTeacherId(teacherId);

        // 创建StudentDao对象
        StudentDao studentDao = new StudentDaoImpl();

        for (Appointment appointment : appointments) {
    %>
    <tr>
        <td><%= appointment.getDate() %></td>
        <td><%= translatePlace(appointment.getPlace()) %></td>
        <td><%= translateAppointmentTime(appointment.getAppointmentTime()) %></td>
        <td>
            <%-- 获取学生姓名 --%>
            <%
                int studentId = appointment.getStudentID();
                Student student = studentDao.getStudentById(studentId);
                if (student != null) {
            %>
            <%= student.getName() %>
            <% } else { %>
            未知学生
            <% } %>
        </td>
    </tr>
    <% } %>
</table>
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

<%!
    // 方法用于将英文地点翻译为中文
    public String translatePlace(String place) {
        switch (place) {
            case "classroom":
                return "教室";
            case "office":
                return "办公室";
            case "library":
                return "图书馆";
            default:
                return "未知";
        }
    }

    // 方法用于将英文预约时间翻译为中文
    public String translateAppointmentTime(String appointmentTime) {
        switch (appointmentTime) {
            case "morning":
                return "早上";
            case "afternoon":
                return "下午";
            case "evening":
                return "晚上";
            default:
                return "未知";
        }
    }
%>
