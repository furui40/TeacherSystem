package com.example.dao.impl;

import com.example.dao.EmployeeDao;
import com.example.db.DBUtil;

import com.example.entity.Employee;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDaoImpl implements EmployeeDao {


    @Override
    public void add(Employee employee) throws SQLException, ClassNotFoundException {
        DBUtil dbUtil = new DBUtil();
        String name = employee.getName();
        String essn = employee.getEssn();
        String address = employee.getAddress();
        Integer salary = employee.getSalary();
        String superssn = employee.getSuperssn();
        Integer dno = employee.getDno();
        dbUtil.executeUpdate("Insert into employee(ENAME,ESSN,ADDRESS,SALARY,SUPERSSN,DNO) value ('" +name+ "','" +essn+ "','" +address+ "','" +salary+ "','" +superssn+ "','" +dno+ "')");
        dbUtil.close();
    }


    @Override
    public void modify(Employee employee) throws SQLException, ClassNotFoundException {

        DBUtil dbUtil = new DBUtil();
        String name = employee.getName();
        String essn = employee.getEssn();
        String address = employee.getAddress();
        Integer salary = employee.getSalary();
        String superssn = employee.getSuperssn();
        Integer dno = employee.getDno();

        dbUtil.executeUpdate("update employee set ENAME = '" + name + "', ADDRESS = '" + address + "', SALARY = " + salary + ", SUPERSSN = '" + superssn + "', DNO = " + dno + " WHERE ESSN = '" + essn + "'");

        dbUtil.close();
    }

    @Override
    public void remove(String essn) throws SQLException, ClassNotFoundException {
        DBUtil dbUtil = new DBUtil();
        dbUtil.executeUpdate("delete from employee where ESSN ='"+essn+"' ");
        dbUtil.close();

    }

    @Override
    public Employee getById(String essn) throws SQLException, ClassNotFoundException {
        DBUtil dbUtil = new DBUtil();
        String sql = "select * from employee where ESSN = '" + essn + "'";
        ResultSet resultSet = dbUtil.executeQuery(sql);
        String name ;
        String address;
        Integer salary ;
        String superssn ;
        Integer dno ;
        Employee employee = new Employee();

        try {
            if(resultSet.next()){
                essn = resultSet.getString("ESSN");
                name = resultSet.getString("ENAME");
                address = resultSet.getString("ADDRESS");
                salary = resultSet.getInt("SALARY");
                superssn = resultSet.getString("SUPERSSN");
                dno = resultSet.getInt("DNO");
                employee = new Employee(name,essn,address,salary,superssn,dno);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            dbUtil.close();
            return employee;
        }

    }

    @Override
    public List<Employee> getAll(String sql) throws SQLException, ClassNotFoundException {
        List<Employee> employeeList = new ArrayList<>();
        DBUtil dbUtil = new DBUtil();
        ResultSet resultSet = dbUtil.executeQuery(sql);
        String name ;
        String address;
        Integer salary ;
        String superssn ;
        Integer dno ;
        String essn;
        Employee employee = new Employee();
        try {
            while(resultSet.next()){
                essn = resultSet.getString("ESSN");
                name = resultSet.getString("ENAME");
                address = resultSet.getString("ADDRESS");
                salary = resultSet.getInt("SALARY");
                superssn = resultSet.getString("SUPERSSN");
                dno = resultSet.getInt("DNO");

                employeeList.add(new Employee(name,essn,address,salary,superssn,dno));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            dbUtil.close();
            return employeeList;
        }
    }





}
