package com.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.dao.UserDao;
import com.dao.impl.UserDaolmpl;
import com.domain.User;

public class register_action extends HttpServlet {

    public boolean register(String username, String password) {
        User users = new User();
        users.setUsername(username);
        users.setPassword(password);
        UserDao register = new UserDaolmpl();
        if(!register.save(users))//查询用户名是否已被注册
            return false;
        else return true;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String username = req.getParameter("username");
        System.out.println("username:" + username);
        String password = req.getParameter("password");
        System.out.println("password:" + password);
        if(register(username, password))//查询用户名是否已被注册
            req.getRequestDispatcher("/FirstPage/login.jsp").forward(req, resp);
        else{
            req.setAttribute("register_error", "用户名已被使用！");
            req.setAttribute("username_used", username);
            req.getRequestDispatcher("/FirstPage/register.jsp").forward(req, resp);
        }
    }
}
