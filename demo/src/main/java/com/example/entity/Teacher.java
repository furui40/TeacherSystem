package com.example.entity;

public class Teacher {private int teacherID;
    private int userID;
    private String name;
    private String email;
    private String profession;
    private String bio;

    public Teacher() {
    }

    public Teacher(int teacherID, int userID, String name, String email, String profession, String bio) {
        this.teacherID = teacherID;
        this.userID = userID;
        this.name = name;
        this.email = email;
        this.profession = profession;
        this.bio = bio;
    }

    public int getTeacherID() {return teacherID;}

    public void setTeacherID(int teacherID) {this.teacherID = teacherID;}

    public int getUserID() {return userID;}

    public void setUserID(int userID) {this.userID = userID;}

    public String getName() {return name;}

    public void setName(String name) {this.name = name;}

    public String getEmail() {return email;}

    public void setEmail(String email) {this.email = email;}

    public String getProfession() {return profession;}

    public void setProfession(String profession) {this.profession = profession;}

    public String getBio() {return bio;}

    public void setBio(String bio) {this.bio = bio;}
}
