package com.example.myservlet;

import com.example.dao.AppointmentDao;
import com.example.dao.ScheduleDao;
import com.example.dao.impl.*;
import com.example.entity.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(name = "AppointmentAdminServlet", value = "/AppointmentAdminServlet")
public class AppointmentAdminServlet extends HttpServlet {

    private AppointmentDao appointmentDao;

    @Override
    public void init() throws ServletException {
        appointmentDao = new AppointmentDaoImpl();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String keyword = request.getParameter("keyword");
        List<Appointment> allAppointments = appointmentDao.getAllAppointments();
        List<Appointment> matchedAppointments = new ArrayList<>();
        TeachersDaoImpl teachersDao = new TeachersDaoImpl();
        StudentDaoImpl studentDao = new StudentDaoImpl();
        Teacher teacher;
        Student student;
        // 遍历所有教师，匹配关键词
        for (Appointment appointment : allAppointments) {
            teacher = teachersDao.getTeacherById(appointment.getTeacherID());
            student = studentDao.getStudentById(appointment.getStudentID());
            if (appointment.getPlace().contains(keyword) ||
                    appointment.getAppointmentTime().contains(keyword) ||
                    teacher.getName().contains(keyword) ||
                    student.getName().contains(keyword)) {
                    matchedAppointments.add(appointment);
            }
        }
        request.setAttribute("appointments", matchedAppointments);
        request.getRequestDispatcher("manageAppointment.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if("addy".equals(action)) {
            String teacherName = request.getParameter("teacherName");
            String studentName = request.getParameter("studentName");
            String dateString = request.getParameter("date");
            String timeSlot = request.getParameter("timeSlot");
            String place = request.getParameter("place");
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date date = null;
            try {
                date = dateFormat.parse(dateString);
            } catch (ParseException e) {
                throw new RuntimeException(e);
            }
            TeachersDaoImpl teachersDao = new TeachersDaoImpl();
            Teacher teacher = teachersDao.getTeacherByName(teacherName);
            StudentDaoImpl studentDao = new StudentDaoImpl();
            List<Student> students = studentDao.getStudentsByName(studentName);
            if (students.size() == 1 || teacher != null) {
                int teacherId = teacher.getTeacherID();
                int studentId = students.get(0).getStudentId();
                Appointment appointment = new Appointment(studentId, teacherId, date, place, timeSlot);
                ScheduleDao scheduleDao = new ScheduleDaoImpl();
                AppointmentDao appointmentDao = new AppointmentDaoImpl();
                if(scheduleDao.exists(teacherId,date,timeSlot)){
                    scheduleDao.deleteSchedule(teacherId, date, timeSlot);
                    appointmentDao.saveAppointment(appointment);
                }
            }else{
                request.setAttribute("msg","添加失败");
            }
            request.getRequestDispatcher("manageAppointment.jsp").forward(request, response);
        }else if("deletey".equals(action)){
            int appointId = Integer.parseInt(request.getParameter("id"));
            appointmentDao.deleteAppointment(appointId);
            response.sendRedirect("manageAppointment.jsp");
        }
    }
}
