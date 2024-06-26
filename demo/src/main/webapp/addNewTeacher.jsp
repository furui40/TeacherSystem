<%@ include file="checklogin.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>新建教师与用户账号</title>
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <link rel="stylesheet" type="text/css" href="css/sidebar.css">
    <script>
        function validateForm() {
            var username = document.getElementById('username').value;
            var password = document.getElementById('password').value;
            var name = document.getElementById('name').value;
            var email = document.getElementById('email').value;
            var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

            if (!username || !password || !name || !email) {
                alert("所有字段都是必填的。");
                return false;
            }

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

            return true;
        }
    </script>
</head>
<body>
<h1>新建教师与用户账号</h1>
<table>
    <form name="modifyForm" id="modify-form" action="TeacherServlet" method="POST" onsubmit="return validateForm()">
        <input type="hidden" name="action" value="add">
        <tr>
            <td>用户名:</td>
            <td><input type="text" id="username" name="username" required value="请填写用户名"></td>
        </tr>
        <tr>
            <td>密码:</td>
            <td><input type="password" id="password" name="password" required value="123456"></td>
        </tr>
        <tr>
            <td>姓名:</td>
            <td><input type="text" id="name" name="name" required value="请填写姓名"></td>
        </tr>
        <tr>
            <td>专业:</td>
            <td>
                <select id="profession" name="profession">
                    <option value="计算机科学与技术">计算机科学与技术</option>
                    <option value="电气工程">电气工程</option>
                    <option value="机械工程">机械工程</option>
                    <option value="控制科学与工程">控制科学与工程</option>
                    <option value="材料科学与工程">材料科学与工程</option>
                    <option value="物理学">物理学</option>
                    <option value="动力工程及工程热物理">动力工程及工程热物理</option>
                    <option value="核科学与技术">核科学与技术</option>
                    <option value="马克思主义理论">马克思主义理论</option>
                    <option value="哲学">哲学</option>
                    <option value="交通运输工程">交通运输工程</option>
                    <option value="土木工程">土木工程</option>
                    <option value="城乡规划学">城乡规划学</option>
                    <option value="建筑学">建筑学</option>
                    <option value="设计学">设计学</option>
                    <option value="风景园林学">风景园林学</option>
                    <option value="城市规划">城市规划</option>
                    <option value="体育学">体育学</option>
                    <option value="仪器科学与技术">仪器科学与技术</option>
                    <option value="统计学">统计学</option>
                    <option value="材料科学与工程,化学">材料科学与工程,化学</option>
                    <option value="生物医学工程">生物医学工程</option>
                    <option value="食品科学与工程">食品科学与工程</option>
                    <option value="生物学">生物学</option>
                    <option value="航空宇航科学与技术">航空宇航科学与技术</option>
                    <option value="社会学">社会学</option>
                    <option value="外国语言文学">外国语言文学</option>
                    <option value="应用经济学">应用经济学</option>
                    <option value="教育学">教育学</option>
                    <option value="翻译">翻译</option>
                    <option value="法学">法学</option>
                    <option value="力学">力学</option>
                    <option value="光学工程,电子科学与技术">光学工程,电子科学与技术</option>
                    <option value="光学工程">光学工程</option>
                    <option value="电子科学与技术">电子科学与技术</option>
                    <option value="信息与通信工程">信息与通信工程</option>
                    <option value="计算机科学与技术,软件工程">计算机科学与技术,软件工程</option>
                    <option value="网络空间安全">网络空间安全</option>
                    <option value="软件工程">软件工程</option>
                    <option value="环境科学与工程">环境科学与工程</option>
                    <option value="工程管理">工程管理</option>
                    <option value="化学">化学</option>
                    <option value="测试用专业">测试用专业</option>
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
<div class="sidebar">
    <h2>欢迎访问</h2>
    <h2>教师信息管理系统</h2>
    <button class="sideButton" onclick="window.location.href = 'homepageadmin.jsp'">返回主页</button>
    <button class="sideButton" onclick="window.location.href = 'manageTeacher.jsp'">教师信息管理</button>
    <button class="sideButton" onclick="window.location.href = 'manageResearch.jsp'">教师成果管理</button>
    <button class="sideButton" onclick="window.location.href = 'manageAppointment.jsp'">预约管理</button>
    <button class="sideButton" onclick="window.location.href = 'login.jsp'">退出登录</button>
</div>
<div><button class="center-button" onclick="window.location.href = 'manageTeacher.jsp'">返回</button></div>
</body>
</html>
