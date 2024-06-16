<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>新建成果</title>
    <link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
<h1>新建成果</h1>
<table>
    <form name="modifyForm" id="modify-form" action="ResearchServlet" method="POST">
        <input type="hidden" name="action" value="addy">
        <tr>
            <th>教师姓名:</th>
            <td><input type="text" name="teacherName" id="teacherName" required></td>
        </tr>
        <tr>
            <th>名称:</th>
            <td><input type="text" name="title" id="title" required></td>
        </tr>
        <tr>
            <th>描述:</th>
            <td><input type="text" name="description" id="description" required></td>
        </tr>
        <tr>
            <th>获得/完成日期:</th>
            <td><input type="date" name="date" id="date" required></td>
        </tr>
        <tr>
            <td colspan="2">
                <button type="submit">提交</button>
            </td>
        </tr>
    </form>
</table>
<div><button class="center-button" onclick="window.location.href = 'manageResearch.jsp'">返回</button></div>
</body>
</html>