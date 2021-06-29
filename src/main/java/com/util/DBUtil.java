package com.util;

import java.sql.*;

public class DBUtil {
    private static String driver="com.mysql.cj.jdbc.Driver";
    private static String url="jdbc:mysql://localhost:3306/javawebdemo";
    private static String user="root";
    private static String pswd="lwr123321";

    //驱动加载，mysql-connector-java-8.0.24.jar
    static {
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }

    //连接对象
    public static Connection getConnection() throws SQLException {
        Connection connection = DriverManager.getConnection(url, user, pswd);
        return connection;
    }

    //关闭流
    public static void close(ResultSet rs,Statement st,Connection connection){
        try {
            if(rs!=null){
                rs.close();
            }
            if(st!=null){
                st.close();
            }
            if(connection!=null){
                connection.close();
            }

        }catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
    public static void close(PreparedStatement pst,Connection connection){
        close(null,pst,connection);
    }
}
