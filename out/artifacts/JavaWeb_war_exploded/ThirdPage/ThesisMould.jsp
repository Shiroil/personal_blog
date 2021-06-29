<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>

<html lang="b">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <title>讨论</title>
    <link type="text/css" href="${pageContext.request.contextPath}/css/styleThesisMould.css" rel="stylesheet" />
</head>

<body>
    <div class="home">
        <div class="content1">
            <div class="stars"></div>
            <img class="bgc" src="/img/a1.jpg" width="100%" alt="">
            <img class="icon" src="/img/like.png" alt="">
            <div class='ribbon'>
                <a href='/SecondPage/tipe1.jsp'><span>Home</span></a>
                <a href='/SecondPage/tipe2.jsp'><span>Thesis</span></a>
                <a href='/SecondPage/tipe3.jsp'><span>chat</span></a>

            </div>

        </div>
    </div>
<!-- 下面实现留言板功能 -->
    <div class="mainframe">
        <div class="title">文章标题</div>
        <div class="message">作者名</div>
        <div class="info">
            文章内容
            天空还是一片浅蓝,转眼间东方出现了一道红霞,红霞慢慢地在扩大，
            不大一会就染红了小半边天。颜色红得可爱，又过了一会儿,在那个地
            方出现了太阳的小半边脸。当清晨的阳光洒进我们温馨的寝室，忙碌的
            一天又开始了，闹钟开始响起，每个人睡眼惺忪，从床上爬起，忙忙碌碌
            的穿梭在食堂与教室之间.
        </div>

    </div>
    <%--    <div class="title">留言板</div>--%>
<%--    <div class="message">主人寄语</div>--%>
<%--    <div class="info">--%>
<%--        这是主人留下的寄语~--%>
<%--    </div>--%>
<%--    <div class="content" contenteditable="true">--%>
<%--        <textarea class="content" id="content" name="content" ></textarea>--%>

<%--    </div>--%>
<%--    <input type="button" name="submit" value="发表" class="subbtn">--%>
<%--    <div class="numofmessage">留言(0)</div>--%>
<%--    <!-- 下面是留言区 -->--%>
<%--    <div class="msgFrame">--%>
<%--        <div class="content_1">--%>
<%--            <img class="name" src="/img/like.png" alt="photo">--%>
<%--            <div class="mainInfo">--%>
<%--                <div class="userId">--%>
<%--                    <a href="#">zipple</a>--%>
<%--                </div>--%>
<%--                <div class="conInfo">--%>
<%--                    这是一条留言。--%>
<%--                </div>--%>
<%--                <div class="time">2016-12-19  23:46:11</div>--%>
<%--            </div>--%>
<%--        </div>--%>


<%--    </div>--%>
</body>

</html>