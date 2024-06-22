package com.example.myservlet;

import com.example.dao.UsersDao;
import com.example.dao.impl.ScheduleDaoImpl;
import com.example.dao.impl.StudentDaoImpl;
import com.example.dao.impl.TeachersDaoImpl;
import com.example.dao.impl.UsersDaoImpl;
import com.example.entity.Student;
import com.example.entity.Teacher;
import com.example.entity.User;
import com.example.entity.UserType;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

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
            usernameCookie2.setMaxAge(3600); // 1 hour
            response.addCookie(usernameCookie);
            response.addCookie(usernameCookie2);
            HttpSession session = request.getSession();
            session.setAttribute("userType", user.getUserType());

            if (user.getUserType() == UserType.Teacher) {
                TeachersDaoImpl teachersDao = new TeachersDaoImpl();
                Teacher teacher = teachersDao.getTeacherByUserId(Integer.parseInt(userId));
                session.setAttribute("tid", teacher.getTeacherID());
                response.sendRedirect("homepaget.jsp");
            } else if (user.getUserType() == UserType.Student) {
                StudentDaoImpl studentDao = new StudentDaoImpl();
                int studentId = studentDao.getStudentIdByUserId(Integer.parseInt(userId));
                session.setAttribute("sid",studentId);
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




