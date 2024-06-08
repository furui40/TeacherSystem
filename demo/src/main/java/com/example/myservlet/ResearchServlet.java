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
        // 获取 teacherId 从 cookie
        int teacherId = getIdFromCookie(request);

        // 获取所有该老师的项目数据
        List<Research> researchList = researchDao.getResearchByTeacherId(teacherId);

        // 存储项目数据到 request 属性中
        request.setAttribute("researchList", researchList);

        // 转发到展示页面
        request.getRequestDispatcher("selectResearch.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        // 获取操作类型
        String action = request.getParameter("action");

        // 获取 teacherId 从 cookie
        int userId = getIdFromCookie(request);
        TeachersDaoImpl teachersDao = new TeachersDaoImpl();
        Teacher teacher = teachersDao.getTeacherByUserId(userId);
        int teacherId = teacher.getTeacherID();
        // 根据操作类型进行相应的处理
        if ("delete".equals(action)) {
            // 删除项目
            int researchId = Integer.parseInt(request.getParameter("id"));
            researchDao.deleteResearch(researchId);
            response.sendRedirect("selectResearch.jsp?uid=" + teacherId);
        } else if ("update".equals(action)) {
            // 修改项目
            int researchId = Integer.parseInt(request.getParameter("id"));
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String dateString = request.getParameter("date");

            Research research = new Research();
            research.setResearchID(researchId);
            research.setTitle(title);
            research.setDescription(description);
            research.setTeacherID(teacherId); // 设置 teacherId

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
            // 新增项目
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String dateString = request.getParameter("date");

            Research research = new Research();
            research.setTitle(title);
            research.setDescription(description);
            research.setTeacherID(teacherId); // 设置 teacherId

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
                            // 忽略无效的 cookie 值
                        }
                    }
                    break;
                }
            }
        }
        return id;
    }
}