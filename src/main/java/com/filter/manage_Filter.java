package com.filter;

import com.dao.UserDao;
import com.dao.impl.UserDaolmpl;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "manage_Filter")
public class manage_Filter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    boolean manage_check = false;
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        System.out.println("filter");
        UserDao userDao = new UserDaolmpl();
        HttpServletRequest hreq = (HttpServletRequest) request;
        Cookie[] cookies = hreq.getCookies();
        boolean flag = false;//防止没有cookie能进入管理员界面的漏洞
        if(cookies != null)//检查cookie中存入的用户是否为管理员
            for (Cookie cookie : cookies){
                if("username".equals(cookie.getName())){
                    String username = cookie.getValue();
                    if(userDao.check_power(username)){
                        manage_check = true;
                    }
                    else manage_check = false;
                    flag = true;
                }
            }
        if(!flag)
            manage_check = false;
        System.out.println("判断管理员manage=" + manage_check);
        if(!manage_check)//是则不做任何拦截，不是则返回初始页面
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        chain.doFilter(request, response);
    }
}
