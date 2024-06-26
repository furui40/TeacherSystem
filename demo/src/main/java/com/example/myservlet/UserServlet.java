package com.example.myservlet;

import com.example.dao.TeachersDao;
import com.example.dao.UsersDao;
import com.example.dao.StudentDao;
import com.example.dao.impl.TeachersDaoImpl;
import com.example.dao.impl.UsersDaoImpl;
import com.example.dao.impl.StudentDaoImpl;
import com.example.entity.Teacher;
import com.example.entity.User;
import com.example.entity.Student;
import com.example.entity.UserType;
import com.example.utils.MailUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {

    private UsersDao usersDao;
    private StudentDao studentDao;

    private TeachersDao teachersDao;

    @Override
    public void init() throws ServletException {
        usersDao = new UsersDaoImpl();
        studentDao = new StudentDaoImpl();
        teachersDao = new TeachersDaoImpl();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        // ��ȡ������
        String username = request.getParameter("uid");
        String password = request.getParameter("pwd");
        String role = request.getParameter("role");

        // ���ݽ�ɫ�ַ���ȷ���û�����
        UserType userType = null;
        if ("teacher".equalsIgnoreCase(role)) {
            userType = UserType.Teacher;
        } else if ("student".equalsIgnoreCase(role)) {
            userType = UserType.Student;
        }

        // ����û�������Ч������ע��ҳ�沢��ʾ������Ϣ
        if (userType == null) {
            request.setAttribute("errorMessage", "��ѡ����Ч�����");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }

        // �����û����󲢱��浽���ݿ�
        User user = new User(username, password, userType);
        int getUserID = usersDao.saveUser(user);

        // ����û�������ѧ��������ѧ����Ϣ��ѧ����
        if (userType == UserType.Student) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");

            // ����ѧ�����󲢱��浽���ݿ�
            Student student = new Student();
            student.setUserId(getUserID);
            student.setName(name);
            student.setEmail(email);
            System.out.println(getUserID);
            studentDao.addStudent(student);

            String detail = username + "," + password + "," + name;
            MailUtil.sendEmail(email, detail, 0);
        }
        if (userType == UserType.Teacher) {
            Teacher teacher = new Teacher();
            teacher.setUserID(getUserID);
            teacher.setEmail("example@123");
            teacher.setBio("������������");
            teacher.setProfession("�������ѧ�뼼��");
            teacher.setName("��ȥ���ø�����Ϣ��");
            teachersDao.saveTeacher(teacher);

        }
        // ע��ɹ����ض��򵽵�¼ҳ��
        response.sendRedirect("login.jsp");
    }
}
