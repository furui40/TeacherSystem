package com.example.myservlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "HelloServlet", value = "/HelloServlet")
public class HelloServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");

        String uid = req.getParameter("uid");

        HttpSession session = req.getSession();
        session.setAttribute("uid",uid);

        Cookie c = new Cookie("uid",uid);
        c.setMaxAge(60*60*24*7);
        resp.addCookie(c);
        resp.sendRedirect("index.jsp");

        //PrintWriter out = resp.getWriter();
        //out.print("{\"result\": 1 }");

    }
}
