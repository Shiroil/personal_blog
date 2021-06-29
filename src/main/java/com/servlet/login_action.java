package com.servlet;

import com.dao.UserDao;
import com.dao.impl.UserDaolmpl;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

public class login_action extends HttpServlet {

    public boolean login(String username, String password){
        UserDao login = new UserDaolmpl();
        return login.checkLogin(username, password);//检测用户名密码是否正确 正确：true 错误：false
    }

    public boolean if_master(String username){
        UserDao master = new UserDaolmpl();
        return master.check_power(username);//检测是否管理员
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String code = req.getParameter("code1");
        String code_input = req.getParameter("code_input");
        HttpSession session = req.getSession();
        session.setAttribute("username_always", username);
        session.setAttribute("flag", "0");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
//                System.out.println(username);
//        System.out.println(password);
        if(username.equals("") || password.equals("")){
            req.setAttribute("login_error", "请输入用户名及密码");
            req.getRequestDispatcher("/FirstPage/login.jsp").forward(req, resp);
            return ;
        }
        if(!code.equals(code_input)){
            req.setAttribute("login_error", "验证码错误！");
            req.getRequestDispatcher("/FirstPage/login.jsp").forward(req, resp);
            return ;
        }
        if(login(username, password)){//检测用户名密码是否正确
            Cookie cookie = new Cookie("username", username);//新建用户名的cookie
            cookie.setMaxAge(24*60*60);//设置cookie时间
            resp.addCookie(cookie);
            if(if_master(username))
                req.getRequestDispatcher("/manage/article_manage2.jsp").forward(req, resp);
            else
                req.getRequestDispatcher("/SecondPage/tipe1.jsp").forward(req, resp);
        }else{
            req.setAttribute("username_used", username);
            req.setAttribute("login_error", "用户名或密码错误，请重新输入！");
            req.getRequestDispatcher("/FirstPage/login.jsp").forward(req, resp);
        }



    }
}
