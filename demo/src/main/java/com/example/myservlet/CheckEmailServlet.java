package com.example.myservlet;
import com.example.db.DBUtil;
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

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        PrintWriter out = response.getWriter();
        response.setContentType("text/plain");

        boolean emailExists = checkEmailExists(email);
        if (emailExists) {
            out.print("exists");
        } else {
            out.print("not exists");
        }
    }

    private boolean checkEmailExists(String email) {
        String studentQuery = "SELECT COUNT(*) FROM students WHERE email = ?";
        String teacherQuery = "SELECT COUNT(*) FROM teachers WHERE email = ?";

        int studentCount = DBUtil.querySingleValue(studentQuery, email);
        int teacherCount = DBUtil.querySingleValue(teacherQuery, email);

        return studentCount > 0 || teacherCount > 0;
    }
}
