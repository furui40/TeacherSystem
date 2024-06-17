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
        scheduleDao = new ScheduleDaoImpl(); // 初始化 DAO 实例
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 设置请求和响应的字符编码
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        // 获取表单提交的教师ID
        int teacherId = Integer.parseInt(request.getParameter("teacherId"));

        // 获取当前页面的日期范围
        String pageStart = request.getParameter("pageStart");
        String pageEnd = request.getParameter("pageEnd");

        // 获取所有复选框的状态
        String[] timeSlots = {"morning", "afternoon", "evening"};
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        // 循环处理每个日期和时间段
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

                    // 构造 Schedule 对象
                    Schedule schedule = new Schedule();
                    schedule.setTeacherID(teacherId);
                    schedule.setDate(java.sql.Date.valueOf(currentDate));
                    schedule.setTimeSlot(timeSlot);

                    // 检查是否存在该条信息
                    if (isChecked && !scheduleDao.exists(teacherId, java.sql.Date.valueOf(currentDate), timeSlot)) {
                        // 不存在则添加
                        scheduleDao.saveSchedule(schedule);
                        System.out.println("添加: " + schedule);
                    } else if (isChecked && scheduleDao.exists(teacherId, java.sql.Date.valueOf(currentDate), timeSlot)) {
                        // 存在则删除
                        boolean deleted = scheduleDao.deleteSchedule(teacherId, java.sql.Date.valueOf(currentDate), timeSlot);
                        System.out.println("删除: " + schedule);
                    }
                }
            }

            currentDate = currentDate.plusDays(1); // Move to next day
        }

        // 返回到设置页面或其他逻辑
        response.sendRedirect("homepaget.jsp"); // 假设设置页面为 setAvailability.jsp
    }
}
