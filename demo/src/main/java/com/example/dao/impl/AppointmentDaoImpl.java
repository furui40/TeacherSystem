package com.example.dao.impl;

import com.example.dao.AppointmentDao;
import com.example.entity.Appointment;
import com.example.db.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AppointmentDaoImpl implements AppointmentDao {

    @Override
    public void saveAppointment(Appointment appointment) {
        String sql = "INSERT INTO Appointments (StudentID, TeacherID, Date, Place, AppointmentTime) " +
                "VALUES (?, ?, ?, ?, ?)";
        try {
            DBUtil.executeUpdate(sql, appointment.getStudentID(), appointment.getTeacherID(),
                    appointment.getDate(), appointment.getPlace(),
                    appointment.getAppointmentTime());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Appointment getAppointmentById(int appointmentID) {
        String sql = "SELECT * FROM Appointments WHERE AppointmentID = ?";
        try {
            ResultSet rs = DBUtil.executeQuery(sql, appointmentID);
            if (rs.next()) {
                return extractAppointmentFromResultSet(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Appointment> getAppointmentsByStudentId(int studentID) {
        String sql = "SELECT * FROM Appointments WHERE StudentID = ?";
        List<Appointment> appointments = new ArrayList<>();
        try {
            ResultSet rs = DBUtil.executeQuery(sql, studentID);
            while (rs.next()) {
                appointments.add(extractAppointmentFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return appointments;
    }

    @Override
    public List<Appointment> getAppointmentsByTeacherId(int teacherID) {
        String sql = "SELECT * FROM Appointments WHERE TeacherID = ?";
        List<Appointment> appointments = new ArrayList<>();
        try {
            ResultSet rs = DBUtil.executeQuery(sql, teacherID);
            while (rs.next()) {
                appointments.add(extractAppointmentFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
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
                appointments.add(extractAppointmentFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return appointments;
    }

    @Override
    public void updateAppointment(Appointment appointment) {
        String sql = "UPDATE Appointments SET StudentID = ?, TeacherID = ?, " +
                "Date = ?, Place = ?, AppointmentTime = ? WHERE AppointmentID = ?";
        try {
            DBUtil.executeUpdate(sql, appointment.getStudentID(), appointment.getTeacherID(),
                    appointment.getDate(), appointment.getPlace(),
                    appointment.getAppointmentTime(), appointment.getAppointmentID());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteAppointment(int appointmentID) {
        String sql = "DELETE FROM Appointments WHERE AppointmentID = ?";
        try {
            DBUtil.executeUpdate(sql, appointmentID);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private Appointment extractAppointmentFromResultSet(ResultSet rs) throws SQLException {
        Appointment appointment = new Appointment();
        appointment.setAppointmentID(rs.getInt("AppointmentID"));
        appointment.setStudentID(rs.getInt("StudentID"));
        appointment.setTeacherID(rs.getInt("TeacherID"));
        appointment.setDate(rs.getDate("Date"));
        appointment.setPlace(rs.getString("Place"));
        appointment.setAppointmentTime(rs.getString("AppointmentTime"));
        return appointment;
    }
}
