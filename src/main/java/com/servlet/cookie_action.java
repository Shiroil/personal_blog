package com.servlet;

import com.dao.UserDao;
import com.dao.impl.UserDaolmpl;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class cookie_action extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDao userDao = new UserDaolmpl();
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        HttpSession session = req.getSession();
        Cookie[] cookies = req.getCookies();
        String un_cookie = null;
        if(cookies != null){
            for(Cookie cookie :cookies){
                if("username".equals(cookie.getName())){
                    un_cookie = cookie.getValue();//获取cookie中的用户名
                }
            }
            if(userDao.check_power(un_cookie)){
                req.setAttribute("username", un_cookie);
                session.setAttribute("username_always", un_cookie);//把用户名存入session
                session.setAttribute("flag", "0");//用于判断是否进行搜索
                req.getRequestDispatcher("/manage/article_manage2.jsp").forward(req, resp);
            }
            else if(userDao.check_if_username(un_cookie)){//如果cookie中用户名存在就登陆成功
                req.setAttribute("username", un_cookie);
                session.setAttribute("username_always", un_cookie);//把用户名存入session
                req.getRequestDispatcher("/SecondPage/tipe1.jsp").forward(req, resp);
            }
            else{
                req.getRequestDispatcher("/FirstPage/login.jsp").forward(req, resp);
            }
        }
        else {
            req.getRequestDispatcher("/FirstPage/login.jsp").forward(req, resp);
        }
    }
}
