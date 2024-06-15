package com.example.dao;

import com.example.entity.Appointment;

import java.util.List;

public interface AppointmentDao {
    void saveAppointment(Appointment appointment);
    Appointment getAppointmentById(int appointmentID);
    List<Appointment> getAppointmentsByStudentId(int studentID);
    List<Appointment> getAppointmentsByTeacherId(int teacherID);
    List<Appointment> getAllAppointments();
    void updateAppointment(Appointment appointment);
    void deleteAppointment(int appointmentID);
}
