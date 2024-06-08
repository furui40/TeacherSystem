package com.example.dao.impl;

import com.example.dao.UsersDao;
import com.example.db.DBUtil;
import com.example.entity.User;
import com.example.entity.UserType;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UsersDaoImpl implements UsersDao {

    @Override
    public void saveUser(User user) {
        String sql = "INSERT INTO Users (Username, Password, UserType) VALUES (?, ?, ?)";
        try {
            DBUtil.executeUpdate(sql, user.getUsername(), user.getPassword(), user.getUserType().name());
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }
    }

    @Override
    public User getUserById(int id) {
        String sql = "SELECT * FROM Users WHERE UserID = ?";
        User user = null;

        try {
            ResultSet rs = DBUtil.executeQuery(sql, id);
            if (rs.next()) {
                user = new User();
                user.setUserID(rs.getInt("UserID"));
                user.setUsername(rs.getString("Username"));
                user.setPassword(rs.getString("Password"));
                user.setUserType(UserType.valueOf(rs.getString("UserType")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }

        return user;
    }

    @Override
    public User getUserByUsername(String username) {
        String sql = "SELECT * FROM Users WHERE Username = ?";
        User user = null;

        try {
            ResultSet rs = DBUtil.executeQuery(sql, username);
            if (rs.next()) {
                user = new User();
                user.setUserID(rs.getInt("UserID"));
                user.setUsername(rs.getString("Username"));
                user.setPassword(rs.getString("Password"));
                user.setUserType(UserType.valueOf(rs.getString("UserType")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }

        return user;
    }

    @Override
    public List<User> getAllUsers() {
        String sql = "SELECT * FROM Users";
        List<User> users = new ArrayList<>();

        try {
            ResultSet rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                User user = new User();
                user.setUserID(rs.getInt("UserID"));
                user.setUsername(rs.getString("Username"));
                user.setPassword(rs.getString("Password"));
                user.setUserType(UserType.valueOf(rs.getString("UserType")));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }

        return users;
    }

    @Override
    public void updateUser(User user) {
        String sql = "UPDATE Users SET Username = ?, Password = ?, UserType = ? WHERE UserID = ?";
        try {
            DBUtil.executeUpdate(sql, user.getUsername(), user.getPassword(), user.getUserType().name(), user.getUserID());
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }
    }

    @Override
    public void deleteUser(int id) {
        String sql = "DELETE FROM Users WHERE UserID = ?";
        try {
            DBUtil.executeUpdate(sql, id);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }
    }
}


