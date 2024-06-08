package com.example.dao;

import com.example.entity.Schedule;
import java.util.List;

public interface ScheduleDao {
    void saveSchedule(Schedule schedule);
    Schedule getScheduleById(int id);
    List<Schedule> getScheduleByTeacherId(int teacherId);
    List<Schedule> getAllSchedules();
    void updateSchedule(Schedule schedule);
    void deleteSchedule(int id);
}
