package com.dao;
import com.domain.*;
public interface UserDao{
    public boolean check_if_repeat(String username);//查询用户名是否已被注册
    public boolean save(User user);//新用户存入数据库
    public boolean checkLogin(String username,String password);//登录认证
    public boolean check_if_username(String username);//查询用户名是否存在
    public String get_name(String username);//获得用户昵称
    public boolean check_power(String username);//检测是否管理员
}
