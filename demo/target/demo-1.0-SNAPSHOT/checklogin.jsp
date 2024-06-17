<%@ page import="com.example.entity.UserType" %>
<%
    // Check if the user is logged in
    String username = null;
    UserType userType = null;
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("username")) {
                username = cookie.getValue();
            }
        }
    }
    userType = (UserType) session.getAttribute("userType");

    if (userType != null) {
        System.out.println("userType: " + userType.toString());
    } else {
        System.out.println("userType is null");
    }

    // If the user is not logged in, redirect to the login page
    if (username == null || userType == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    if (request.getRequestURI() != null){
        System.out.println(request.getRequestURI());
    }
    String url = request.getRequestURI();
    String prefix = "/demo_war_exploded/";
    String url2 = url.substring(prefix.length());

    if (userType == UserType.Student) {
        if (url.endsWith("homepages.jsp") ||
            url.contains("InfoTeacher.jsp") ||
            url.contains("listTeacher.jsp") ||
            url.contains("recommendTeacher.jsp") ||
            url.contains("searchTeacher.jsp") ||
            url.contains("studentAppointment.jsp") ||
            url.contains("studentShowAppointment.jsp"))
        {
            System.out.println("have rights to" + url2);
        } else {
            System.out.println("not have rights to" + url2);
            response.sendRedirect("homepages.jsp");
        }
    } else if (userType == UserType.Teacher) {
        if (url.endsWith("homepaget.jsp") ||
            url.contains("addResearch.jsp") ||
            url.contains("modifyResearch.jsp") ||
            url.contains("modifyTeacher.jsp?uid=") ||
            url.contains("selectResearch.jsp") ||
            url.contains("teacherAppointmentShow.jsp") ||
            url.contains("teacherSetSchedule.jsp"))
        {
            System.out.println("have rights to" + url2);
        } else {
            System.out.println("not have rights to" + url2);
            response.sendRedirect("homepaget.jsp");
        }
    }else if (userType == UserType.Admin) {
        if (url.endsWith("homepageadmin.jsp") ||
            url.contains("addNewAppointment.jsp") ||
            url.contains("addNewResearch.jsp") ||
            url.contains("addNewTeacher.jsp") ||
            url.contains("modifyTeacher.jsp?admintid=") ||
            url.contains("manageAppointment.jsp") ||
            url.contains("manageResearch.jsp") ||
            url.contains("manageTeacher.jsp") ||
            url.contains("modifyResearchAdmin.jsp")
            )
        {
            System.out.println("have rights to" + url2);
        } else {
            System.out.println("not have rights to" + url2);
            response.sendRedirect("homepageadmin.jsp");
        }
    } else {
        response.sendRedirect("login.jsp");
    }
%>