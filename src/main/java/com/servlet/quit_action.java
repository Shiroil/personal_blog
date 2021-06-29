package com.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class quit_action extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cookie[] cookies = req.getCookies();
        if(cookies != null){
            for (Cookie cookie : cookies){
                if("username".equals(cookie.getName())){
                    cookie.setMaxAge(0);
                    cookie.setPath("/");
                    System.out.println("111");
                    resp.addCookie(cookie);
                }
            }
        }
        req.getRequestDispatcher("/").forward(req, resp);
    }
}
