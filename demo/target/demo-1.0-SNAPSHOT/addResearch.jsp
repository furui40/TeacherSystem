<%@ include file="checklogin.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>增添展示信息</title>
  <link rel="stylesheet" type="text/css" href="css/login.css">
  <link rel="stylesheet" type="text/css" href="css/sidebar.css">
</head>
<script>
  function ajaxData(){
    var isValid = 1;
    var title = document.forms["addForm"]["title"].value;
    var description = document.forms["addForm"]["description"].value;
    var date = document.forms["addForm"]["date"].value;

    if (title == "") {
      alert("请输入名称");
      isValid = 0;
    } else if (description == "") {
      alert("请输入描述");
      isValid = 0;
    } else if (date == "") {
      alert("请选择日期");
      isValid = 0;
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
  <form name="addForm" id="add-form" method="post" action="ResearchServlet">
    <input type="hidden" name="action" value="add"/>
    <table>
      <tr>
        <th>名称:</th>
        <td><input type="text" name="title" id="newTitle"></td>
      </tr>
      <tr>
        <th>描述:</th>
        <td><input type="text" name="description" id="newDescription"></td>
      </tr>
      <tr>
        <th>获得/完成日期:</th>
        <td><input type="date" name="date" id="newDate"></td>
      </tr>
      <tr>
        <td colspan="2">
          <button type="submit" id="submit-form" onclick="ajaxData()">提交</button>
        </td>
      </tr>
    </table>
  </form>
</div>
<%int tid = (int) session.getAttribute("tid");%>
<div class="sidebar">
  <h2>欢迎访问</h2>
  <h2>教师信息管理系统</h2>
  <button class="sideButton" onclick="window.location.href = 'homepaget.jsp'">返回主页</button>
  <button class="sideButton"  onclick="window.location.href = 'modifyTeacher.jsp?tid=<%=tid%>'">编辑教师基本信息</button>
  <button class="sideButton"  onclick="window.location.href = 'selectResearch.jsp?uid=<%=tid%>'">修改个人成果展示</button>
  <button class="sideButton"  onclick="window.location.href = 'teacherSetSchedule.jsp?uid=<%=tid%>'">设置个人日程</button>
  <button class="sideButton"  onclick="window.location.href = 'teacherAppointmentShow.jsp?uid=<%=tid%>'">查看预约情况</button>
  <button class="sideButton"  onclick="window.location.href = 'login.jsp'">退出登录</button>
</div>
<div><button class="center-button" onclick="window.location.href = 'homepaget.jsp'">返回主页</button></div>
</body>
</html>
