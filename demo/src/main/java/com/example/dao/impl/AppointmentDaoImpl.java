package com.example.dao.impl;

import com.example.dao.AppointmentDao;
import com.example.db.DBUtil;
import com.example.entity.Appointment;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AppointmentDaoImpl implements AppointmentDao {

    @Override
    public void saveAppointment(Appointment appointment) {
        String sql = "INSERT INTO Appointments (StudentID, TeacherID, Date, Time) VALUES (?, ?, ?, ?)";
        try {
            DBUtil.executeUpdate(sql, appointment.getStudentID(), appointment.getTeacherID(), new Date(appointment.getDate().getTime()), new Time(appointment.getTime().getTime()));
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }
    }

    @Override
    public Appointment getAppointmentById(int id) {
        String sql = "SELECT * FROM Appointments WHERE AppointmentID = ?";
        Appointment appointment = null;

        try {
            ResultSet rs = DBUtil.executeQuery(sql, id);
            if (rs.next()) {
                appointment = new Appointment();
                appointment.setAppointmentID(rs.getInt("AppointmentID"));
                appointment.setStudentID(rs.getInt("StudentID"));
                appointment.setTeacherID(rs.getInt("TeacherID"));
                appointment.setDate(rs.getDate("Date"));
                appointment.setTime(rs.getTime("Time"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }

        return appointment;
    }

    @Override
    public List<Appointment> getAppointmentByStudentId(int studentId) {
        String sql = "SELECT * FROM Appointments WHERE StudentID = ?";
        List<Appointment> appointments = new ArrayList<>();

        try {
            ResultSet rs = DBUtil.executeQuery(sql, studentId);
            while (rs.next()) {
                Appointment appointment = new Appointment();
                appointment.setAppointmentID(rs.getInt("AppointmentID"));
                appointment.setStudentID(rs.getInt("StudentID"));
                appointment.setTeacherID(rs.getInt("TeacherID"));
                appointment.setDate(rs.getDate("Date"));
                appointment.setTime(rs.getTime("Time"));
                appointments.add(appointment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }

        return appointments;
    }

    @Override
    public List<Appointment> getAppointmentByTeacherId(int teacherId) {
        String sql = "SELECT * FROM Appointments WHERE TeacherID = ?";
        List<Appointment> appointments = new ArrayList<>();

        try {
            ResultSet rs = DBUtil.executeQuery(sql, teacherId);
            while (rs.next()) {
                Appointment appointment = new Appointment();
                appointment.setAppointmentID(rs.getInt("AppointmentID"));
                appointment.setStudentID(rs.getInt("StudentID"));
                appointment.setTeacherID(rs.getInt("TeacherID"));
                appointment.setDate(rs.getDate("Date"));
                appointment.setTime(rs.getTime("Time"));
                appointments.add(appointment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }

        return appointments;
    }

    @Override
    public List<Appointment> getAllAppointments() {
        String sql = "SELECT * FROM Appointments";
        List<Appointment> appointments = new ArrayList<>();

        try {
            ResultSet rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                Appointment appointment = new Appointment();
                appointment.setAppointmentID(rs.getInt("AppointmentID"));
                appointment.setStudentID(rs.getInt("StudentID"));
                appointment.setTeacherID(rs.getInt("TeacherID"));
                appointment.setDate(rs.getDate("Date"));
                appointment.setTime(rs.getTime("Time"));
                appointments.add(appointment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }

        return appointments;
    }

    @Override
    public void updateAppointment(Appointment appointment) {
        String sql = "UPDATE Appointments SET StudentID = ?, TeacherID = ?, Date = ?, Time = ? WHERE AppointmentID = ?";
        try {
            DBUtil.executeUpdate(sql, appointment.getStudentID(), appointment.getTeacherID(), new Date(appointment.getDate().getTime()), new Time(appointment.getTime().getTime()), appointment.getAppointmentID());
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }
    }

    @Override
    public void deleteAppointment(int id) {
        String sql = "DELETE FROM Appointments WHERE AppointmentID = ?";
        try {
            DBUtil.executeUpdate(sql, id);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }
    }
}

