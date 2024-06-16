<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.dao.ScheduleDao" %>
<%@ page import="com.example.entity.Schedule" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.DayOfWeek" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="com.example.dao.impl.ScheduleDaoImpl" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Locale" %>
<%@ page import="com.example.dao.StudentDao" %>
<%@ page import="com.example.dao.impl.StudentDaoImpl" %>

<%
    // 获取传入的TeacherId参数
    int teacherId = Integer.parseInt(request.getParameter("TeacherId"));

    // 获取当前日期的周一和周日
    LocalDate currentDate = LocalDate.now();
    LocalDate monday = currentDate.with(DayOfWeek.MONDAY);
    LocalDate sunday = currentDate.with(DayOfWeek.SUNDAY);

    // 获取日期格式化对象
    DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

    // 构建表格的日期和星期标题
    String[] weekDays = {"星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"};

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

    // 获取预约信息
    ScheduleDao scheduleDao = new ScheduleDaoImpl();
    List<Schedule> schedules = scheduleDao.getScheduleByTeacherId(teacherId);

    Cookie[] cookies = request.getCookies(); // 获取所有的Cookie
    int userId = -1; // 初始化为-1，表示未找到有效的用户ID

    // 遍历Cookie数组，查找名为 "id" 的Cookie
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("id")) {
                userId = Integer.parseInt(cookie.getValue());
                break;
            }
        }
    }

    int studentId = -1; // 初始化为-1，表示未找到有效的StudentID
    if (userId != -1) {
        // 使用StudentDao查找Student对象
        StudentDao studentDao = new StudentDaoImpl(); // 假设这里是你的StudentDao实现类
        studentId = studentDao.getStudentIdByUserId(userId);
    }

    // 设置最大页数为4
    int maxPages = 4;
%>
<!DOCTYPE html>
<html>
<head>
    <title>预约查询</title>
    <link rel="stylesheet" type="text/css" href="css/appoint.css">
</head>
<body>
<h1>预约查询</h1>

<!-- 显示当前页的日期范围 -->
<h3><%= pageStart.format(dateFormatter) %> 至 <%= pageEnd.format(dateFormatter) %></h3>

<table border="1">
    <tr>
        <th>时间段</th>
        <% for (String weekDate : weekDates) { %>
        <th><%= weekDate %><br><%= weekDays[LocalDate.parse(weekDate, dateFormatter).getDayOfWeek().getValue() - 1] %></th>
        <% } %>
    </tr>
    <% String[] timeSlots = {"morning", "afternoon", "evening"}; %>
    <% String[] timeSlotsChinese = {"上午", "下午", "晚上"}; %>
    <% for (int t = 0; t < timeSlots.length; t++) { %>
    <tr>
        <td><%= timeSlotsChinese[t] %></td>
        <% for (String date : weekDates) {
            boolean canBook = true;
            for (Schedule schedule : schedules) {
                Date date2 = schedule.getDate();
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                String formattedDate = formatter.format(date2);
                if (formattedDate.equals(date) && schedule.getTimeSlot().equals(timeSlots[t])) {
                    canBook = false;
                    break;
                }
            }
        %>
        <td><%= canBook ? "不可预约" : "可预约" %></td>
        <% } %>
    </tr>
    <% } %>
</table>

<!-- 翻页按钮 -->
<% if (currentPage > 1) { %>
<a href="studentAppointment.jsp?TeacherId=<%= teacherId %>&page=<%= currentPage - 1 %>">上一页</a>
<% } %>
<% if (!weekDates.isEmpty() && currentPage < maxPages) { %>
<a href="studentAppointment.jsp?TeacherId=<%= teacherId %>&page=<%= currentPage + 1 %>">下一页</a>
<% } %>

<form method="post" action="AppointmentServlet" onsubmit="return checkAvailability()">
    <input type="hidden" name="teacherId" value="<%= teacherId %>">
    <input type="hidden" name="studentId" value="<%= studentId %>">

    <label for="weekday">选择星期几：</label>
    <select id="weekday" name="weekday">
        <% for (String weekDate : weekDates) { %>
        <option value="<%= weekDate %>"><%= weekDays[LocalDate.parse(weekDate, dateFormatter).getDayOfWeek().getValue() - 1] %></option>
        <% } %>
    </select>

    <label for="timeSlot">选择时间段：</label>
    <select id="timeSlot" name="timeSlot">
        <option value="morning">上午</option>
        <option value="afternoon">下午</option>
        <option value="evening">晚上</option>
    </select>

    <label for="place">选择地点：</label>
    <select id="place" name="place">
        <option value="classroom" selected>教室</option>
        <option value="office">办公室</option>
        <option value="library">图书馆</option>
    </select>

    <button type="submit">提交</button>
</form>

<button class="center-button" onclick="window.location.href = 'homepages.jsp'">返回首页</button>

<script>
    var unavailableTimes = [];
    <% for (Schedule schedule : schedules) { %>
    unavailableTimes.push({
        date: '<%= new SimpleDateFormat("yyyy-MM-dd").format(schedule.getDate()) %>',
        timeSlot: '<%= schedule.getTimeSlot() %>'
    });
    <% } %>;

    function checkAvailability() {
        var weekday = document.getElementById("weekday").value;
        var timeSlot = document.getElementById("timeSlot").value;

        for (var i = 0; i < unavailableTimes.length; i++) {
            var schedule = unavailableTimes[i];
            if (schedule.date === weekday && schedule.timeSlot === timeSlot) {
                alert("预约成功");
                return true; // 找到匹配的时间段，可以预约
            }
        }

        alert("该时间段不可预约");
        return false; // 没有找到匹配的时间段，不可预约
    }

</script>
</body>
</html>
