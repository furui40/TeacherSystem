package com.example.dao.impl;

import com.example.dao.AdminDao;
import com.example.db.DBUtil;
import com.example.entity.Admin;

import java.sql.SQLException;

public class AdminDaoImpl implements AdminDao {
    @Override
    public void modify(Admin admin) throws SQLException, ClassNotFoundException {

        DBUtil dbUtil = new DBUtil();
        String sid = admin.getUid();
        String spwd = admin.getPwd();

        dbUtil.executeUpdate("update admin set pwd = '" + spwd + "'  where uid = '"+sid+"'  ");

        dbUtil.close();

    }

}
