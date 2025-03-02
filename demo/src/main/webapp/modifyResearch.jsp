<%@ page import="com.example.dao.impl.ResearchDaoImpl" %>
<%@ page import="com.example.entity.Research" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>修改展示信息</title>
  <link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
<h1>修改信息</h1>
<%
  // 获取id
  String queryString = request.getQueryString();
  String id = null;
  if (queryString != null) {
    String parameterName = "id=";
    int index = queryString.indexOf(parameterName);

    if (index != -1) {
      index += parameterName.length();
      int endIndex = queryString.indexOf("&", index);
      id = (endIndex != -1) ? queryString.substring(index, endIndex) : queryString.substring(index);
    }
  }
  ResearchDaoImpl researchDao = new ResearchDaoImpl();
  int uid = Integer.parseInt(id);
  Research research = researchDao.getResearchById(uid);
  String Title = research.getTitle();
  String Description = research.getDescription();
  Date DATA = research.getDate();
%>
<table>
  <form name="addForm" id="add-form" method="post" action="ResearchServlet">
    <input type="hidden" name="action" value="update"/>
    <input type="hidden" name="id" value="<%=id%>">
      <tr>
        <th>名称:</th>
        <td><input type="text" name="title" id="newTitle" required value="<%= Title %>"></td>
      </tr>
      <tr>
        <th>描述:</th>
        <td><input type="text" name="description" id="newDescription" required value="<%= Description %>"></td>
      </tr>
      <tr>
        <th>获得/完成日期:</th>
        <td><input type="date" name="date" id="newDate" required value="<%= DATA %>"></td>
      </tr>
      <tr>
        <td colspan="2">
          <button type="submit" >提交</button>
        </td>
      </tr>
  </form>
</table>
<div><button class="center-button" onclick="window.location.href = 'homepaget.jsp'">返回主页</button></div>
</body>
</html>
