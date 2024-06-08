package com.example.dao.impl;

import com.example.dao.SelectorDAO;
import com.example.db.DBUtil;
import com.example.entity.DepartSalary;
import com.example.entity.Department;
import com.example.entity.Employee;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class SelectorDaoImpl implements SelectorDAO {

    @Override
    public List<Department> selectAll(String sql) throws SQLException, ClassNotFoundException {
        List<Department> departmentsList = new ArrayList<>();
        DBUtil dbUtil = new DBUtil();
        ResultSet resultSet = dbUtil.executeQuery(sql);
        String dname;
        Integer dno = 0;
        String mgrssn;
        Date mgrdate = null;
        String equipment;

        Department department = new Department();

        try {
            while(resultSet.next()){
                dname = resultSet.getString("DNAME");
//                dno = resultSet.getInt("DNO");
                mgrssn = resultSet.getString("MGRSSN");
//                mgrdate = resultSet.getDate("SALARY");
                equipment = resultSet.getString("EQUIPMENT");


                departmentsList.add(new Department(dname,dno,mgrssn,mgrdate,equipment));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            dbUtil.close();
            return departmentsList;
        }


    }

    @Override
    public List<String> selectGroup(String depart) throws SQLException, ClassNotFoundException {
        List<String> nameList = new ArrayList<>();
        DBUtil dbUtil = new DBUtil();
        ResultSet resultSet = dbUtil.executeQuery("SELECT ENAME\n" +
                "FROM EMPLOYEE\n" +
                "WHERE DNO IN (SELECT DNO FROM DEPARTMENT WHERE DNAME = '"+depart+ "')");

        String name;

        try {
            while(resultSet.next()){
                name = resultSet.getString("ENAME");
                nameList.add(name);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            dbUtil.close();
            return nameList;
        }

    }

    @Override
    public List<DepartSalary> selectSalary(String sql) throws SQLException, ClassNotFoundException {

        List<DepartSalary> salaryList = new ArrayList<>();
        DBUtil dbUtil = new DBUtil();
        ResultSet resultSet = dbUtil.executeQuery(sql);

        Integer dno;
        Integer salary;


        try {
            while(resultSet.next()){
                dno= resultSet.getInt("DNO");
                salary = resultSet.getInt("AVERAGE_SALARY");
                salaryList.add(new DepartSalary(dno,salary));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            dbUtil.close();
            return salaryList;
        }
    }
}
