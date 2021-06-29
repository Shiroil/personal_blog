package com.dao.impl;
import com.dao.UserDao;
import com.domain.User;
import com.util.DBUtil;
import com.util.*;
import sun.security.util.Password;

import java.sql.*;
public class UserDaolmpl implements UserDao {

    /**
     * @description 检查用户名是否已被使用
     * @param username
     * @return 已被使用返回false 未被使用返回true
     */
    public boolean check_if_repeat(String username) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            con = DBUtil.getConnection();
            String sql = "SELECT username FROM user WHERE username = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()){
                return false;
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.close(rs, ps, con);
        }
        return true;
    }

    /**
     * @description 把新用户存入数据库
     * @param user
     * @return 存入成功返回true 存入失败返回false（用户名已被使用的情况）
     */

    public boolean save(User user) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        if(check_if_repeat(user.getUsername()))
        try{
            con = DBUtil.getConnection();
            String sql = "insert into user(username,password,power,picture) value(?,?,?,?)";
            ps = con.prepareStatement(sql);
            ps.setString(1,user.getUsername());
            ps.setString(2,user.getPassword());
            ps.setString(3,"0");
            ps.setString(4,"/img/default");
            int result = ps.executeUpdate();
            System.out.println("插入成功" + user.getUsername());
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        finally {
            DBUtil.close(rs, ps, con);
        }
        else return false;
        return true;
    }

    /**
     * @description 登录认证
     * @param username
     * @param password
     * @return 登录成功返回true 登录失败返回false
     */
    public boolean checkLogin(String username, String password) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean flag = false;
        try{
            con = DBUtil.getConnection();
            String sql = "select password from user where username = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while(rs.next()) {
                if(rs.getObject("password").equals(password) )
                    flag = true;
            }

        } catch (Exception e){
            e.printStackTrace();
        }
        finally {
            DBUtil.close(rs, ps, con);
        }
        return flag;
    }

    /**
     * @description 检测用户名是否存在
     * @param username 用户名
     * @return 存在返回true 不存在返回false
     */
    public boolean check_if_username(String username) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            con = DBUtil.getConnection();
            String sql = "SELECT username from user where username = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while(rs.next()){
                if(rs.getObject("username").equals(username))
                    return true;
            }
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }finally {
            DBUtil.close(rs, ps, null);
        }
        return false;
    }

    /**
     * @description 获取用户昵称
     * @param username
     * @return
     */
    public String get_name(String username) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            con = DBUtil.getConnection();
            String sql = "SELECT name FROM USER WHERE username = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()){
                return rs.getObject("name").toString();
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.close(rs, ps, con);
        }
        return null;
    }

    /**
     * @description 检测是否管理员
     * @param username
     * @return boolean
     */
    public boolean check_power(String username) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            con = DBUtil.getConnection();
            String sql = "SELECT power FROM user WHERE username = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()){
                if(rs.getObject("power").toString().equals("1"))
                return true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.close(rs, ps, con);
        }
        return false;
    }
}
