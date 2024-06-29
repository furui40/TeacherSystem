package com.example.myservlet;

import com.example.dao.AppointmentDao;
import com.example.dao.ScheduleDao;
import com.example.dao.impl.*;
import com.example.entity.*;
import com.example.utils.MailUtil;

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
        // �������н�ʦ��ƥ��ؼ���
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
                List<Appointment> appointments = appointmentDao.getAppointmentsByStudentId(studentId);
                Boolean flag = false;
                for (Appointment appointment0 : appointments) {
                    if (appointment0.getAppointmentTime().equals(timeSlot) &&
                            appointment0.getDate().equals(date) ) {
                        flag = true;
                    }
                }
                if(scheduleDao.exists(teacherId,date,timeSlot) && !flag){
                    scheduleDao.deleteSchedule(teacherId, date, timeSlot);
                    appointmentDao.saveAppointment(appointment);
                }else{
                    request.setAttribute("msg","����ʧ��");
                }
            }else{
                request.setAttribute("msg","����ʧ��");
            }
            request.getRequestDispatcher("manageAppointment.jsp").forward(request, response);
        }else if("deletey".equals(action)){
            int appointId = Integer.parseInt(request.getParameter("id"));
            Appointment appointment = appointmentDao.getAppointmentById(appointId);
            Date date = appointment.getDate();
            String time = appointment.getAppointmentTime();
            int teacherId = appointment.getTeacherID();
            ScheduleDaoImpl scheduleDao = new ScheduleDaoImpl();
            Schedule schedule = new Schedule(teacherId,date,time);
            scheduleDao.saveSchedule(schedule);
            appointmentDao.deleteAppointment(appointId);
            StudentDaoImpl studentDao = new StudentDaoImpl();
            Student student = studentDao.getStudentById(appointment.getStudentID());
            String studentName = student.getName();
            TeachersDaoImpl teachersDao = new TeachersDaoImpl();
            Teacher teacher = teachersDao.getTeacherById(appointment.getTeacherID());
            String teacherName = teacher.getName();
            String dateStr = String.valueOf(date);
            String timeSlot = appointment.getAppointmentTime();
            String place = appointment.getPlace();
            String email = student.getEmail();
            String detail = studentName + "," + teacherName + "," + dateStr + "," +timeSlot + "," + place;
            MailUtil.sendEmail(email, detail, 2);
            response.sendRedirect("manageAppointment.jsp");
        }
    }
}
