package com.example.dao;

import com.example.entity.Schedule;

import java.util.Date;
import java.util.List;

public interface ScheduleDao {
    void saveSchedule(Schedule schedule);
    Schedule getScheduleById(int id);
    List<Schedule> getScheduleByTeacherId(int teacherId);
    List<Schedule> getAllSchedules();
    void updateSchedule(Schedule schedule);
    boolean deleteSchedule(int teacherId, Date date, String timeSlot);
    boolean exists(int teacherID, Date date, String timeSlot);
}
