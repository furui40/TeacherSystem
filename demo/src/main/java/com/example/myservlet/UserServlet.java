package com.example.myservlet;

import com.example.dao.UsersDao;
import com.example.dao.impl.UsersDaoImpl;
import com.example.entity.User;
import com.example.entity.UserType;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {

    private UsersDao usersDao;

    @Override
    public void init() throws ServletException {
        usersDao = new UsersDaoImpl();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
        usersDao.saveUser(user);

        // 注册成功，重定向到登录页面
        response.sendRedirect("login.jsp");
    }
}
