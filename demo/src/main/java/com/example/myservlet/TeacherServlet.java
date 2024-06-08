package com.example.myservlet;

import com.example.dao.TeachersDao;
import com.example.dao.impl.TeachersDaoImpl;
import com.example.entity.Teacher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/TeacherServlet")
public class TeacherServlet extends HttpServlet {
    private TeachersDao teachersDao;

    public void init() {
        teachersDao = new TeachersDaoImpl(); // ��ʼ��DAO
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        Integer userId = null; // ��ѭ���ⲿ���� userId

        // ��ȡcookie�е�userId
        Cookie[] cookies = request.getCookies();

        // �������е�Cookie
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("id")) {
                    userId = Integer.valueOf(cookie.getValue()); // ���� userId ��ֵ
                    // ���������ʹ�û�ȡ����userId������Ӧ�Ĳ���
                    System.out.println("Useridname: " + userId);
                }
            }
        }


            Teacher teacher = teachersDao.getTeacherByUserId(userId);
            // ������������...
            Teacher teacher1 = new Teacher();
            teacher1.setUserID(userId);

        // ���û���ҵ���Ӧ��teacher������Ը��ݾ���ҵ���߼����������Ϊֱ�ӷ���
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

        // ��ȡ������
        String name = request.getParameter("name");
        String major = request.getParameter("profession");
        String email = request.getParameter("email");
        String bio = request.getParameter("bio");

        // ����Teacher��Ϣ
        teacher.setName(name);
        teacher.setProfession(major);
        teacher.setEmail(email);
        teacher.setBio(bio);

        // ������º�Ľ�ʦ��Ϣ�����ݿ�
        teachersDao.updateTeacher(teacher);

        // �ض��򵽳ɹ�ҳ�������ҳ��
        response.sendRedirect("homepaget.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // �����Ҫ����GET���󣬿��������������Ӧ���߼�
    }


}
