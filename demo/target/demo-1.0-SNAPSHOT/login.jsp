<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <h1>欢迎来到教师信息管理系统</h1>
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
<table>
    <tr>
        <th colspan="2">登录</th>
    </tr>
    <form action="LoginServlet" method="post">
        <tr>
            <td>用户名:</td>
            <td><input type="text" name="uid" id="uid"/></td>
        </tr>
        <tr>
            <td>密码:</td>
            <td><input type="password" name="pwd" id="pwd"/></td>
        </tr>
        <tr>
            <td colspan="2"><button type="submit" value="submit">登录</button></td>
        </tr>
    </form>
</table>
<div><button class="center-button" onclick="window.location.href = 'register.jsp'">前往注册</button></div>
</body>
</html>

