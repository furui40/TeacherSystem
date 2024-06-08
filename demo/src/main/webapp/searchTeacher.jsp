<%@ page import="com.example.entity.Teacher" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>教师信息检索</title>
  <link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
<h1>教师信息检索</h1>
<div class="form-wrapper">
  <form class="search-form" action="TeacherSearchServlet" method="GET">
    <label class="form-label" for="keyword">请输入关键词：</label>
    <input class="form-input" type="text" id="keyword" name="keyword" required>
    <input class="form-submit" type="submit" value="查找">
  </form>
</div>

<%-- 搜索结果显示部分 --%>
<% if (request.getAttribute("teachers") != null) { %>
<h2>搜索结果：</h2>
<table>
  <tr>
    <th>序号</th>
    <th>姓名</th>
    <th>专业</th>
    <th>简介</th>
    <th>主页</th>
  </tr>
  <% List<Teacher> teachers = (List<Teacher>) request.getAttribute("teachers"); %>
  <% for (int i = 0; i < teachers.size(); i++) { %>
  <tr>
    <td><%= i + 1 %></td>
    <td><%= teachers.get(i).getName() %></td>
    <td><%= teachers.get(i).getProfession() %></td>
    <td><%= teachers.get(i).getBio() %></td>
    <td><a href="InfoTeacher.jsp?uid=<%= teachers.get(i).getTeacherID() %>">主页</a></td>
  </tr>
  <% } %>
</table>
<% } else { %>
<p>没有搜索到符合条件的教师信息。</p>
<% } %>

<div><button class="center-button" onclick="window.location.href = 'homepages.jsp'">返回主页</button></div>
</body>
</html>



<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--  <title>教师信息检索</title>--%>
<%--  <link rel="stylesheet" type="text/css" href="css/login.css">--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1>教师信息检索</h1>--%>
<%--<div class="form-wrapper">--%>
<%--  <form class="search-form" action="TeacherServlet" method="GET">--%>
<%--    <label class="form-label" for="keyword">请输入关键词：</label>--%>
<%--    <input class="form-input" type="text" id="keyword" name="keyword" required>--%>
<%--    <input class="form-submit" type="submit" value="查找">--%>
<%--  </form>--%>
<%--</div>--%>

<%--&lt;%&ndash; 搜索结果显示部分 &ndash;%&gt;--%>
<%--&lt;%&ndash;<% if (request.getAttribute("teachers") != null) { %>&ndash;%&gt;--%>
<%--<h2>搜索结果：</h2>--%>
<%--<table>--%>
<%--  <tr>--%>
<%--    <th>序号</th>--%>
<%--    <th>姓名</th>--%>
<%--    <th>专业</th>--%>
<%--    <th>简介</th>--%>
<%--    <th>主页</th>--%>
<%--  </tr>--%>
<%--  <tr><td>1</td>--%>
<%--    <td>1</td>--%>
<%--    <td>1</td>--%>
<%--    <td>1</td>--%>
<%--    <td>1</td>--%>
<%--  </tr>--%>
<%--  <tr>--%>
<%--    <td>2</td>--%>
<%--    <td>2</td>--%>
<%--    <td>2</td>--%>
<%--    <td>2</td>--%>
<%--    <td>2</td>--%>
<%--  </tr>--%>
<%--  <tr>--%>
<%--    <td>3</td>--%>
<%--    <td>3</td>--%>
<%--    <td>3</td>--%>
<%--    <td>3</td>--%>
<%--    <td>3</td>--%>
<%--</tr>--%>
<%--&lt;%&ndash;  <% List<Teacher> teachers = (List<Teacher>) request.getAttribute("teachers"); %>&ndash;%&gt;--%>
<%--&lt;%&ndash;  <% for (int i = 0; i < teachers.size(); i++) { %>&ndash;%&gt;--%>
<%--&lt;%&ndash;  <tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <td><%= i + 1 %></td>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <td><%= teachers.get(i).getName() %></td>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <td><%= teachers.get(i).getProfession() %></td>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <td><%= teachers.get(i).getIntro() %></td>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <td><a href="<%= teachers.get(i).getHomepage() %>">主页</a></td>&ndash;%&gt;--%>
<%--&lt;%&ndash;  </tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;  <% } %>&ndash;%&gt;--%>
<%--</table>--%>
<%--&lt;%&ndash;<% } %>&ndash;%&gt;--%>
<%--<div><button class="center-button" onclick="window.location.href = 'homepages.jsp'">返回主页</button></div>--%>
<%--</body>--%>
<%--</html>--%>