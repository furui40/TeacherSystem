package com.example.dao.impl;

import com.example.dao.ScheduleDao;
import com.example.entity.Schedule;
import com.example.db.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ScheduleDaoImpl implements ScheduleDao {
    @Override
    public void saveSchedule(Schedule schedule) {
        String sql = "INSERT INTO Schedule (TeacherID, Date, TimeSlot) VALUES (?, ?, ?)";
        try {
            DBUtil.executeUpdate(sql, schedule.getTeacherID(), new Date(schedule.getDate().getTime()), schedule.getTimeSlot());
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }
    }

    @Override
    public Schedule getScheduleById(int id) {
        String sql = "SELECT * FROM Schedule WHERE ScheduleID = ?";
        Schedule schedule = null;

        try {
            ResultSet rs = DBUtil.executeQuery(sql, id);
            if (rs.next()) {
                schedule = new Schedule();
                schedule.setScheduleID(rs.getInt("ScheduleID"));
                schedule.setTeacherID(rs.getInt("TeacherID"));
                schedule.setDate(rs.getDate("Date"));
                schedule.setTimeSlot(rs.getString("TimeSlot"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }

        return schedule;
    }

    @Override
    public List<Schedule> getScheduleByTeacherId(int teacherId) {
        String sql = "SELECT * FROM Schedule WHERE TeacherID = ?";
        List<Schedule> schedules = new ArrayList<>();

        try {
            ResultSet rs = DBUtil.executeQuery(sql, teacherId);
            while (rs.next()) {
                Schedule schedule = new Schedule();
                schedule.setScheduleID(rs.getInt("ScheduleID"));
                schedule.setTeacherID(rs.getInt("TeacherID"));
                schedule.setDate(rs.getDate("Date"));
                schedule.setTimeSlot(rs.getString("TimeSlot"));
                schedules.add(schedule);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }

        return schedules;
    }

    @Override
    public List<Schedule> getAllSchedules() {
        String sql = "SELECT * FROM Schedule";
        List<Schedule> schedules = new ArrayList<>();

        try {
            ResultSet rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                Schedule schedule = new Schedule();
                schedule.setScheduleID(rs.getInt("ScheduleID"));
                schedule.setTeacherID(rs.getInt("TeacherID"));
                schedule.setDate(rs.getDate("Date"));
                schedule.setTimeSlot(rs.getString("TimeSlot"));
                schedules.add(schedule);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }

        return schedules;
    }

    @Override
    public void updateSchedule(Schedule schedule) {
        String sql = "UPDATE Schedule SET TeacherID = ?, Date = ?, TimeSlot = ? WHERE ScheduleID = ?";
        try {
            DBUtil.executeUpdate(sql, schedule.getTeacherID(), new Date(schedule.getDate().getTime()), schedule.getTimeSlot(), schedule.getScheduleID());
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }
    }

    @Override
    public void deleteSchedule(int id) {
        String sql = "DELETE FROM Schedule WHERE ScheduleID = ?";
        try {
            DBUtil.executeUpdate(sql, id);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }
    }
}
