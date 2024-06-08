<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <h1>欢迎来到教师信息管理系统</h1>
    <title>注册</title>
    <link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
<table>
    <form action="UserServlet" method="post">
        <tr>
            <th colspan="2">注册</th>
        </tr>
        <tr>
            <td>用户名:</td>
            <td><input type="text" name="uid" id="uid"/></td>
        </tr>
        <tr>
            <td>密码:</td>
            <td><input type="password" name="pwd" id="pwd"/></td>
        </tr>
        <tr>
            <td>身份:</td>
            <td>
                <input type="radio" name="role" id="teacher" value="teacher">
                <label for="teacher">教师</label>
                <input type="radio" name="role" id="student" value="student">
                <label for="student">学生</label>
            </td>
        </tr>
        <tr>
            <td colspan="2"><button type="submit" value="submit">注册</button></td>
        </tr>
    </form>
</table>
<div><button class="center-button" onclick="window.location.href = 'login.jsp'">返回登录页</button></div>
</body>

</html>