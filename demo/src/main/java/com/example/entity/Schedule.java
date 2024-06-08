package com.example.entity;

import java.util.Date;

public class Schedule {
    private int scheduleID;
    private int teacherID;
    private Date date;
    private String timeSlot;

    public Schedule() {
    }

    public Schedule(int scheduleID, int teacherID, Date date, String timeSlot) {
        this.scheduleID = scheduleID;
        this.teacherID = teacherID;
        this.date = date;
        this.timeSlot = timeSlot;
    }

    public int getScheduleID() {return scheduleID;}

    public void setScheduleID(int scheduleID) {this.scheduleID = scheduleID;}

    public int getTeacherID() {return teacherID;}

    public void setTeacherID(int teacherID) {this.teacherID = teacherID;}

    public Date getDate() {return date;}

    public void setDate(Date date) {this.date = date;}

    public String getTimeSlot() {return timeSlot;}

    public void setTimeSlot(String timeSlot) {this.timeSlot = timeSlot;}
}
