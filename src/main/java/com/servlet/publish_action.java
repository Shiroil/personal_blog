package com.servlet;

import com.dao.OperaDao;
import com.dao.impl.OperaDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class publish_action extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OperaDao operaDao = new OperaDaoImpl();
        System.out.println(req.getParameter("content"));
        HttpSession session = req.getSession();
        String username = session.getAttribute("username_always").toString();//获取用户id
        String save = req.getParameter("content");
        int first_check = save.indexOf("@Article_name");//检验
        int second_check = save.indexOf("@Content");
        String article_name = save.substring(first_check+13, second_check);//获取文章标题
        String content = save.substring(second_check+8);//获取文章内容
//        System.out.println("标题"+article_name);
//        System.out.println("内容"+content);
        operaDao.new_article(article_name, username, content);//写入文章
    }
}
