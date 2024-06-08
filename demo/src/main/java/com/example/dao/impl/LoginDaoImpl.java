package com.example.dao.impl;

import com.example.dao.LoginDao;
import com.example.db.DBUtil;

import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDaoImpl implements LoginDao {

    @Override
    public boolean login(String uid, String pwd) throws SQLException, ClassNotFoundException {
        DBUtil dbUtil = new DBUtil();
        String sql = "select count(*) from admin where pwd = '"+ pwd +"' and uid ='"+uid+"'";
        System.out.println(sql);
        ResultSet rs = dbUtil.executeQuery(sql);
        int count = 0;
        try {
            if(rs.next()){
                count = rs.getInt(1);
            }
        }
        catch(SQLException e) {
            e.printStackTrace() ;
            throw new RuntimeException(e);
        }
        finally{
            System.out.println(count);
            dbUtil.close();
            return count == 1?true : false;
        }
    }

}
