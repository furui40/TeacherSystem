package com.example.myservlet;

import com.example.dao.impl.EmployeeDaoImpl;
import com.example.entity.Employee;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

@WebServlet(name = "EmployeeServlet", value = "/EmployeeServlet")
public class EmployeeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        EmployeeDaoImpl studentDao = new EmployeeDaoImpl();
        if(action.equals("add")){
            String name = request.getParameter("name");
            String essn = request.getParameter("essn");
            String address = request.getParameter("address");
            String salary0 = request.getParameter("salary");
            String superssn =request.getParameter("superssn");
            String dno0 = request.getParameter("dno");

            Integer salary = Integer.valueOf(salary0);
            Integer dno = Integer.valueOf(dno0);


            try {
                Employee employee = studentDao.getById(essn);
                if(employee.getEssn() != null){
                    String errorMessage = "essn is repeated";
                    request.setAttribute("errorMessage", errorMessage);
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }else {
                    studentDao.add(new Employee(name, essn, address, salary, superssn, dno));
                    response.sendRedirect("employee.jsp");
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }

        }else if(action.equals("modify")){
            String name = request.getParameter("name");
            String essn = request.getParameter("essn");
            String address = request.getParameter("address");
            String salary0 = request.getParameter("salary");
            String superssn =request.getParameter("superssn");
            String dno0 = request.getParameter("dno");

            Integer salary = Integer.valueOf(salary0);
            Integer dno = Integer.valueOf(dno0);
            try {
                studentDao.modify(new Employee(name,essn,address,salary,superssn,dno));
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            response.sendRedirect("employee.jsp");
        }else if(action.equals("remove")){
            String essn = request.getParameter("essn");
            try {
                studentDao.remove(essn);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            response.sendRedirect("employee.jsp");
        }

    }
}
