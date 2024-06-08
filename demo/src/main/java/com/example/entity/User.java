package com.example.entity;

public class User {
    private int userID;
    private String username;
    private String password;
    private UserType userType;

    // Constructors
    public User() {
    }

    public User(String username, String password, UserType userType) {
        this.username = username;
        this.password = password;
        this.userType = userType;
    }

    public int getUserID() {return userID;}

    public void setUserID(int userID) {this.userID = userID;}

    public String getUsername() {return username;}

    public void setUsername(String username) {this.username = username;}

    public String getPassword() {return password;}

    public void setPassword(String password) {this.password = password;}

    public UserType getUserType() {return userType;}

    public void setUserType(UserType userType) {this.userType = userType;}
}

