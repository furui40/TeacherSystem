package com.example.myservlet;

import com.example.dao.TeachersDao;
import com.example.dao.impl.ResearchDaoImpl;
import com.example.dao.impl.TeachersDaoImpl;
import com.example.dao.impl.UsersDaoImpl;
import com.example.entity.Research;
import com.example.entity.Teacher;
import com.example.entity.User;
import com.example.entity.UserType;

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
        teachersDao = new TeachersDaoImpl(); // ��ʼ��DAO
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        UsersDaoImpl usersDao = new UsersDaoImpl();
        if ("modify".equals(action)) {
            int userId = Integer.parseInt(request.getParameter("uid"));
            Teacher teacher = teachersDao.getTeacherById(userId);
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
                teachersDao.saveTeacher(teacher1); // ���Ը���ʵ������ض��򵽴���ҳ��
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
            ResearchDaoImpl researchDao = new ResearchDaoImpl();
            List<Research> researchs = researchDao.getResearchByTeacherId(tid);
            for(int i = 0; i < researchs.size(); i++) {
                researchDao.deleteResearch(researchs.get(i).getResearchID());
            }
            teachersDao.deleteTeacher(teacher.getTeacherID());
            usersDao.deleteUser(uid);
            response.sendRedirect("manageTeacher.jsp");
        }
        if("add".equals(action)){
            User newuser = new User();
            String username = request.getParameter("username");
            String password = request.getParameter("password");
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
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // �����Ҫ����GET���󣬿��������������Ӧ���߼�
    }


}
