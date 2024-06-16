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
    public boolean deleteSchedule(int teacherId, java.util.Date date, String timeSlot) {
        String sql = "DELETE FROM schedule WHERE teacherId = ? AND date = ? AND timeSlot = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, teacherId);
            stmt.setDate(2, new java.sql.Date(date.getTime()));
            stmt.setString(3, timeSlot);
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean exists(int teacherID, java.util.Date date, String timeSlot) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection(); // Obtain connection from DBUtil

            // Prepare SQL query to check existence of schedule
            String sql = "SELECT COUNT(*) AS count FROM schedule WHERE teacherID = ? AND date = ? AND timeSlot = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, teacherID);
            stmt.setDate(2, new java.sql.Date(date.getTime())); // Assuming 'date' is java.util.Date
            stmt.setString(3, timeSlot);

            rs = stmt.executeQuery();
            if (rs.next()) {
                int count = rs.getInt("count");
                return count > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle SQL exceptions appropriately or throw an exception
        } finally {
            // Close resources in finally block
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return false; // Default return if something goes wrong
    }


}
