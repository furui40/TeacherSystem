package com.example.entity;

import java.util.Date;

public class Research {private int researchID;
    private int teacherID;
    private String title;
    private String description;
    private Date date;

    public Research() {
    }

    public Research(int researchID, int teacherID, String title, String description, Date date) {
        this.researchID = researchID;
        this.teacherID = teacherID;
        this.title = title;
        this.description = description;
        this.date = date;
    }

    public int getResearchID() {return researchID;}

    public void setResearchID(int researchID) {this.researchID = researchID;}

    public int getTeacherID() {return teacherID;}

    public void setTeacherID(int teacherID) {this.teacherID = teacherID;}

    public String getTitle() {return title;}

    public void setTitle(String title) {this.title = title;}

    public String getDescription() {return description;}

    public void setDescription(String description) {this.description = description;}

    public Date getDate() {return date;}

    public void setDate(Date date) {this.date = date;}
}
