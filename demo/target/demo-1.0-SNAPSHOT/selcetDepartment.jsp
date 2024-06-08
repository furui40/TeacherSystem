<%@ page import="com.example.entity.Employee" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.entity.Department" %>
<jsp:useBean id="selectorDao" class="com.example.dao.impl.SelectorDaoImpl" scope="session" />
<%@ include file="checklogin.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Depart</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #d9c7b3;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        table {
            width: 80%;
            border-collapse: collapse;
            margin: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: #fff;
        }

        tr:hover {
            background-color: #f5f5f5;
        }
    </style>
</head>
<body>
<table>
    <tr>
        <th>Dname</th>
        <th>MGRSSN</th>
        <th>EQUIPMENT</th>
    </tr>
    <%
        List<Department> departments = null;
        try {
            departments = selectorDao.selectAll("select DNAME, MGRSSN, EQUIPMENT \n" +
                    "from DEPARTMENT join EQUIPMENT on DEPARTMENT.DNO = EQUIPMENT.DNO");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        String dname = null;
        String mgrssn = null;
        String equipment = null;

        for (Department depart : departments) {
            dname = depart.getDname();
            mgrssn = depart.getMgrssn();
            equipment = depart.getEquipment();

    %>
    <tr>
        <td><%=dname%></td>
        <td><%=mgrssn%></td>
        <td><%=equipment%></td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>
