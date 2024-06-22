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

@WebServlet("/TeacherSearchServlet")
public class TeacherSearchServlet extends HttpServlet {
    private TeachersDao teachersDao;

    @Override
    public void init() throws ServletException {
        teachersDao = new TeachersDaoImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        List<Teacher> allTeachers = teachersDao.getAllTeachers();
        List<Teacher> matchedTeachers = new ArrayList<>();

        // 遍历所有教师，匹配关键词
        for (Teacher teacher : allTeachers) {
            if (teacher.getName().contains(keyword) ||
                    teacher.getEmail().contains(keyword) ||
                    teacher.getProfession().contains(keyword) ||
                    teacher.getBio().contains(keyword)) {
                matchedTeachers.add(teacher);
            }
        }

        request.setAttribute("teachers", matchedTeachers);

        String action = request.getParameter("action");
        if(action.equals("search")){
            request.getRequestDispatcher("searchTeacher.jsp").forward(request, response);
        }else if(action.equals("adminSearch")){
            request.getRequestDispatcher("manageTeacher.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
