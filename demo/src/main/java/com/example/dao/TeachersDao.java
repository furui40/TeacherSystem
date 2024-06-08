package com.example.dao;

import com.example.entity.Teacher;

import java.util.List;

public interface TeachersDao {
    void saveTeacher(Teacher teacher);
    Teacher getTeacherById(int id);
    Teacher getTeacherByUserId(int userId);
    List<Teacher> getAllTeachers();
    List<Teacher> getTeachersByMajor(String major); // New method declaration
    void updateTeacher(Teacher teacher);
    void deleteTeacher(int id);
}
