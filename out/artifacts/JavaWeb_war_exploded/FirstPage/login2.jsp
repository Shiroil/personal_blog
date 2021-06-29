<!DOCTYPE html>
<html lang="b">
<%--
  Created by IntelliJ IDEA.
  User: Shinelon
  Date: 2021/4/22
  Time: 20:02
  To change this template use File | Settings | File Templates.
--%>

<% String path = request.getContextPath(); %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>登录</title>
    <link type="text/css" href="${pageContext.request.contextPath}/css/stylelogin.css" rel="stylesheet" />
</head>
<body>
<form method="post" id="form" action="<%=path%>/login">
    <div class="reset">
        <span class="reset_title">用户登录</span>
        <div class="reset_input">
            <span>用户名:<input type="text" name="username" value="${username_used}"></span>
            <p></p>
        </div>

        <div class="reset_input">
            <span>密 码 :<input type="password" name="password"></span>
            <p></p>
        </div>
        ${login_error}

        <div class="lobtn_submit">
            <input class="lbtn" type="submit" value="登录" onclick="login_check()">
            <input class="lbtn" type="reset" value="重置">
        </div>
        <div class="lobtn_submit">
            <a href="register.jsp">
                <input class="lbtn_center" value="注册">
            </a>
        </div>
    </div>
</form>
</body>
</html>

<script>
    function login_check(){
        const username = document.getElementById("username").value;
        const password = document.getElementById("password").value;
        document.getElementById("form").submit();
        return ;
    }
</script>
