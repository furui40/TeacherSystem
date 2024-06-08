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
        // ��ȡ������
        String username = request.getParameter("uid");
        String password = request.getParameter("pwd");
        String role = request.getParameter("role");

        // ���ݽ�ɫ�ַ���ȷ���û�����
        UserType userType = null;
        if ("teacher".equalsIgnoreCase(role)) {
            userType = UserType.Teacher;
        } else if ("student".equalsIgnoreCase(role)) {
            userType = UserType.Student;
        }

        // ����û�������Ч������ע��ҳ�沢��ʾ������Ϣ
        if (userType == null) {
            request.setAttribute("errorMessage", "��ѡ����Ч�����");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }

        // �����û����󲢱��浽���ݿ�
        User user = new User(username, password, userType);
        usersDao.saveUser(user);

        // ע��ɹ����ض��򵽵�¼ҳ��
        response.sendRedirect("login.jsp");
    }
}
