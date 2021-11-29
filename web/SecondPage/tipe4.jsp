<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>

<html lang="b">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <meta charset="utf-8">
    <title>Shiro的空间</title>
    <link rel="icon" sizes="any" mask href="http://qzonestyle.gtimg.cn/qzone/v8/img/Qzone.svg">
    <link type="text/css" href="${pageContext.request.contextPath}/css/styletipe4.css" rel="stylesheet" />
</head>

<body>
    <div class="home">
        <div class="content1">
            <div class="stars"></div>
            <img class="bgc" src="/img/a1.jpg" width="100%" alt="">
            <img class="icon" src="/img/like.png" alt="">
            <%--   后退     --%>
            <img class="break" src="/img/reback.png" alt="">
            <div class='ribbon'>
                <a href='/SecondPage/tipe1.jsp'><span>Home</span></a>
                <a href='/SecondPage/tipe2.jsp'><span>Thesis</span></a>
                <a href='/SecondPage/tipe3.jsp'><span>chat</span></a>

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
        <div class="content" contenteditable="true"></div>
        <input type="button" name="submit" value="发表" class="subbtn">
        <div class="numofmessage">留言(0)</div>
        <!-- 下面是留言区 -->
        <div class="msgFrame">
            <!--  <div class="content_1">
                  <img class="name" src="http://qlogo3.store.qq.com/qzone/1262283870/1262283870/100?1481718124" alt="photo">
                  <div class="mainInfo">
                      <div class="userId"><a href="#">zipple</a></div>
                      <div class="conInfo">
                            这是一条留言。
                         </div>
                      <div class="time">2016-12-19  23:46:11</div>
                 </div> -->

        </div>
    </div>
</body>

</html>
