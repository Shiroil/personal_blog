package com.servlet;

import com.dao.OperaDao;
import com.dao.impl.OperaDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class delete_a_action extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OperaDao operaDao = new OperaDaoImpl();
        String articleid = req.getParameter("articleid");
        operaDao.delete_article(articleid);
        req.getRequestDispatcher("/manage/article_read.jsp").forward(req, resp);
    }
}
