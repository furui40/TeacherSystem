package com.example.dao;

import java.sql.SQLException;

public interface LoginDao {
    boolean login(String uid, String pwd) throws SQLException, ClassNotFoundException;
}
