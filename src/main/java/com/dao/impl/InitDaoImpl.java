package com.dao.impl;
import com.dao.InitDao;
import com.util.DBUtil;
import com.dao.OperaDao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class InitDaoImpl implements InitDao {
    public boolean init_dao(){
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        OperaDao operation_dao = new OperaDaoImpl();
        operation_dao.create_database("javawebdemo");
        return true;
    }
}
