package com.example.myservlet;

import com.example.dao.TeachersDao;
import com.example.dao.impl.TeachersDaoImpl;
import com.example.entity.Teacher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/TeacherServlet")
public class TeacherServlet extends HttpServlet {
    private TeachersDao teachersDao;

    public void init() {
        teachersDao = new TeachersDaoImpl(); // 初始化DAO
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        Integer userId = null; // 在循环外部声明 userId

        // 获取cookie中的userId
        Cookie[] cookies = request.getCookies();

        // 遍历所有的Cookie
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("id")) {
                    userId = Integer.valueOf(cookie.getValue()); // 设置 userId 的值
                    // 在这里可以使用获取到的userId进行相应的操作
                    System.out.println("Useridname: " + userId);
                }
            }
        }


            Teacher teacher = teachersDao.getTeacherByUserId(userId);
            // 进行其他操作...
            Teacher teacher1 = new Teacher();
            teacher1.setUserID(userId);

        // 如果没有找到对应的teacher，则可以根据具体业务逻辑处理，这里简化为直接返回
        if (teacher == null) {
            String name = request.getParameter("name");
            String major = request.getParameter("profession");
            String email = request.getParameter("email");
            String bio = request.getParameter("bio");
            teacher1.setName(name);
            teacher1.setProfession(major);
            teacher1.setEmail(email);
            teacher1.setBio(bio);
            teachersDao.saveTeacher(teacher1); // 可以根据实际情况重定向到错误页面
            response.sendRedirect("homepaget.jsp");
            return;
        }

        // 获取表单参数
        String name = request.getParameter("name");
        String major = request.getParameter("profession");
        String email = request.getParameter("email");
        String bio = request.getParameter("bio");

        // 更新Teacher信息
        teacher.setName(name);
        teacher.setProfession(major);
        teacher.setEmail(email);
        teacher.setBio(bio);

        // 保存更新后的教师信息到数据库
        teachersDao.updateTeacher(teacher);

        // 重定向到成功页面或其他页面
        response.sendRedirect("homepaget.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 如果需要处理GET请求，可以在这里添加相应的逻辑
    }


}
