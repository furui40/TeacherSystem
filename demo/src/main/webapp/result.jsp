<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Display Teacher URLs</title>
</head>
<body>
<h1>教师详细页面 URL 列表</h1>
<ul>
    <%
        try {
            // Step 1: 获取所有 deptId
            String deptIdsUrl = "http://homepage.hit.edu.cn/sysBrowseShow/executeBrowseAllOfSchoolDepart.do";
            List<String> deptIds = com.example.myservlet.SupervisorServlet.getDeptIds(deptIdsUrl);

            // Step 2: 对每个 deptId 发送请求并保存用户信息
            for (String deptId : deptIds) {
                List<String> userInfoList = com.example.myservlet.SupervisorServlet.getUserInfoByDeptId(deptId);
                for (String userInfo : userInfoList) {
                    String userDetail = com.example.myservlet.SupervisorServlet.getUserDetail(userInfo);
                    String teacherDetailUrl = com.example.myservlet.SupervisorServlet.extractTeacherDetailUrl(userDetail);

                    // 输出调试信息
                    out.println("<li>教师详细页面 URL: " + teacherDetailUrl + "</li>");
                }
            }
        } catch (Exception e) {
            out.println("<li>Error retrieving data: " + e.getMessage() + "</li>");
            e.printStackTrace(new java.io.PrintWriter(out));
        }
    %>
</ul>
</body>
</html>
