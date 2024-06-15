<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>新建教师与用户账号</title>
    <link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
<h1>新建教师与用户账号</h1>
<table>
    <form name="modifyForm" id="modify-form" action="TeacherServlet" method="POST">
        <input type="hidden" name="action" value="add">
        <tr>
            <td>用户名:</td>
            <td><input type="text" id="username" name="username" required value="请填写用户名"></td>
        </tr>
        <tr>
            <td>密码:</td>
            <td><input type="text" id="password" name="password" required value="123456"></td>
        </tr>
        <tr>
            <td>姓名:</td>
            <td><input type="text" id="name" name="name" required value="请填写姓名"></td>
        </tr>
        <tr>
            <td>专业:</td>
            <td>
                <select id="profession" name="profession">
                    <option value="数学">数学</option>
                    <option value="英语">英语</option>
                    <option value="历史">历史</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>邮箱:</td>
            <td><input type="email" id="email" name="email" required value="123@邮箱"></td>
        </tr>
        <tr>
            <td>简介:</td>
            <td><textarea id="bio" name="bio" rows="4" required>请填写简介</textarea></td>
        </tr>
        <tr>
            <td colspan="2">
                <button type="submit">提交</button>
            </td>
        </tr>
    </form>
</table>
<div><button class="center-button" onclick="window.location.href = 'manageTeacher.jsp'">返回</button></div>
</body>
</html>