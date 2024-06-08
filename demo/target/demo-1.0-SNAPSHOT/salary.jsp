<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.example.entity.DepartSalary" %>
<jsp:useBean id="selectorDao" class="com.example.dao.impl.SelectorDaoImpl" scope="session" />
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Salary</title>
  <style>
    body {
      font-family: 'Gothic', 'Lucida Sans', 'Trebuchet MS', 'Tahoma', sans-serif;
      background-color: rgba(59, 76, 72, 0.55);
      color: #fff;
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
      box-shadow: 0 0 10px rgba(255, 255, 255, 0.1);
      background-color: #2b2b2b;
      border-radius: 10px;
      overflow: hidden;
    }

    th, td {
      padding: 15px;
      text-align: left;
      border-bottom: 1px solid #444;
    }

    th {
      background-color: #1a1a1a;
      color: #ff4500;
    }

    tr:hover {
      background-color: #3a3a3a;
    }
  </style>
</head>
<body>

<table>
  <tr>
    <th>DNO</th>
    <th>Salary</th>
  </tr>
  <%
    List<DepartSalary> salaries = null;
    try {
      salaries = selectorDao.selectSalary("SELECT DNO, AVG(SALARY) AS AVERAGE_SALARY\n" +
              "FROM EMPLOYEE\n" +
              "GROUP BY DNO\n" +
              "HAVING AVG(SALARY) > 5000");
    } catch (SQLException throwables) {
      throwables.printStackTrace();
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
    }
    Integer dno = null;
    Integer salary = null;
    for (DepartSalary say : salaries) {
      dno = say.getDno();
      salary = say.getAverSalary();
  %>
  <tr>
    <td><%=dno%></td>
    <td><%=salary%></td>
  </tr>
  <%
    }
  %>
</table>
</body>
</html>
