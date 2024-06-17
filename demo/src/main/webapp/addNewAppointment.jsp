<%@ include file="checklogin.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>新增预约</title>
    <link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
<h1>新增预约</h1>
<div>
    <table>
    <form class="search-form" action="AppointmentAdminServlet" method="POST">
        <input type="hidden" name="action" value="addy">

        <tr>
            <th>教师姓名:</th>
            <td><input type="text" name="teacherName" id="teacherName" required></td>
        </tr>
        <tr>
            <th>学生姓名:</th>
            <td><input type="text" name="studentName" id="studentName" required></td>
        </tr>
        <tr>
            <th>选择日期:</th>
            <td><input type="date" id="date" name="date" required></td>
        </tr>
            <tr>
                <th>选择时间:</th>
                <th>
                    <select  id="timeSlot" name="timeSlot">
                        <option value="morning" selected>上午</option>
                        <option value="afternoon">下午</option>
                        <option value="evening">晚上</option>
                    </select>
                </th>
            </tr>
            <tr>
                <th>选择地点:</th>
                <th>
                    <select  id="place" name="place">
                        <option value="classroom" selected>教室</option>
                        <option value="office">办公室</option>
                        <option value="library">图书馆</option>
                    </select>
                </th>
            </tr>
            <tr>
            <td colspan="2">
                <button type="submit">提交</button>
            </td>
        </tr>
    </form>
    </table>
</div>
<div><button class="center-button" onclick="window.location.href = 'manageAppointment.jsp'">返回</button></div>
</body>
</html>