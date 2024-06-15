package com.example.dao.impl;

import com.example.dao.StudentDao;
import com.example.entity.Student;
import com.example.db.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDaoImpl implements StudentDao {

    @Override
    public void addStudent(Student student) {
        String sql = "INSERT INTO students (UserID, Name, Email) VALUES (?, ?, ?)";
        try {
            DBUtil.executeUpdate(sql, student.getUserId(), student.getName(), student.getEmail());
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }
    }

    @Override
    public void updateStudent(Student student) {
        String sql = "UPDATE students SET UserID = ?, Name = ?, Email = ? WHERE StudentID = ?";
        try {
            DBUtil.executeUpdate(sql, student.getUserId(), student.getName(), student.getEmail(), student.getStudentId());
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }
    }

    @Override
    public void deleteStudent(int studentId) {
        String sql = "DELETE FROM students WHERE StudentID = ?";
        try {
            DBUtil.executeUpdate(sql, studentId);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }
    }

    @Override
    public Student getStudentById(int studentId) {
        String sql = "SELECT * FROM students WHERE StudentID = ?";
        Student student = null;

        try {
            ResultSet rs = DBUtil.executeQuery(sql, studentId);
            if (rs.next()) {
                student = new Student();
                student.setStudentId(rs.getInt("StudentID"));
                student.setUserId(rs.getInt("UserID"));
                student.setName(rs.getString("Name"));
                student.setEmail(rs.getString("Email"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }

        return student;
    }

    @Override
    public List<Student> getAllStudents() {
        String sql = "SELECT * FROM students";
        List<Student> students = new ArrayList<>();

        try {
            ResultSet rs = DBUtil.executeQuery(sql);
            while (rs.next()) {
                Student student = new Student();
                student.setStudentId(rs.getInt("StudentID"));
                student.setUserId(rs.getInt("UserID"));
                student.setName(rs.getString("Name"));
                student.setEmail(rs.getString("Email"));
                students.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }

        return students;
    }

    @Override
    public List<Student> getStudentsByName(String name) {
        String sql = "SELECT * FROM students WHERE Name LIKE ?";
        List<Student> students = new ArrayList<>();

        try {
            ResultSet rs = DBUtil.executeQuery(sql, "%" + name + "%");
            while (rs.next()) {
                Student student = new Student();
                student.setStudentId(rs.getInt("StudentID"));
                student.setUserId(rs.getInt("UserID"));
                student.setName(rs.getString("Name"));
                student.setEmail(rs.getString("Email"));
                students.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }

        return students;
    }

    @Override
    public List<Student> getStudentsByEmail(String email) {
        String sql = "SELECT * FROM students WHERE Email LIKE ?";
        List<Student> students = new ArrayList<>();

        try {
            ResultSet rs = DBUtil.executeQuery(sql, "%" + email + "%");
            while (rs.next()) {
                Student student = new Student();
                student.setStudentId(rs.getInt("StudentID"));
                student.setUserId(rs.getInt("UserID"));
                student.setName(rs.getString("Name"));
                student.setEmail(rs.getString("Email"));
                students.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close();
        }

        return students;
    }

    @Override
    public int getStudentIdByUserId(int userId) {
        String sql = "SELECT StudentID FROM Students WHERE UserID = ?";
        int studentId = -1; // 默认值，表示未找到对应的学生ID

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    studentId = rs.getInt("StudentID");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return studentId;
    }
}
