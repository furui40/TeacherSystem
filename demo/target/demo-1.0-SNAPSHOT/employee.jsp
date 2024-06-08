<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="employeeDao" class="com.example.dao.impl.EmployeeDaoImpl" scope="session" />
<%@ include file="checklogin.jsp"%>
<%@ page import="java.util.List"%>
<%@ page import="com.example.entity.Employee" %>
<%@ page import="java.sql.SQLException" %>
<html>
<head>
    <title>Employee Manager</title>
    <style>
        /* 添加自定义 CSS 样式规则 */
        body {
            font-family: Arial, sans-serif;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        a {
            text-decoration: none;
            color: #007bff;
        }
        a:hover {
            text-decoration: underline;
        }
        .button-container {
            margin-top: 10px;
            white-space: nowrap; /* 设置不换行 */
        }
        .button-container .button-link a {
            display: inline-block;
            margin-right: 10px;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            text-align: center;
            text-decoration: none;
        }
        .button-container .button-link a:hover {
            background-color: #0056b3;
        }
        .add-employee-container {
            display: inline-block;
            white-space: nowrap; /* 设置不换行 */
        }
        .add-employee-container a {
            display: block;
            margin-bottom: 10px;
            padding: 10px;
            background-color: #ff6600;
            color: #fff;
            text-align: center;
            text-decoration: none;
        }
        .add-employee-container a:hover {
            background-color: #cc5500;
        }
    </style>
</head>
<body>
<div class="add-employee-container">
    <a href="addEmployee.jsp">Add Employee</a>
</div>

<div class="button-container">
    <div class="button-link"><a href="depart_emp.jsp?depart=研发部">研发部</a>
        <a href="depart_emp.jsp?depart=会计部">会计部</a>
        <a href="depart_emp.jsp?depart=打工部">打工部</a>
        <a href="depart_emp.jsp?depart=财务部">财务部</a>
        <a href="depart_emp.jsp?depart=人力部">人力部</a>
        <a href="depart_emp.jsp?depart=资源部">资源部</a>
    </div>
    <div class="button-link"><a href="salary.jsp">查看平均工资超额情况</a></div>
    <div class="button-link"><a href="selcetDepartment.jsp">查看部门所需装备</a></div>
</div>

<table>
    <tr>
        <th>Name</th>
        <th>ESSN</th>
        <th>Address</th>
        <th>Salary</th>
        <th>Superssn</th>
        <th>Dno</th>
        <th>Action</th>
    </tr>
    <%
        List<Employee> employees = null;
        try {
            employees = employeeDao.getAll("select * from employee");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        String name = null;
        String essn = null;
        String address = null;
        Integer salary = null;
        String superssn = null;
        Integer dno = null;
        for (Employee emp : employees) {
            name = emp.getName();
            essn = emp.getEssn();
            address = emp.getAddress();
            salary = emp.getSalary();
            superssn = emp.getSuperssn();
            dno = emp.getDno();
    %>
    <tr>
        <td><%=name%></td>
        <td><%=essn%></td>
        <td><%=address%></td>
        <td><%=salary%></td>
        <td><%=superssn%></td>
        <td><%=dno%></td>
        <td>
            <a href="modifyEmployee.jsp?essn=<%=essn%>" class="action-link">Edit</a>
            <a onclick="return confirm('Sure to delete?')" href="EmployeeServlet?action=remove&essn=<%=essn%>" class="action-link">Delete</a>
        </td>
    </tr>
    <%
        }
    %>

</table>
<div class="add-employee-container">
    <a href="addResearch.jsp">Add Employee and Department</a>
</div>
</body>
</html>
