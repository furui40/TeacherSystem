<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.dao.ScheduleDao" %>
<%@ page import="com.example.entity.Schedule" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.DayOfWeek" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="com.example.dao.impl.ScheduleDaoImpl" %>
<%@ page import="com.example.dao.TeachersDao" %>
<%@ page import="com.example.dao.impl.TeachersDaoImpl" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.entity.Teacher" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.example.dao.AppointmentDao" %>
<%@ page import="com.example.dao.impl.AppointmentDaoImpl" %>
<%@ page import="com.example.entity.Appointment" %>
<%@ include file="checklogin.jsp"%>

<%
    // 获取传入的TeacherId参数
    int teacherId = Integer.parseInt(request.getParameter("uid"));

    // 获取当前日期的周一和周日
    LocalDate currentDate = LocalDate.now();
    LocalDate monday = currentDate.with(DayOfWeek.MONDAY);
    LocalDate sunday = currentDate.with(DayOfWeek.SUNDAY);

    // 获取日期格式化对象
    DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

    // 构建表格的日期和星期标题
    String[] weekDays = {"星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"};

    // 时间段数组，对应的中文名称
    String[] timeSlots = {"morning", "afternoon", "evening"};
    String[] timeSlotNames = {"早上", "中午", "晚上"};

    // 获取页面参数，如果没有则默认为第一页
    int currentPage = 1;
    if (request.getParameter("page") != null) {
        currentPage = Integer.parseInt(request.getParameter("page"));
    }

    // 计算当前页的日期范围
    LocalDate pageStart = monday.plusDays((currentPage - 1) * 7);
    LocalDate pageEnd = pageStart.plusDays(6);

    // 构建当前页的日期数组
    List<String> weekDates = new ArrayList<>();
    LocalDate currentDay = pageStart;
    while (!currentDay.isAfter(pageEnd)) {
        weekDates.add(currentDay.format(dateFormatter));
        currentDay = currentDay.plusDays(1);
    }

    // 获取教师信息
    TeachersDao teachersDao = new TeachersDaoImpl();
    Teacher teacher = teachersDao.getTeacherById(teacherId);

    // 获取教师已设置的空闲时间
    ScheduleDao scheduleDao = new ScheduleDaoImpl();
    List<Schedule> schedules = scheduleDao.getScheduleByTeacherId(teacherId);

    AppointmentDao appointmentDao = new AppointmentDaoImpl();
    List<Appointment> appointments = appointmentDao.getAppointmentsByTeacherId(teacherId);

    // 设置最大页数为4
    int maxPages = 4;
%>
<!DOCTYPE html>
<html>
<head>
    <title>设置教师空闲时间表</title>
    <link rel="stylesheet" type="text/css" href="css/set.css">
    <link rel="stylesheet" type="text/css" href="css/sidebar.css">
</head>
<body>
<h1>设置教师空闲时间表</h1>

<!-- 显示当前页的日期范围 -->
<h3><%= pageStart.format(dateFormatter) %> 至 <%= pageEnd.format(dateFormatter) %></h3>
<h3>注意：单元格内显示的是当前时间点是否接受预约，选中复选框并提交后，会变为相反的状态</h3>
<form method="post" action="SetAvailabilityServlet">
    <input type="hidden" name="teacherId" value="<%= teacherId %>">
    <input type="hidden" name="pageStart" value="<%= pageStart.format(dateFormatter) %>">
    <input type="hidden" name="pageEnd" value="<%= pageEnd.format(dateFormatter) %>">

    <table border="1">
        <tr>
            <th>时间段</th>
            <%-- Loop through each date to create headers --%>
            <% for (String date : weekDates) { %>
            <th><%= date %><br><%= weekDays[LocalDate.parse(date, dateFormatter).getDayOfWeek().getValue() - 1] %></th>
            <% } %>
        </tr>
        <%-- Loop through each time slot --%>
        <% for (int i = 0; i < timeSlots.length; i++) { %>
        <tr>
            <td><%= timeSlotNames[i] %></td>
            <%-- Loop through each date for the current time slot --%>
            <% for (String date : weekDates) {
                LocalDate currentDate2 = LocalDate.parse(date, dateFormatter);
                int isAvailable = 1;
                for (Schedule schedule : schedules) {
                    Date date2 = schedule.getDate();
                    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                    String formattedDate = formatter.format(date2);
                    if (formattedDate.equals(currentDate2.format(dateFormatter)) && schedule.getTimeSlot().equals(timeSlots[i])) {
                        isAvailable = 0;
                        break;
                    }
                }
                for (Appointment appointment : appointments) {
                    Date date3 = appointment.getDate();
                    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                    String formattedDate = formatter.format(date3);
                    if (formattedDate.equals(currentDate2.format(dateFormatter)) && appointment.getAppointmentTime().equals(timeSlots[i])) {
                        isAvailable = 2;
                        break;
                    }
                }
                // Check if the checkbox was previously checked
                String checkBoxName = "schedule_" + currentDate2.format(dateFormatter) + "_" + timeSlots[i];
                String isChecked = request.getParameter(checkBoxName) != null ? "checked" : "";
                String checkBoxValue = "1";


            %>
            <td>
                <% if (isAvailable == 2) { %>
                已被预约
                <% } else { %>
                <%= isAvailable == 1 ? "不接受预约" : "接受预约" %>
                <br>
                <input type="checkbox" name="<%= checkBoxName %>" value="<%= checkBoxValue %>" <%= isChecked %>>
                <% } %>
            </td>

            <% } %>
        </tr>
        <% } %>
    </table>

    <button type="submit">提交</button>
</form>

<div>
    <%-- Pagination links --%>
    <% if (currentPage > 1) { %>
    <a href="?uid=<%= teacherId %>&page=<%= currentPage - 1 %>">&laquo; 上一页</a>
    <% } %>
    <% if (currentPage < maxPages) { %>
    <a href="?uid=<%= teacherId %>&page=<%= currentPage + 1 %>">下一页 &raquo;</a>
    <% } %>
</div>
<%int tid = (int) session.getAttribute("tid");%>
<div class="sidebar">
    <h2>欢迎访问</h2>
    <h2>教师信息管理系统</h2>
    <button class="sideButton" onclick="window.location.href = 'homepaget.jsp'">返回主页</button>
    <button class="sideButton" onclick="window.location.href = 'modifyTeacher.jsp?tid=<%=tid%>'">编辑教师基本信息</button>
    <button class="sideButton" onclick="window.location.href = 'selectResearch.jsp?uid=<%=tid%>'">修改个人成果展示</button>
    <button class="sideButton" onclick="window.location.href = 'teacherSetSchedule.jsp?uid=<%=tid%>'">设置个人日程</button>
    <button class="sideButton" onclick="window.location.href = 'teacherAppointmentShow.jsp?uid=<%=tid%>'">查看预约情况</button>
    <button class="sideButton" onclick="window.location.href = 'login.jsp'">退出登录</button>
</div>
<button onclick="window.location.href = 'homepaget.jsp'">返回首页</button>

</body>
</html>


