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
    <title>注册</title>
    <link type="text/css" href="${pageContext.request.contextPath}/css/styleregister.css" rel="stylesheet" />
</head>
<body>
    <form method="post" id="form" action="<%=path%>/register">

    <div class="submit">
        <span class="form_title">用户注册</span>
        <%--    <form maction="${pageContext.request.contextPath}" method="post">--%>
            <div class="form_input">
                <span>用 户 名:<input id="username" value="${username_used}" type="text" name="username"></span>
                <p></p>
            </div>

            <div class="form_input">
                <span>输入密码:<input id="password" value="" type="password" name="password"></span>
                <p></p>
            </div>

            <div class="form_input">
                <span>确认密码:<input id="password2_confirm" type="password" name="password2_confirm"></span>
                <p></p>
            </div>
            ${register_error}

            <div class="btn_submit">
                <input class="btn" type="button" value="注册" onclick="register();">
                <input class="btn" type="reset" value="重置">
            </div>


        <%--    </form>--%>
    </div>

    </form>
</body>
</html>

<script>
    function register(){
        const username = document.getElementById("username").value;
        const pw = document.getElementById("password").value;
        const pw_confirm = document.getElementById("password2_confirm").value;
        if(username == ""){
            alert("请输入用户名！");
            return;
        }
        if(pw == ""){
            alert("请输入密码！");
            return;
        }
        if(pw != pw_confirm){
            alert("密码不一致！");
            return;
        }
        document.getElementById("form").submit();
        return;
    }

</script>