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
            } else if (cookie.getName().equals("userType")) {
                userType = UserType.valueOf(cookie.getValue());
            }
        }
    }

    // If the user is not logged in, redirect to the login page
    if (username == null || userType == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Check the user type and redirect accordingly
    if (userType == UserType.Student) {
        // Allow access to student-specific pages
        if (request.getRequestURI().endsWith("homepages.jsp") || request.getRequestURI().endsWith("student-page.jsp")) {
            // Proceed to the requested page
        } else {
            // Redirect to the student home page
            response.sendRedirect("homepages.jsp");
        }
    } else if (userType == UserType.Teacher) {
        // Allow access to teacher-specific pages
        if (request.getRequestURI().endsWith("homepaget.jsp") || request.getRequestURI().endsWith("teacher-page.jsp")) {
            // Proceed to the requested page
        } else {
            // Redirect to the teacher home page
            response.sendRedirect("homepaget.jsp");
        }
    } else {
        // Handle other user types, if any
        response.sendRedirect("login.jsp");
    }
%>