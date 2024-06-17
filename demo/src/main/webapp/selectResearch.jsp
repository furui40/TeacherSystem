<%@ page import="com.example.entity.Research" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.dao.impl.ResearchDaoImpl" %>
<%@ include file="checklogin.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>成果展示管理</title>
    <link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
<h1>成果展示管理</h1>
<table>
    <tr>
        <th>项目序号</th>
        <th>项目名称</th>
        <th>项目描述</th>
        <th>修改</th>
        <th>删除</th>
    </tr>
    <%-- 从数据库获取项目数据，并遍历展示 --%>
    <%
        // 获取完整的查询字符串
        String queryString = request.getQueryString();
        String uid = null;
        if (queryString != null) {
            String parameterName = "uid=";
            int index = queryString.indexOf(parameterName);

            if (index != -1) {
                index += parameterName.length();
                int endIndex = queryString.indexOf("&", index);
                uid = (endIndex != -1) ? queryString.substring(index, endIndex) : queryString.substring(index);
            }
        }


    %>
    <%
        int uuid = Integer.parseInt(uid);
        ResearchDaoImpl ResearchDao = new ResearchDaoImpl();
        // 假设从数据库获取到的项目数据存储在一个List中，每个项目是一个Research对象
        List<Research> researchList = ResearchDao.getResearchByTeacherId(uuid); // 从数据库获取所有项目数据

        // 遍历项目列表，展示每个项目的信息
        for (int i = 0; i < researchList.size(); i++) {
            Research research = researchList.get(i);
    %>
    <tr>
        <td><%= i + 1 %></td>
        <td><%= research.getTitle() %></td>
        <td><%= research.getDescription() %></td>
        <td><a href="modifyResearch.jsp?id=<%= research.getResearchID() %>">修改</a></td>
        <td>
            <form action="ResearchServlet" method="post">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" value="<%= research.getResearchID() %>">
                <input type="submit" value="删除">
            </form>
        </td>
    </tr>
    <%
        }
    %>
</table>

<button class="center-button" onclick="window.location.href = 'addResearch.jsp'">新增项目</button>
<div><button class="center-button" onclick="window.location.href = 'homepaget.jsp'">返回主页</button></div>
</body>
</html>