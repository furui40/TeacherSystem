package com.example.dao.impl;

import com.example.dao.TeachersDao;
import com.example.entity.Teacher;
import com.example.db.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class TeachersDaoImpl implements TeachersDao {
    @Override
    public void saveTeacher(Teacher teacher) {
        String sql = "INSERT INTO Teachers (UserID, Name, Email, Profession, Bio) VALUES (?, ?, ?, ?, ?)";
        try {
            DBUtil.executeUpdate(sql, teacher.getUserID(), teacher.getName(), teacher.getEmail(), teacher.getProfession(), teacher.getBio());
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }
    }

    @Override
    public Teacher getTeacherById(int id) {
        String sql = "SELECT * FROM Teachers WHERE TeacherID = ?";
        Teacher teacher = null;

        try {
            ResultSet rs = DBUtil.executeQuery(sql, id);
            if (rs.next()) {
                teacher = new Teacher();
                teacher.setTeacherID(rs.getInt("TeacherID"));
                teacher.setUserID(rs.getInt("UserID"));
                teacher.setName(rs.getString("Name"));
                teacher.setEmail(rs.getString("Email"));
                teacher.setProfession(rs.getString("Profession"));
                teacher.setBio(rs.getString("Bio"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }

        return teacher;
    }

    @Override
    public Teacher getTeacherByUserId(int userId) {
        String sql = "SELECT * FROM Teachers WHERE UserID = ?";
        Teacher teacher = null;

        try {
            ResultSet rs = DBUtil.executeQuery(sql, userId);
            if (rs.next()) {
                teacher = new Teacher();
                teacher.setTeacherID(rs.getInt("TeacherID"));
                teacher.setUserID(rs.getInt("UserID"));
                teacher.setName(rs.getString("Name"));
                teacher.setEmail(rs.getString("Email"));
                teacher.setProfession(rs.getString("Profession"));
                teacher.setBio(rs.getString("Bio"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }

        return teacher;
    }

    @Override
    public Teacher getTeacherByName(String name) {
        String sql = "SELECT * FROM Teachers WHERE Name = ?";
        Teacher teacher = null;

        try {
            ResultSet rs = DBUtil.executeQuery(sql, name);
            if (rs.next()) {
                teacher = new Teacher();
                teacher.setTeacherID(rs.getInt("TeacherID"));
                teacher.setUserID(rs.getInt("UserID"));
                teacher.setName(rs.getString("Name"));
                teacher.setEmail(rs.getString("Email"));
                teacher.setProfession(rs.getString("Profession"));
                teacher.setBio(rs.getString("Bio"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }

        return teacher;
    }

    @Override
    public List<Teacher> getAllTeachers() {
        String sql = "SELECT * FROM Teachers";
        List<Teacher> teachers = new ArrayList<>();

        try {
            ResultSet rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                Teacher teacher = new Teacher();
                teacher.setTeacherID(rs.getInt("TeacherID"));
                teacher.setUserID(rs.getInt("UserID"));
                teacher.setName(rs.getString("Name"));
                teacher.setEmail(rs.getString("Email"));
                teacher.setProfession(rs.getString("Profession"));
                teacher.setBio(rs.getString("Bio"));
                teachers.add(teacher);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }

        return teachers;
    }

    @Override
    public List<Teacher> getTeachersByMajor(String major) {
        String sql = "SELECT * FROM Teachers WHERE Profession = ?";
        List<Teacher> teachers = new ArrayList<>();

        try {
            ResultSet rs = DBUtil.executeQuery(sql, major);
            while (rs.next()) {
                Teacher teacher = new Teacher();
                teacher.setTeacherID(rs.getInt("TeacherID"));
                teacher.setUserID(rs.getInt("UserID"));
                teacher.setName(rs.getString("Name"));
                teacher.setEmail(rs.getString("Email"));
                teacher.setProfession(rs.getString("Profession"));
                teacher.setBio(rs.getString("Bio"));
                teachers.add(teacher);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }

        return teachers;
    }

    @Override
    public void updateTeacher(Teacher teacher) {
        String sql = "UPDATE Teachers SET UserID = ?, Name = ?, Email = ?, Profession = ?, Bio = ? WHERE TeacherID = ?";
        try {
            DBUtil.executeUpdate(sql, teacher.getUserID(), teacher.getName(), teacher.getEmail(), teacher.getProfession(), teacher.getBio(), teacher.getTeacherID());
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }
    }

    @Override
    public void deleteTeacher(int id) {
        String sql = "DELETE FROM Teachers WHERE TeacherID = ?";
        try {
            DBUtil.executeUpdate(sql, id);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }
    }
}
