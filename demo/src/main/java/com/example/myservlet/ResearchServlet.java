package com.example.myservlet;

import com.example.dao.ResearchDao;
import com.example.dao.impl.ResearchDaoImpl;
import com.example.dao.impl.TeachersDaoImpl;
import com.example.entity.Research;
import com.example.entity.Teacher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Cookie;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/ResearchServlet")
public class ResearchServlet extends HttpServlet {

    private ResearchDao researchDao;

    @Override
    public void init() throws ServletException {
        researchDao = new ResearchDaoImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // ��ȡ teacherId �� cookie
        int teacherId = getIdFromCookie(request);

        // ��ȡ���и���ʦ����Ŀ����
        List<Research> researchList = researchDao.getResearchByTeacherId(teacherId);

        // �洢��Ŀ���ݵ� request ������
        request.setAttribute("researchList", researchList);

        // ת����չʾҳ��
        request.getRequestDispatcher("selectResearch.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        // ��ȡ��������
        String action = request.getParameter("action");

        // ��ȡ teacherId �� cookie
        int userId = getIdFromCookie(request);
        TeachersDaoImpl teachersDao = new TeachersDaoImpl();
        Teacher teacher = teachersDao.getTeacherByUserId(userId);
        int teacherId = teacher.getTeacherID();
        // ���ݲ������ͽ�����Ӧ�Ĵ���
        if ("delete".equals(action)) {
            // ɾ����Ŀ
            int researchId = Integer.parseInt(request.getParameter("id"));
            researchDao.deleteResearch(researchId);
            response.sendRedirect("selectResearch.jsp?uid=" + teacherId);
        } else if ("update".equals(action)) {
            // �޸���Ŀ
            int researchId = Integer.parseInt(request.getParameter("id"));
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String dateString = request.getParameter("date");

            Research research = new Research();
            research.setResearchID(researchId);
            research.setTitle(title);
            research.setDescription(description);
            research.setTeacherID(teacherId); // ���� teacherId

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            try {
                Date date = dateFormat.parse(dateString);
                research.setDate(date);
            } catch (ParseException e) {
                e.printStackTrace();
            }

            researchDao.updateResearch(research);
            response.sendRedirect("selectResearch.jsp?uid=" + teacherId);
        } else if ("add".equals(action)) {
            // ������Ŀ
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String dateString = request.getParameter("date");

            Research research = new Research();
            research.setTitle(title);
            research.setDescription(description);
            research.setTeacherID(teacherId); // ���� teacherId

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            try {
                Date date = dateFormat.parse(dateString);
                research.setDate(date);
            } catch (ParseException e) {
                e.printStackTrace();
            }

            researchDao.saveResearch(research);
            response.sendRedirect("selectResearch.jsp?uid=" + teacherId);
        }
    }

    private int getIdFromCookie(HttpServletRequest request) {
        int id = -1;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("id".equals(cookie.getName())) {
                    String value = cookie.getValue();
                    if (value != null && !value.isEmpty()) {
                        try {
                            id = Integer.parseInt(value);
                        } catch (NumberFormatException e) {
                            // ������Ч�� cookie ֵ
                        }
                    }
                    break;
                }
            }
        }
        return id;
    }
}