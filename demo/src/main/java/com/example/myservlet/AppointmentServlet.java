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
        // ��ȡ���ύ�Ĳ���
        int teacherId = Integer.parseInt(request.getParameter("teacherId"));
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        String dateStr = request.getParameter("weekday");
        String timeSlot = request.getParameter("timeSlot");
        String place = request.getParameter("place");

        // �� String ת��Ϊ Date
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try {
            date = formatter.parse(dateStr);
        } catch (ParseException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid date format");
            return;
        }

        // ���� Schedule ����� Appointment ����
        Schedule schedule = new Schedule(teacherId, date, timeSlot);
        Appointment appointment = new Appointment(studentId, teacherId, date, place, timeSlot);

        // �����ݲ��뵽���ݿ�� schedule ��� appointments ����
        ScheduleDao scheduleDao = new ScheduleDaoImpl();
        AppointmentDao appointmentDao = new AppointmentDaoImpl();

        // ���뵽 schedule ��
        scheduleDao.saveSchedule(schedule);

        // ���뵽 appointments ��
        appointmentDao.saveAppointment(appointment);

        // ��ѡ���ض��򵽳ɹ�ҳ�������ҳ��
        response.sendRedirect("homepages.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // ���� GET �����������Ҫ�Ļ�
    }
}
