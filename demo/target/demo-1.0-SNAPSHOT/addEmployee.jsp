<%-- Created by IntelliJ IDEA. User: lenovo Date: 2023/3/28 Time: 23:23 To change this template use File | Settings | File Templates. --%>
<%@ page import="com.example.entity.Employee" contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="studentDao" class="com.example.dao.impl.EmployeeDaoImpl" scope="session"/>
<meta charset="UTF-8">
<html>
<head>
    <title>增添信息</title>
    <style>
        /* 添加自定义 CSS 样式规则 */
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
        }
        th {
            background-color: #007bff;
            color: #fff;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:nth-child(odd) {
            background-color: #fff;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<script>
    function ajaxData(){
        var isValid=1;
        var name = document.forms["loginForm"]["name"].value;
        var essn = document.forms["loginForm"]["essn"].value;
        var address = document.forms["loginForm"]["address"].value;
        var salary = document.forms["loginForm"]["salary"].value;
        var superssn = document.forms["loginForm"]["superssn"].value;
        var dno = document.forms["loginForm"]["dno"].value;

        if (name == "") {
            alert("please input name");
            isValid=0;
        } else if (essn == ""| isNaN(essn)) {
            alert("please input essn again");
            isValid=0;
        } else if (address == "") {
            alert("please input address");
            isValid=0;
        } else if (salary == "" | isNaN(salary)) {
            alert("please input salary again");
            isValid=0;
        } else if (superssn == "") {
            alert("please input superssn");
            isValid=0;
        } else if (dno == "" | isNaN(dno)) {
            alert("please input dno again");
            isValid=0;
        }

        if (!isValid) {
            event.preventDefault();
        }
    }
</script>
<body>
<div class="container">
    <h1>增添信息</h1>
    <div id="employeeTable"></div>
    <form name="loginForm" id="register-form" method="post" action="EmployeeServlet">
        <input type="hidden" name="action" value="add"/>
        <table>
            <tr>
                <th>name:</th>
                <td><input type="text" name="name" id="newname"></td>
            </tr>
            <tr>
                <th>essn:</th>
                <td><input type="text" name="essn" id="newessn"></td>
            </tr>
            <tr>
                <th>address:</th>
                <td><input type="text" name="address" id="newaddress"></td>
            </tr>
            <tr>
                <th>salary:</th>
                <td><input type="text" name="salary" id="newsalary"></td>
            </tr>
            <tr>
                <th>superssn:</th>
                <td><input type="text" name="superssn" id="newsuperssn"></td>
            </tr>
            <tr>
                <th>dno:</th>
                <td><input type="text" name="dno" id="newdno"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <button type="submit" id="submit-form" onclick="ajaxData()">提交</button>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
