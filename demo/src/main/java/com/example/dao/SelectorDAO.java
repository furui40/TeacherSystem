package com.example.dao;

import com.example.entity.DepartSalary;
import com.example.entity.Department;
import com.example.entity.Employee;


import java.sql.SQLException;
import java.util.List;

public interface SelectorDAO {

    List<Department> selectAll(String sql) throws SQLException, ClassNotFoundException;

    List<String> selectGroup(String depart) throws SQLException, ClassNotFoundException;

    List<DepartSalary> selectSalary(String sql) throws SQLException, ClassNotFoundException;
}
