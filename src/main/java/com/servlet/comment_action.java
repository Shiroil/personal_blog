package com.servlet;

import com.dao.OperaDao;
import com.dao.impl.OperaDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class comment_action extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OperaDao operaDao = new OperaDaoImpl();
        String context = req.getParameter("content");//获取文本框中的值
        Cookie cookies[] = req.getCookies();
        String username = "";
        for(Cookie cookie : cookies){
            if(cookie.getName().equals("username"))
            username = cookie.getValue();//读取cookie中存入的username
        }
        System.out.println(username);
        operaDao.comment("1", username, context);//把评论存入数据库
        resp.sendRedirect("/SecondPage/tipe3.jsp");//重定向
    }

}
