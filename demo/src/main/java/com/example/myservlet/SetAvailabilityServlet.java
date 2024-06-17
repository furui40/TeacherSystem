package com.example.myservlet;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.example.dao.ScheduleDao;
import com.example.dao.impl.ScheduleDaoImpl;
import com.example.entity.Schedule;

@WebServlet("/SetAvailabilityServlet")
public class SetAvailabilityServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ScheduleDao scheduleDao;

    public void init() throws ServletException {
        super.init();
        scheduleDao = new ScheduleDaoImpl(); // ��ʼ�� DAO ʵ��
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // �����������Ӧ���ַ�����
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        // ��ȡ���ύ�Ľ�ʦID
        int teacherId = Integer.parseInt(request.getParameter("teacherId"));

        // ��ȡ��ǰҳ������ڷ�Χ
        String pageStart = request.getParameter("pageStart");
        String pageEnd = request.getParameter("pageEnd");

        // ��ȡ���и�ѡ���״̬
        String[] timeSlots = {"morning", "afternoon", "evening"};
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        // ѭ������ÿ�����ں�ʱ���
        LocalDate startDate = LocalDate.parse(pageStart, dateFormatter);
        LocalDate endDate = LocalDate.parse(pageEnd, dateFormatter);
        LocalDate currentDate = startDate;

        while (!currentDate.isAfter(endDate)) {
            String formattedDate = dateFormatter.format(currentDate);

            for (String timeSlot : timeSlots) {
                String checkBoxName = "schedule_" + formattedDate + "_" + timeSlot;
                String checkBoxValue = request.getParameter(checkBoxName);

                if (checkBoxValue != null) {
                    boolean isChecked = checkBoxValue.equals("1");

                    // ���� Schedule ����
                    Schedule schedule = new Schedule();
                    schedule.setTeacherID(teacherId);
                    schedule.setDate(java.sql.Date.valueOf(currentDate));
                    schedule.setTimeSlot(timeSlot);

                    // ����Ƿ���ڸ�����Ϣ
                    if (isChecked && !scheduleDao.exists(teacherId, java.sql.Date.valueOf(currentDate), timeSlot)) {
                        // �����������
                        scheduleDao.saveSchedule(schedule);
                        System.out.println("���: " + schedule);
                    } else if (isChecked && scheduleDao.exists(teacherId, java.sql.Date.valueOf(currentDate), timeSlot)) {
                        // ������ɾ��
                        boolean deleted = scheduleDao.deleteSchedule(teacherId, java.sql.Date.valueOf(currentDate), timeSlot);
                        System.out.println("ɾ��: " + schedule);
                    }
                }
            }

            currentDate = currentDate.plusDays(1); // Move to next day
        }

        // ���ص�����ҳ��������߼�
        response.sendRedirect("homepaget.jsp"); // ��������ҳ��Ϊ setAvailability.jsp
    }
}
