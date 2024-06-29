package com.example.myservlet;

import com.example.db.DBUtil;
import com.example.entity.User;
import com.example.dao.UsersDao;
import com.example.dao.impl.UsersDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/CheckEmailServlet")
public class CheckEmailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UsersDao usersDao;

    @Override
    public void init() throws ServletException {
        super.init();
        usersDao = new UsersDaoImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/plain; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        String username = request.getParameter("username");
        PrintWriter out = response.getWriter();
        response.setContentType("text/plain");

        boolean emailExists = checkEmailExists(email);
        boolean usernameExists = checkUsernameExists(username);

        if (emailExists) {
            out.print("emailExists");
        } else if (usernameExists) {
            out.print("usernameExists");
        } else {
            out.print("notExists");
        }
    }

    private boolean checkEmailExists(String email) {
        String studentQuery = "SELECT COUNT(*) FROM students WHERE email = ?";
        String teacherQuery = "SELECT COUNT(*) FROM teachers WHERE email = ?";

        int studentCount = DBUtil.querySingleValue(studentQuery, email);
        int teacherCount = DBUtil.querySingleValue(teacherQuery, email);

        return studentCount > 0 || teacherCount > 0;
    }

    private boolean checkUsernameExists(String username) {
        User user = usersDao.getUserByUsername(username);
        return user != null;
    }
}
