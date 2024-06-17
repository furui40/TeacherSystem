<%@ page import="com.example.entity.Teacher" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.dao.impl.TeachersDaoImpl" %>
<%@ page import="com.example.entity.Appointment" %>
<%@ page import="com.example.dao.impl.StudentDaoImpl" %>
<%@ page import="com.example.entity.Student" %>
<%@ page import="com.example.dao.impl.AppointmentDaoImpl" %>
<%@ include file="checklogin.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>预约管理</title>
    <link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
<h1>预约管理</h1>
<h2>请输入教师或学生姓名：</h2>
<div class="form-wrapper">
    <form class="search-form" action="AppointmentAdminServlet" method="GET">
        <input class="form-input" type="text" id="keyword" name="keyword" required>
        <input class="form-submit" type="submit" value="查找">
    </form>
</div>
<% if (request.getAttribute("msg") != null) { %>
<script>
    alert("<%= request.getAttribute("msg") %>");
</script>
<% } %>
<% if (request.getAttribute("appointments") != null) { %>
<h2>搜索结果：</h2>
<table>
    <tr>
        <th>序号</th>
        <th>教师姓名</th>
        <th>学生姓名</th>
        <th>预约日期</th>
        <th>预约时间</th>
        <th>预约地点</th>
        <th>删除</th>
    </tr>
    <%
        List<Appointment> appointments = (List<Appointment>) request.getAttribute("appointments");
        TeachersDaoImpl teachersDao = new TeachersDaoImpl();
        StudentDaoImpl studentDao = new StudentDaoImpl();
        Teacher teacher = new Teacher();
        Student student = new Student();
        for (int i = 0; i < appointments.size(); i++) {
    %>
    <tr>
        <td><%= i + 1 %></td>
        <%
            teacher = teachersDao.getTeacherById(appointments.get(i).getTeacherID());
            student = studentDao.getStudentById(appointments.get(i).getStudentID());
            String appointTime = "早上";
            String appointPlace = "教室";
            String time = appointments.get(i).getAppointmentTime();
            String place = appointments.get(i).getPlace();
            if(time.equals("morning")){
                appointTime = "上午";
            }else if(time.equals("afternoon")){
                appointTime = "下午";
            }else if (time.equals("evening")) {
                appointTime = "晚上";
            }
            if(place.equals("classroom")){
                appointPlace = "教室";
            }else if(place.equals("library")){
                appointPlace = "图书馆";
            }else if (place.equals("office")) {
                appointPlace = "办公室";
            }
        %>
        <td><%=teacher.getName()%></td>
        <td><%=student.getName()%></td>
        <td><%=appointments.get(i).getDate() %></td>
        <td><%=appointTime%></td>
        <td><%=appointPlace%></td>
        <td>
            <form action="AppointmentAdminServlet" method="post">
                <input type="hidden" name="action" value="deletey">
                <input type="hidden" name="id" value="<%= appointments.get(i).getAppointmentID() %>">
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
        <th>学生姓名</th>
        <th>预约日期</th>
        <th>预约时间</th>
        <th>预约地点</th>
        <th>删除</th>
    </tr>
    <%
        AppointmentDaoImpl appointmentDao = new AppointmentDaoImpl();
        TeachersDaoImpl teachersDao = new TeachersDaoImpl();
        StudentDaoImpl studentDao = new StudentDaoImpl();
        List<Appointment> appointments = appointmentDao.getAllAppointments();
        Teacher teacher = new Teacher();
        Student student = new Student();
        for (int i = 0; i < appointments.size(); i++) {
    %>
    <tr>
        <td><%= i + 1 %></td>
        <%
            teacher = teachersDao.getTeacherById(appointments.get(i).getTeacherID());
            student = studentDao.getStudentById(appointments.get(i).getStudentID());
            String appointTime = "早上";
            String appointPlace = "教室";
            String time = appointments.get(i).getAppointmentTime();
            String place = appointments.get(i).getPlace();
            if(time.equals("morning")){
                appointTime = "上午";
            }else if(time.equals("afternoon")){
                appointTime = "下午";
            }else if (time.equals("evening")) {
                appointTime = "晚上";
            }
            if(place.equals("classroom")){
                appointPlace = "教室";
            }else if(place.equals("library")){
                appointPlace = "图书馆";
            }else if (place.equals("office")) {
                appointPlace = "办公室";
            }
        %>
        <td><%=teacher.getName()%></td>
        <td><%=student.getName()%></td>
        <td><%=appointments.get(i).getDate() %></td>
        <td><%=appointTime%></td>
        <td><%=appointPlace%></td>
        <td>
            <form action="AppointmentAdminServlet" method="post">
                <input type="hidden" name="action" value="deletey">
                <input type="hidden" name="id" value="<%= appointments.get(i).getAppointmentID() %>">
                <input type="submit" value="删除">
            </form>
        </td>
    </tr>
    <% } %>
</table>
<% } %>
<div><button class="center-button" onclick="window.location.href = 'addNewAppointment.jsp'">新增预约</button></div>
<div><button class="center-button" onclick="window.location.href = 'homepageadmin.jsp'">返回主页</button></div>
</body>
</html>

