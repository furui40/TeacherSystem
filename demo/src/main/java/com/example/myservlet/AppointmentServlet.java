package com.example.myservlet;

import com.example.dao.ScheduleDao;
import com.example.dao.AppointmentDao;
import com.example.dao.impl.ScheduleDaoImpl;
import com.example.dao.impl.AppointmentDaoImpl;
import com.example.entity.Schedule;
import com.example.entity.Appointment;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "AppointmentServlet", urlPatterns = {"/AppointmentServlet"})
public class AppointmentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取表单提交的参数
        int teacherId = Integer.parseInt(request.getParameter("teacherId"));
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        String dateStr = request.getParameter("weekday");
        String timeSlot = request.getParameter("timeSlot");
        String place = request.getParameter("place");

        // 将 String 转换为 Date
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try {
            date = formatter.parse(dateStr);
        } catch (ParseException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid date format");
            return;
        }

        // 创建 Schedule 对象和 Appointment 对象
        Schedule schedule = new Schedule(teacherId, date, timeSlot);
        Appointment appointment = new Appointment(studentId, teacherId, date, place, timeSlot);

        // 将数据插入到数据库的 schedule 表和 appointments 表中
        ScheduleDao scheduleDao = new ScheduleDaoImpl();
        AppointmentDao appointmentDao = new AppointmentDaoImpl();

        // 插入到 schedule 表
        scheduleDao.saveSchedule(schedule);

        // 插入到 appointments 表
        appointmentDao.saveAppointment(appointment);

        // 可选：重定向到成功页面或其他页面
        response.sendRedirect("homepages.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 处理 GET 请求，如果有需要的话
    }
}
