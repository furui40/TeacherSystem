package com.example.dao;

import com.example.entity.Student;
import java.util.List;

public interface StudentDao {
    void addStudent(Student student);
    void updateStudent(Student student);
    void deleteStudent(int studentId);
    Student getStudentById(int studentId);
    List<Student> getAllStudents();
    List<Student> getStudentsByName(String name);
    List<Student> getStudentsByEmail(String email);
    int getStudentIdByUserId(int userId); // 新增函数：根据userID获取studentID
}
