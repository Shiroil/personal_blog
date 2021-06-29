package com.servlet;

import com.dao.OperaDao;
import com.dao.impl.OperaDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class applaud_action extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OperaDao operaDao = new OperaDaoImpl();
        HttpSession session = req.getSession();
        String username = session.getAttribute("username_always").toString();
        String art_id = req.getParameter("info");
        boolean if_applaud =operaDao.check_applaud(art_id, username);
        if(if_applaud){
            req.setAttribute("good", -1);
            System.out.println("-1");
            operaDao.article_update_sub(art_id);
        }
        else{
            System.out.println("+1");
            operaDao.article_update_add(art_id);
            req.setAttribute("good", 1);
        }
//        req.getRequestDispatcher("/ThirdPage/Thesis1.jsp").forward(req, resp);
        resp.sendRedirect("/Inarticle?articleid=" + art_id);
    }
}
