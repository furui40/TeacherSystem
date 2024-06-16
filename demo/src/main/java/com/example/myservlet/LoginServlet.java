package com.example.myservlet;

import com.example.dao.UsersDao;
import com.example.dao.impl.LoginDaoImpl;
import com.example.dao.impl.UsersDaoImpl;
import com.example.entity.Admin;
import com.example.entity.User;
import com.example.entity.UserType;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.HttpCookie;
import java.sql.SQLException;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {

    private UsersDao usersDao;

    @Override
    public void init() throws ServletException {
        usersDao = new UsersDaoImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("uid");
        String password = request.getParameter("pwd");

        User user = usersDao.getUserByUsername(username);

        if (user != null && user.getPassword().equals(password)) {
            // Create a cookie for the username
            Integer id = user.getUserID();
            String userId = String.valueOf(id);
            Cookie usernameCookie = new Cookie("id", userId);
            Cookie usernameCookie2 = new Cookie("username", username);
            usernameCookie.setMaxAge(3600); // 1 hour
            response.addCookie(usernameCookie);
            response.addCookie(usernameCookie2);
            HttpSession session = request.getSession();
            session.setAttribute("userType", user.getUserType());

            if (user.getUserType() == UserType.Teacher) {
                response.sendRedirect("homepaget.jsp");
            } else if (user.getUserType() == UserType.Student) {
                response.sendRedirect("homepages.jsp");
            } else if(user.getUserType() == UserType.Admin){
                response.sendRedirect("homepageadmin.jsp");
            }
        } else {
            // Set an error message and forward back to the login page
            request.setAttribute("errorMessage", "Invalid username or password");

            if (user == null) {
                request.setAttribute("errorMessage", "Username does not exist. Please try again.");
            }

            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}




