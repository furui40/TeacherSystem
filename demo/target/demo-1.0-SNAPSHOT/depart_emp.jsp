<%@ page import="com.example.entity.Employee" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>
<meta charset="UTF-8">
<jsp:useBean id="selectorDao" class="com.example.dao.impl.SelectorDaoImpl" scope="session" />
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <%
    String depart2 = request.getParameter("depart");
  %>
  <h1><%=depart2%></h1>
  <style>
    body {
      font-family: 'Roboto', 'Arial', sans-serif;
      background-color: #d7c282;
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
      background-color: #212121;
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
      color: #2196f3;
      font-size: 18px;
    }

    tr:hover {
      background-color: #3a3a3a;
    }
  </style>
</head>
<body>

<table>
  <tr>
    <th>Name</th>
  </tr>
  <%
    String depart = request.getParameter("depart");
    List<String> names = null;
    try {
      names = selectorDao.selectGroup(depart);
    } catch (SQLException throwables) {
      throwables.printStackTrace();
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
    }

    for (String name : names) {

  %>
  <tr>
    <td><%=name%></td>
  </tr>
  <%
    }
  %>
</table>
</body>
</html>
