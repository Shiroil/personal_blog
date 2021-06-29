package com.servlet;

import com.dao.OperaDao;
import com.dao.impl.OperaDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class search_action extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        boolean flag = false;
        String search_word = req.getParameter("search_use");
        search_word = "%" + search_word + "%";
        OperaDao operaDao = new OperaDaoImpl();
        HttpSession session = req.getSession();
        List<List<String>> list_article = operaDao.search_article(search_word);
        if(list_article != null)
            session.setAttribute("flag", "1");
        req.setAttribute("search_use", search_word);
        req.getRequestDispatcher("/manage/article_read.jsp").forward(req, resp);
    }
}
