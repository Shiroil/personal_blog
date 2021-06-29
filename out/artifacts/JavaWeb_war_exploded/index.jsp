<!DOCTYPE html>
<html lang="ee">
<%--
  Created by IntelliJ IDEA.
  User: Shinelon
  Date: 2021/4/22
  Time: 19:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>首页</title>
    <link type="text/css" href="${pageContext.request.contextPath}/css/styleindex.css" rel="stylesheet" />
</head>

<body>
    <h1 align="center" style="color: aliceblue">网站首页</h1>
    <br>
    <p>
      <a href=<%=request.getContextPath()+"/c1"%> style="color: aliceblue">登录</a>
      <a href="FirstPage/register.jsp" style="color: aliceblue">注册</a>
    </p>


</body>
</html>
