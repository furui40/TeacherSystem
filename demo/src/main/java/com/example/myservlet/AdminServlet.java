package com.example.myservlet;

import com.example.dao.impl.AdminDaoImpl;
import com.example.entity.Admin;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AdminServlet", value = "/AdminServlet")
public class AdminServlet extends HelloServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        AdminDaoImpl adminDao = new AdminDaoImpl();

        if (action.equals("modify")) {
            String sid = request.getParameter("sid");
            String spwd = request.getParameter("spwd");

            try {
                adminDao.modify(new Admin(sid, spwd));
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }

        }
        response.sendRedirect("manger.jsp");
    }
}
