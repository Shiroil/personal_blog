<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dao.OperaDao" %>
<%@ page import="com.dao.impl.OperaDaoImpl" %>
<!DOCTYPE html>

<html lang="b">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <title>讨论</title>
    <link type="text/css" href="${pageContext.request.contextPath}/css/styleThesis1.css" rel="stylesheet" />
    <script typet="text/javascript" src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>

<body>
<%
    String articleid = request.getParameter("articleid");
    System.out.println(articleid);
    OperaDao operaDao = new OperaDaoImpl();
    List<String> list_article = new ArrayList<String>();
    list_article = operaDao.get_article(articleid);
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
            <a href='/SecondPage/tipe3.jsp'><span>chat</span></a>

        </div>

    </div>
</div>
<%
    System.out.println(list_article.get(0));
%>
<form name="form" id="form" action="applaud" method="post">
    <input type=hidden name="info" value="<%=list_article.get(0)%>">
</form>
<!-- 下面实现留言板功能 -->
<div class="mainframe">
    <div class="title"><%=list_article.get(1)%></div>
    <div class="message"><%=list_article.get(3)%></div>
    <div class="info">
        文章内容<br>
        <%=list_article.get(2)%>
    </div>

    <span id="goodSpan" onclick="sendGood(<%=list_article.get(0)%>)">
        <img src="/img/good.jpg" style="width: 25px; height: 25px;" />
    </span>
    <span id="good"></span>

    <span id="badSpan" onclick="sendBad()">
        <img src="/img/good.jpg" style="width: 25px; height: 25px; transform: rotate(180deg);" />
    </span>
    <span id="bad"></span>


</div>

<script>
    /*点赞的数量：*/
    document.getElementById("good").innerText = "";
    var good = document.getElementById("good").textContent;

    document.getElementById("bad").innerText  = "";
    var bad = document.getElementById("bad").textContent;
    window.onload = function(){
        if (good == "") {
            document.getElementById("good").innerText = <%=list_article.get(4)%>;
        }
        if (bad == "") {
            bad = 0;
            document.getElementById("bad").innerText = 0;
        }
    }
    /*点赞的数量：*/
    function sendGood(articleid){
        bad = parseInt(bad) + 1;
        document.getElementById("form").submit();
        document.getElementById("good").innerText = good;

        document.getElementById("goodSpan").onclick = function(e){
            e.preventDefault();
            e.stopImmediatePropagation();
        }
    }


    /*踩的数量：*/
    function sendBad(){
        bad = parseInt(bad) + 1;
        document.getElementById("bad").innerText = bad;
        document.getElementById("badSpan").onclick = function(e){
            e.preventDefault();
            e.stopImmediatePropagation();
        }
    }
</script>
</body>

</html>