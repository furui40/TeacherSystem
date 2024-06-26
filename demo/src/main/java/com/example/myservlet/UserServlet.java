package com.example.myservlet;

import com.example.dao.TeachersDao;
import com.example.dao.UsersDao;
import com.example.dao.StudentDao;
import com.example.dao.impl.TeachersDaoImpl;
import com.example.dao.impl.UsersDaoImpl;
import com.example.dao.impl.StudentDaoImpl;
import com.example.entity.Teacher;
import com.example.entity.User;
import com.example.entity.Student;
import com.example.entity.UserType;
import com.example.utils.MailUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {

    private UsersDao usersDao;
    private StudentDao studentDao;

    private TeachersDao teachersDao;

    @Override
    public void init() throws ServletException {
        usersDao = new UsersDaoImpl();
        studentDao = new StudentDaoImpl();
        teachersDao = new TeachersDaoImpl();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        // 获取表单数据
        String username = request.getParameter("uid");
        String password = request.getParameter("pwd");
        String role = request.getParameter("role");

        // 根据角色字符串确定用户类型
        UserType userType = null;
        if ("teacher".equalsIgnoreCase(role)) {
            userType = UserType.Teacher;
        } else if ("student".equalsIgnoreCase(role)) {
            userType = UserType.Student;
        }

        // 如果用户类型无效，返回注册页面并显示错误信息
        if (userType == null) {
            request.setAttribute("errorMessage", "请选择有效的身份");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }

        // 创建用户对象并保存到数据库
        User user = new User(username, password, userType);
        int getUserID = usersDao.saveUser(user);

        // 如果用户类型是学生，保存学生信息到学生表
        if (userType == UserType.Student) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");

            // 创建学生对象并保存到数据库
            Student student = new Student();
            student.setUserId(getUserID);
            student.setName(name);
            student.setEmail(email);
            System.out.println(getUserID);
            studentDao.addStudent(student);

            String detail = username + "," + password + "," + name;
            MailUtil.sendEmail(email, detail, 0);
        }
        if (userType == UserType.Teacher) {
            Teacher teacher = new Teacher();
            teacher.setUserID(getUserID);
            teacher.setEmail("example@123");
            teacher.setBio("请输入简介内容");
            teacher.setProfession("计算机科学与技术");
            teacher.setName("请去设置个人信息，");
            teachersDao.saveTeacher(teacher);

        }
        // 注册成功，重定向到登录页面
        response.sendRedirect("login.jsp");
    }
}
