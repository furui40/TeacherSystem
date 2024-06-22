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
    public int saveUser(User user) {
        String sql = "INSERT INTO Users (Username, Password, UserType) VALUES (?, ?, ?)";
        int userID = -1; // ��ʼ��Ϊ-1����ʾ����ʧ��

        try {
            // ִ�в������������ȡ���ɵ�����
            userID = DBUtil.executeUpdateAndGetGeneratedKey(sql, user.getUsername(), user.getPassword(), user.getUserType().name());

            if (userID == -1) {
                throw new SQLException("Creating user failed, no ID obtained.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userID; // ���ز����UserID���������ʧ���򷵻�-1
    }

    @Override
    public int createUser(User user) {
        String checkSql = "SELECT COUNT(*) FROM Users WHERE Username = ?";
        String insertSql = "INSERT INTO Users (UserID, Username, Password, UserType) VALUES (?, ?, ?, ?)";
        int result = 0;

        try {
            // ����û����Ƿ��Ѵ���
            ResultSet rs = DBUtil.executeQuery(checkSql, user.getUsername());
            if (rs.next() && rs.getInt(1) > 0) {
                System.out.println("�û����Ѵ���: " + user.getUsername());
                return -1; // �û����Ѵ���
            }

            // �����û�
            result = DBUtil.executeUpdate(insertSql, user.getUserID(), user.getUsername(), user.getPassword(), user.getUserType().toString());
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }

        return result;
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


