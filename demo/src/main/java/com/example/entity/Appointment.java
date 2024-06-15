package com.example.entity;

import java.util.Date;

public class Appointment {
    private int appointmentID;
    private int studentID;
    private int teacherID;
    private Date date;
    private String place;
    private String appointmentTime;

    public Appointment() {
    }

    public Appointment(int studentID, int teacherID, Date date, String place, String appointmentTime) {
        this.studentID = studentID;
        this.teacherID = teacherID;
        this.date = date;
        this.place = place;
        this.appointmentTime = appointmentTime;
    }

    public int getAppointmentID() {
        return appointmentID;
    }

    public void setAppointmentID(int appointmentID) {
        this.appointmentID = appointmentID;
    }

    public int getStudentID() {
        return studentID;
    }

    public void setStudentID(int studentID) {
        this.studentID = studentID;
    }

    public int getTeacherID() {
        return teacherID;
    }

    public void setTeacherID(int teacherID) {
        this.teacherID = teacherID;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public String getAppointmentTime() {
        return appointmentTime;
    }

    public void setAppointmentTime(String appointmentTime) {
        this.appointmentTime = appointmentTime;
    }
}
