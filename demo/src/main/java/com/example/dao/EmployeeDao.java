package com.example.dao;

import com.example.entity.Employee;

import java.sql.SQLException;
import java.util.List;

public interface EmployeeDao {
    void add(Employee employee) throws SQLException, ClassNotFoundException;

    void modify(Employee employee) throws SQLException, ClassNotFoundException;

    void remove(String essn) throws SQLException, ClassNotFoundException;

    Employee getById(String essn) throws SQLException, ClassNotFoundException;

    List<Employee> getAll(String sql) throws SQLException, ClassNotFoundException;
}
