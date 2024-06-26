<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>注册</title>
    <link rel="stylesheet" type="text/css" href="css/login1.css">
    <script>
        function toggleStudentFields() {
            var studentRadio = document.getElementById('student');
            var studentFields = document.getElementById('studentFields');
            if (studentRadio.checked) {
                studentFields.style.display = 'table-row-group';
            } else {
                studentFields.style.display = 'none';
            }
        }

        function validateForm() {
            var username = document.getElementById('uid').value;
            var password = document.getElementById('pwd').value;
            var teacherRadio = document.getElementById('teacher').checked;
            var studentRadio = document.getElementById('student').checked;

            if (!username || !password || (!teacherRadio && !studentRadio)) {
                alert("所有字段都是必填的。");
                return false;
            }

            if (studentRadio) {
                var name = document.getElementById('name').value;
                var email = document.getElementById('email').value;
                if (!name || !email) {
                    alert("请填写学生的姓名和邮箱。");
                    return false;
                }

                var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!emailPattern.test(email)) {
                    alert("请输入有效的邮箱地址。");
                    return false;
                }

                // 检查邮箱是否已被注册
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "CheckEmailServlet", false); // 使用同步请求以确保在继续前检查完毕
                xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhr.send("email=" + encodeURIComponent(email));

                if (xhr.responseText === "exists") {
                    alert("邮箱已被注册。");
                    return false;
                }
            }

            return true;
        }
    </script>
</head>
<body>
<h1>欢迎来到教师信息管理系统</h1>
<table>
    <form action="UserServlet" method="post" onsubmit="return validateForm()">
        <tr>
            <th colspan="2">注册</th>
        </tr>
        <tr>
            <td>用户名:</td>
            <td><input type="text" name="uid" id="uid" required/></td>
        </tr>
        <tr>
            <td>密码:</td>
            <td><input type="password" name="pwd" id="pwd" required/></td>
        </tr>
        <tr>
            <td>身份:</td>
            <td>
                <input type="radio" name="role" id="teacher" value="teacher" onclick="toggleStudentFields()" required>
                <label for="teacher">教师</label>
                <input type="radio" name="role" id="student" value="student" onclick="toggleStudentFields()" required>
                <label for="student">学生</label>
            </td>
        </tr>
        <tbody id="studentFields" style="display:none;">
        <tr>
            <td>姓名:</td>
            <td><input type="text" name="name" id="name"/></td>
        </tr>
        <tr>
            <td>邮箱:</td>
            <td><input type="email" name="email" id="email"/></td>
        </tr>
        </tbody>
        <tr>
            <td colspan="2"><button type="submit" value="submit">注册</button></td>
        </tr>
    </form>
</table>
<div>
    <button class="center-button" onclick="window.location.href = 'login.jsp'">返回登录页</button>
</div>
</body>
</html>
