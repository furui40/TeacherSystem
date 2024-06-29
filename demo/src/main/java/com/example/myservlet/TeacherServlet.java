package com.example.myservlet;

import com.example.dao.TeachersDao;
import com.example.dao.impl.*;
import com.example.entity.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/TeacherServlet")
public class TeacherServlet extends HttpServlet {
    private TeachersDao teachersDao;

    public void init() {
        teachersDao = new TeachersDaoImpl(); // 初始化DAO
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        UsersDaoImpl usersDao = new UsersDaoImpl();
        if ("modify".equals(action)) {
            int userId = Integer.parseInt(request.getParameter("uid"));
            Teacher teacher = teachersDao.getTeacherByUserId(userId);
            Teacher teacher1 = new Teacher();
            teacher1.setUserID(userId);
            if (teacher == null) {
                String name = request.getParameter("name");
                String major = request.getParameter("profession");
                String email = request.getParameter("email");
                String bio = request.getParameter("bio");
                teacher1.setName(name);
                teacher1.setProfession(major);
                teacher1.setEmail(email);
                teacher1.setBio(bio);
                teachersDao.saveTeacher(teacher1); // 可以根据实际情况重定向到错误页面
                response.sendRedirect("homepaget.jsp");
                return;
            }
            String name = request.getParameter("name");
            String major = request.getParameter("profession");
            String email = request.getParameter("email");
            String bio = request.getParameter("bio");

            teacher.setName(name);
            teacher.setProfession(major);
            teacher.setEmail(email);
            teacher.setBio(bio);

            teachersDao.updateTeacher(teacher);
            response.sendRedirect("homepaget.jsp");
        }
        if ("modifyy".equals(action)) {
            int tid = Integer.parseInt(request.getParameter("id"));
            Teacher teacher = teachersDao.getTeacherById(tid);
            String name = request.getParameter("name");
            String major = request.getParameter("profession");
            String email = request.getParameter("email");
            String bio = request.getParameter("bio");

            teacher.setName(name);
            teacher.setProfession(major);
            teacher.setEmail(email);
            teacher.setBio(bio);

            teachersDao.updateTeacher(teacher);
            response.sendRedirect("manageTeacher.jsp");
        }
        if ("delete".equals(action)) {
            int tid = Integer.parseInt(request.getParameter("id"));
            Teacher teacher = teachersDao.getTeacherById(tid);
            int uid = teacher.getUserID();
            AppointmentDaoImpl appointmentDao = new AppointmentDaoImpl();
            List<Appointment> appointments = appointmentDao.getAppointmentsByTeacherId(tid);
            if(appointments.size() != 0)
            {
                for(int i = 0;i < appointments.size(); i++){
                    appointmentDao.deleteAppointment(appointments.get(i).getAppointmentID());
                }
            }
            ScheduleDaoImpl scheduleDao = new ScheduleDaoImpl();
            List<Schedule> schedules = scheduleDao.getScheduleByTeacherId(tid);
            if(schedules.size() != 0){
                for(int i = 0; i < schedules.size(); i++){
                    scheduleDao.deleteSchedule(schedules.get(i).getTeacherID(),schedules.get(i).getDate(),schedules.get(i).getTimeSlot());
                }
            }
            ResearchDaoImpl researchDao = new ResearchDaoImpl();
            List<Research> researchs = researchDao.getResearchByTeacherId(tid);
            if(researchs.size() != 0){
                for(int i = 0; i < researchs.size(); i++) {
                    researchDao.deleteResearch(researchs.get(i).getResearchID());
                }
            }
            teachersDao.deleteTeacher(teacher.getTeacherID());
            usersDao.deleteUser(uid);
            response.sendRedirect("manageTeacher.jsp");
        }
        if("add".equals(action)){
            User newuser = new User();
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            User olduser = usersDao.getUserByUsername(username);
            if(olduser == null){
                newuser.setUsername(username);
                newuser.setPassword(password);
                newuser.setUserType(UserType.Teacher);
                usersDao.saveUser(newuser);
                User user1 = usersDao.getUserByUsername(username);
                int uid = user1.getUserID();
                Teacher newteacher = new Teacher();
                String name = request.getParameter("name");
                String major = request.getParameter("profession");
                String email = request.getParameter("email");
                String bio = request.getParameter("bio");
                newteacher.setName(name);
                newteacher.setProfession(major);
                newteacher.setEmail(email);
                newteacher.setBio(bio);
                newteacher.setUserID(uid);
                teachersDao.saveTeacher(newteacher);
                response.sendRedirect("manageTeacher.jsp");
            }else{
                request.setAttribute("msg","添加失败");
                request.getRequestDispatcher("manageTeacher.jsp").forward(request, response);
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 如果需要处理GET请求，可以在这里添加相应的逻辑
    }


}
