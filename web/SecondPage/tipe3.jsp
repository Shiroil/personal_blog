<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dao.OperaDao" %>
<%@ page import="com.dao.impl.OperaDaoImpl" %>
<!DOCTYPE html>

<html lang="b">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath();%>

<head>
    <title>讨论</title>
    <link type="text/css" href="${pageContext.request.contextPath}/css/styletipe3.css" rel="stylesheet" />
</head>

<body>
<%
    OperaDao operaDao = new OperaDaoImpl();
    List<List<String>> comments = new ArrayList<List<String>>();
    comments = operaDao.get_comment("1");
    System.out.println(comments.size());
    String username = session.getAttribute("username_always").toString();
    request.setAttribute("username", username);
%>
<div class="home">
    <div class="content1">
        <div class="stars"></div>
        <img class="bgc" src="/img/a1.jpg" width="100%" alt="">
        <img class="icon" src="/img/like.png" alt="">
        <a href="/quit">
            <img class="break" src="/img/reback.png"  alt="">
        </a>
        <div class='ribbon'>
            <a href='/SecondPage/tipe1.jsp'><span>Home</span></a>
            <a href='/SecondPage/tipe2.jsp'><span>Thesis</span></a>
            <a href='/SecondPage/tipe3.jsp'><span>Chat</span></a>

        </div>

    </div>
</div>
<!-- 下面实现留言板功能 -->
<div class="mainframe">
    <div class="title">留言板</div>
    <div class="message">主人寄语</div>
    <div class="info">
        这是主人留下的寄语~
    </div>
    <form action="<%=path%>/comment" method="get" id="form1">
        <div class="content" contenteditable="true">
            <textarea class="content" id="content" name="content" contenteditable="true"></textarea>
        </div>
    </form>
    <input type="button" name="submit" value="发表" class="subbtn" onclick="send_comment()">
    <div class="numofmessage">留言(<%=comments.size()%>)</div>
    <!-- 下面是留言区 -->
    <div class="msgFrame">
        <c:forEach var="comment" items="<%=comments%>">
            <div class="content_1">
                  <img class="name" src="${comment.get(3)}.jpg" alt="photo">
                  <div class="mainInfo">
                      <div class="userId">
                          <a href="#">${comment.get(0)}</a>
                      </div>
                      <div class="conInfo">
                          ${comment.get(1)}
                      </div>
                      <div class="time">${comment.get(2)}</div>
                  </div>
            </div>
        </c:forEach>


    </div>
</div>
</body>
<script>
    function send_comment(){
        var a = document.getElementById("content");

        document.getElementById("form1").submit();
        return ;
    }
</script>
</html>