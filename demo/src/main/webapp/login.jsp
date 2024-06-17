<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
<h1>欢迎来到教师信息管理系统</h1>
<%-- 错误消息显示区域 --%>
<%
    String errorMessage = (String) request.getAttribute("errorMessage");
    if (errorMessage != null) {
        if(errorMessage.equals("Invalid username or password")){
            errorMessage = "密码错误";
        } else if (errorMessage.equals("Username does not exist. Please try again.")) {
            errorMessage = "用户名不存在";
        }
%>
<h2><div class="error-message"><%= errorMessage %></div></h2>
<%
    }
%>
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
