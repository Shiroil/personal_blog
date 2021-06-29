<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <%
        String username = session.getAttribute("username_always").toString();
    %>
    <meta charset="utf-8">
    <title>Bootstrap Admin</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<%--    <link type="text/css" href="${pageContext.request.contextPath}/css/styleArticle_manage2.css" rel="stylesheet" />--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/theme.css">
<%--    <link rel="stylesheet" href="/css/font-awesome.css">--%>

    <script src="/WEB-INF/lib/jquery-1.7.2.min.js" type="text/javascript"></script>

    <!-- Demo page code -->

    <style type="text/css">
        #line-chart {
            height:300px;
            width:800px;
            margin: 0px auto;
            margin-top: 1em;
        }
        .brand { font-family: georgia, serif; }
        .brand .first {
            color: #ccc;
            font-style: italic;
        }
        .brand .second {
            color: #fff;
            font-weight: bold;
        }
    </style>

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="/css/favicon.ico">
</head>

<div class="navbar">
    <div class="navbar-inner">
        <ul class="nav pull-right">

            <li id="fat-menu" class="dropdown">
                <a role="button" class="dropdown-toggle" data-toggle="dropdown">
                    <i></i> <%=username%>
                    <i></i>
                </a>

<%--                <ul class="dropdown-menu">--%>
<%--                    <li><a tabindex="-1" href="#">My Account</a></li>--%>
<%--                    <li class="divider"></li>--%>
<%--                    <li><a tabindex="-1" class="visible-phone" href="#">Settings</a></li>--%>
<%--                    <li class="divider visible-phone"></li>--%>
<%--                    <li><a tabindex="-1" href="sign-in.html">Logout</a></li>--%>
<%--                </ul>--%>
            </li>

        </ul>
        <a class="brand" href="/SecondPage/tipe1.jsp"><span class="first">mine</span> <span class="second">IDEA</span></a>
    </div>
</div>




<div class="sidebar-nav">
    <form class="search form-inline">
        <input type="text" placeholder="Search...">
    </form>

    <a href="#dashboard-menu" class="nav-header" data-toggle="collapse"><i></i>管理功能</a>
    <ul id="dashboard-menu" class="nav nav-list collapse in">
        <li><a href="/manage/article_read.jsp">文章查看</a></li>
        <li ><a href="/manage/article_write.jsp">写博客</a></li>

    </ul>

<%--    <a href="#error-menu" class="nav-header collapsed" data-toggle="collapse"><i class="icon-exclamation-sign"></i>错误页面<i class="icon-chevron-up"></i></a>--%>
<%--    <ul id="error-menu" class="nav nav-list collapse">--%>
<%--        <li ><a href="403.html">403 page</a></li>--%>
<%--        <li ><a href="404.html">404 page</a></li>--%>
<%--        <li ><a href="500.html">500 page</a></li>--%>
<%--        <li ><a href="503.html">503 page</a></li>--%>
<%--    </ul>--%>


    <a href="/manage/article_help.jsp" class="nav-header" ><i class="icon-question-sign"></i>帮助文档</a>
<%--    <a href="faq.html" class="nav-header" ><i class="icon-comment"></i>Faq</a>--%>
</div>



<div class="content">

    <ul class="breadcrumb">
        <li><a href="/manage/article_manage2.jsp">Home</a> <span class="divider">/</span></li>
    </ul>

    <div class="container-fluid">
        <div class="row-fluid">


            <a href="/quit">
                <img class="break1" src="/img/reback.png"  alt="" width="20" height="20" >
            </a>
            <div class="row-fluid">

                <div class="alert alert-info">
                    <button type="button" class="close" data-dismiss="alert">×</button>
                    <strong>Have a good time</strong> A personal blog
                </div>

                <div class="block">
                    <a href="#page-stats" class="block-heading" data-toggle="collapse">Start</a>
                    <div id="page-stats" class="block-body collapse in">

                        <div class="stat-widget-container">
                            <div class="stat-widget">
                                <p class="weltitle"> 人生得意须尽欢，莫使金樽空对月</p>
                            </div>
<%--                            <div class="stat-widget">--%>
<%--                                <div class="stat-button">--%>
<%--                                    <p class="title">2,500</p>--%>
<%--                                    <p class="detail">Accounts</p>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <div class="stat-widget">--%>
<%--                                <div class="stat-button">--%>
<%--                                    <p class="title">3,299</p>--%>
<%--                                    <p class="detail">Subscribers</p>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <div class="stat-widget">--%>
<%--                                <div class="stat-button">--%>
<%--                                    <p class="title">$1,500</p>--%>
<%--                                    <p class="detail">Pending</p>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <div class="stat-widget">--%>
<%--                                <div class="stat-button">--%>
<%--                                    <p class="title">$12,675</p>--%>
<%--                                    <p class="detail">Completed</p>--%>
<%--                                </div>--%>
<%--                            </div>--%>

                        </div>
                    </div>
                </div>
            </div>


            <footer>
                <hr>
                <!-- Purchase a site license to remove this link from the footer: http://www.portnine.com/bootstrap-themes -->
                <p class="pull-right">A personal blog</p>


                <p>&copy; 2021 <a  target="_blank">home</a></p>
            </footer>

        </div>
    </div>
</div>



<script src="lib/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript">
    $("[rel=tooltip]").tooltip();
    $(function() {
        $('.demo-cancel-click').click(function(){return false;});
    });
</script>

</body>
</html>


