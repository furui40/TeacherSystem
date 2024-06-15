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
<%@ page import="java.time.temporal.TemporalAdjusters" %>
<%@ page import="java.time.format.TextStyle" %>
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
    String[] weekDates = new String[7];
    String[] weekDays = new String[7];
    LocalDate currentDay = monday;
    for (int i = 0; i < 7; i++) {
        weekDates[i] = currentDay.format(dateFormatter);
        weekDays[i] = currentDay.getDayOfWeek().toString();
        currentDay = currentDay.plusDays(1);
    }

    // 获取预约信息
    ScheduleDao scheduleDao = new ScheduleDaoImpl();
    List<Schedule> schedules = scheduleDao.getScheduleByTeacherId(teacherId);


    Cookie[] cookies = request.getCookies(); // 获取所有的Cookie
    String username = null;
    int userId = -1; // 初始化为-1，表示未找到有效的用户ID

// 遍历Cookie数组，查找名为 "username" 和 "id" 的Cookie
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("id")) {
                userId = Integer.parseInt(cookie.getValue());
            }
        }
    }

    int studentId = -1; // 初始化为-1，表示未找到有效的StudentID
    if (userId != -1) {
        // 使用StudentDao查找Student对象
        StudentDao studentDao = new StudentDaoImpl(); // 假设这里是你的StudentDao实现类
        studentId = studentDao.getStudentIdByUserId(userId);

    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>预约查询</title>
    <link rel="stylesheet" type="text/css" href="css/appointment.css">
</head>
<body>
<h1>预约查询</h1>
<table border="1">
    <tr>
        <th>时间段</th>
        <% for (int i = 0; i < 7; i++) { %>
        <th><%= weekDates[i] %><br><%= weekDays[i] %></th>
        <% } %>
    </tr>
    <% String[] timeSlots = {"morning", "afternoon", "evening"}; %>
    <% for (String timeSlot : timeSlots) { %>
    <tr>
        <td><%= timeSlot %></td>
        <% for (int i = 0; i < 7; i++) {
            String date = weekDates[i];

            boolean canBook = true;
            for (Schedule schedule : schedules) {
                Date date2 = schedule.getDate();
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                String formattedDate = formatter.format(date2);
                if (formattedDate.equals(date) && schedule.getTimeSlot().equals(timeSlot)) {
                    canBook = false;
                    break;
                }
            }
        %>
        <td><%= canBook ? "可预约" : "不可预约" %></td>
        <% } %>
    </tr>
    <% } %>
</table>
<form method="post" action="AppointmentServlet">
    <input type="hidden" name="teacherId" value="<%= teacherId %>">
    <input type="hidden" name="studentId" value="<%= studentId %>">

    <label for="weekday">选择星期几：</label>
    <select id="weekday" name="weekday">
        <% DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate currentDate2 = LocalDate.now();
            boolean firstOption = true; // 标记第一个选项
            for (DayOfWeek dayOfWeek : DayOfWeek.values()) {
                if (dayOfWeek != DayOfWeek.SUNDAY) { // 不包括星期日
                    LocalDate date = currentDate2.with(TemporalAdjusters.nextOrSame(dayOfWeek));
                    String formattedDate = date.format(formatter);
        %>
        <option value="<%= formattedDate %>" <%= firstOption ? "selected" : "" %>><%= dayOfWeek.getDisplayName(TextStyle.FULL, Locale.CHINA) %></option>
        <%       firstOption = false; // 仅第一个选项标记为 selected
        }
        }
        %>
    </select>

    <label for="timeSlot">选择时间段：</label>
    <select id="timeSlot" name="timeSlot">
        <option value="morning" selected>上午</option>
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
</body>
</html>
