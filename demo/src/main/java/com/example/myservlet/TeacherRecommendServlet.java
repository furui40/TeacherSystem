package com.example.myservlet;

import com.example.dao.TeachersDao;
import com.example.dao.impl.TeachersDaoImpl;
import com.example.entity.Teacher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/TeacherRecommendServlet")
public class TeacherRecommendServlet extends HttpServlet {
    private TeachersDao teachersDao;

    @Override
    public void init() throws ServletException {
        teachersDao = new TeachersDaoImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String profession = request.getParameter("profession");
        List<Teacher> matchedTeachers = getTeachersByProfession(profession);

        request.setAttribute("teachers", matchedTeachers);
        request.getRequestDispatcher("recommendTeacher.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private List<Teacher> getTeachersByProfession(String profession) {
        List<Teacher> allTeachers = teachersDao.getAllTeachers();
        List<Teacher> matchedTeachers = new ArrayList<>();

        // 遍历所有教师，匹配专业
        for (Teacher teacher : allTeachers) {
            if (teacher.getProfession().equalsIgnoreCase(profession)) {
                matchedTeachers.add(teacher);
            }
        }

        return matchedTeachers;
    }
}
