package com.example.myservlet;

import com.example.dao.ScheduleDao;
import com.example.dao.AppointmentDao;
import com.example.dao.impl.ScheduleDaoImpl;
import com.example.dao.impl.AppointmentDaoImpl;
import com.example.dao.impl.StudentDaoImpl;
import com.example.dao.impl.TeachersDaoImpl;
import com.example.entity.Appointment;
import com.example.entity.Student;
import com.example.entity.Teacher;
import com.example.utils.MailUtil;

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

        // ɾ�� schedule ���еļ�¼
        ScheduleDao scheduleDao = new ScheduleDaoImpl();
        boolean isDeleted = scheduleDao.deleteSchedule(teacherId, date, timeSlot);

        // ����ɾ�����
        if (!isDeleted) {
            System.out.println(teacherId);
            System.out.println(date);
            System.out.println(timeSlot);
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Failed to delete schedule");
            return;
        }

        // ���� Appointment ���󲢲��� appointments ����
        Appointment appointment = new Appointment(studentId, teacherId, date, place, timeSlot);
        AppointmentDao appointmentDao = new AppointmentDaoImpl();
        appointmentDao.saveAppointment(appointment);

        StudentDaoImpl studentDao = new StudentDaoImpl();
        Student student = studentDao.getStudentById(studentId);
        String email = student.getEmail();
        String studentName = student.getName();
        TeachersDaoImpl teachersDao = new TeachersDaoImpl();
        Teacher teacher = teachersDao.getTeacherById(teacherId);
        String teacherName = teacher.getName();
        String detail = studentName + "," + teacherName + "," + dateStr + "," +timeSlot + "," + place;
        MailUtil.sendEmail(email, detail, 1);
        // �ض��򵽳ɹ�ҳ�������ҳ��
        response.sendRedirect("homepages.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // ���� GET �����������Ҫ�Ļ�
    }
}
