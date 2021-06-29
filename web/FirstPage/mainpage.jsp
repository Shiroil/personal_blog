<%--
  Created by IntelliJ IDEA.
  User: Shiro
  Date: 2021/5/20
  Time: 14:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.dao.UserDao"%>
<%@ page import="com.dao.impl.UserDaolmpl" %>
<html>
<head>
    <title>${username}</title>
</head>
<body>
<%
    UserDao userDao = new UserDaolmpl();
    out.println(userDao.check_if_repeat(request.getAttribute("username").toString()));
    String a = (String) request.getAttribute("username");
%>
<%= a %>
<button id="quit" value="退出" onclick=""></button>
</body>
</html>

<script>
</script>