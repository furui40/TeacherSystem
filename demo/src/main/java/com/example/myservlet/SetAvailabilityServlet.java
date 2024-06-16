package com.example.myservlet;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.example.dao.ScheduleDao;
import com.example.dao.impl.ScheduleDaoImpl;
import com.example.entity.Schedule;

@WebServlet("/SetAvailabilityServlet")
public class SetAvailabilityServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ScheduleDao scheduleDao;

    public void init() throws ServletException {
        super.init();
        scheduleDao = new ScheduleDaoImpl(); // ³õÊ¼»¯ DAO ÊµÀý
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response){
            
    }
}
