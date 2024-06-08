package com.example.dao;

import com.example.entity.Admin;


import java.sql.SQLException;

public interface AdminDao {
    void modify(Admin admin) throws SQLException, ClassNotFoundException;
}
