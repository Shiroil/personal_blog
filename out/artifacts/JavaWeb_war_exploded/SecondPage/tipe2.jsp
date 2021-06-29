<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="b">

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.dao.OperaDao" %>
<%@ page import="com.dao.impl.OperaDaoImpl" %>
<%@ page import="com.mysql.cj.PreparedQuery" %>
<head>
    <link type="text/css" href="${pageContext.request.contextPath}/css/styletipe1.css" rel="stylesheet" />
    <link type="text/css" href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" />
    <link type="text/css" href="${pageContext.request.contextPath}/css/layui.css" rel="stylesheet" />
</head>
<body>
<%!
    public int jump_null(List<List<String>> save_articles, int j, int all_of_article){
        OperaDao operaDao = new OperaDaoImpl();
        if(save_articles.size() > all_of_article)
            return 0;
        if(operaDao.get_article(j+"")!=null){
            save_articles.add(operaDao.get_article(j+""));;
            j= j+1;
            return j;
        }
        else{
            j++;
            j = jump_null(save_articles, j, all_of_article);
            return j;
        }
    }
%>
<%
    OperaDao operaDao = new OperaDaoImpl();
    int all_of_article = operaDao.get_line("article");
    List<List<String>> save_articles = new ArrayList<List<String>>();
    int j = 0;
    for(int i = all_of_article - all_of_article; i <= all_of_article-1; i++){
        j = jump_null(save_articles, j, all_of_article);
    }
%>
<div class="home">
    <div class="content">
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
    <div class="main-content item-box">
        <div class="item-left">
            <div class="zonhe-row layui-row">
                <div class="item-title-row layui-row row-align">
                    <div class="layui-col-md10 row-align font-size2">
                        <div class="left-icon"></div>
                        <span class="font-bold">综合文章</span>
                    </div>
                </div>
                <div class="zonhe-ul-row layui-row">
                    <ul>
                        <c:forEach var = "article" items="<%=save_articles%>">
                            <li>
                                <div class="zonhe-libox layui-row subject-second-color pane-radius">
                                    <div class="zonheimg-box-parent layui-col-md3">
                                        <div class="zonhe-li-imgbox pane-radius">
                                            <img src="/img/a1.jpg"/>
                                            <div class="lable-box">程序人生</div>
                                        </div>
                                    </div>
                                    <div class="zonheimg-box-parent2 layui-col-md9">
                                        <div class="zonhe-lititle layui-row layui-elip">
                                            <h3><a href='/Inarticle?articleid=${article[0]}'>${article[1]}</a></h3>
                                        </div>
                                        <div class="zonhe-limsg layui-row">
                                            <p>${article[2]}</p>
                                        </div>
                                        <div class="zonhe-param layui-row">
                                            发布时间：${article[5]}

                                            &nbsp;&nbsp;&nbsp;
                                            <a href='/Inarticle?articleid=${article[0]}'>查看全文</a>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                    <div class="look-more layui-row subject-second-color font-color1 text-align-center pane-radius"><a href="/SecondPage/tipe2.jsp">查看更多</a></div>
                </div>
            </div>
        </div>

        <div class="item-right">
            <div class="right-one-row layui-row pane-bg-radius">
                <div class="visit-img-box top-radius">
                    <img src="/img/like.png" class="top-radius"/>
                </div>
                <div class="headimg-box">
                    <img src="/img/like.png"/>
                </div>
                <div class="nickname layui-row row-align text-align-center">
                    改bug
                </div>
                <div class="padding-hr layui-row common-padding-x">
                    <div class="hr-line-div"></div>
                </div>
                <div class="mine-msg layui-row common-padding font-size1 font-color5">
                    <div class="layui-row row-align">
                        <div class="msg-name layui-col-md3">Q Q ：</div>
                        <div class="msg-val layui-col-md9">1243321351</div>
                    </div>
                    <div class="layui-row row-align">
                        <div class="msg-name layui-col-md3">职业 ：</div>
                        <div class="msg-val layui-col-md9">java工程师</div>
                    </div>
                    <div class="layui-row row-align">
                        <div class="msg-name layui-col-md3">现居 ：</div>
                        <div class="msg-val layui-col-md9">浙江省-宁波市</div>
                    </div>
                    <div class="layui-row row-align">
                        <div class="msg-name layui-col-md3">Email ：</div>
                        <div class="msg-val layui-col-md9">1243321351@qq.com</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

</body>
<script>
    let mucics = document.getElementById('audio')
    document.body.addEventListener('mousemove', function() {
        setTimeout(() => {
            mucics.play();
        }, 2000);
    }, false);
</script>

</html>
