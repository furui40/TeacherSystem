package com.example.entity;

import java.util.Date;

public class Appointment {
    private int appointmentID;
    private int studentID;
    private int teacherID;
    private Date date;
    private Date time;

    public Appointment() {
    }

    public Appointment(int appointmentID, int studentID, int teacherID, Date date, Date time) {
        this.appointmentID = appointmentID;
        this.studentID = studentID;
        this.teacherID = teacherID;
        this.date = date;
        this.time = time;
    }

    public int getAppointmentID() {return appointmentID;}

    public void setAppointmentID(int appointmentID) {this.appointmentID = appointmentID;}

    public int getStudentID() {return studentID;}

    public void setStudentID(int studentID) {this.studentID = studentID;}

    public int getTeacherID() {return teacherID;}

    public void setTeacherID(int teacherID) {this.teacherID = teacherID;}

    public Date getDate() {return date;}

    public void setDate(Date date) {this.date = date;}

    public Date getTime() {return time;}

    public void setTime(Date time) {this.time = time;}
}

