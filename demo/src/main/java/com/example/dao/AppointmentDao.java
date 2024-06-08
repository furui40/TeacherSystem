package com.example.dao;

import com.example.entity.Appointment;
import java.util.List;

public interface AppointmentDao {
    void saveAppointment(Appointment appointment);
    Appointment getAppointmentById(int id);
    List<Appointment> getAppointmentByStudentId(int studentId);
    List<Appointment> getAppointmentByTeacherId(int teacherId);
    List<Appointment> getAllAppointments();
    void updateAppointment(Appointment appointment);
    void deleteAppointment(int id);
}
