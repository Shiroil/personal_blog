<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <%
        String username = session.getAttribute("username_always").toString();
    %>
    <meta charset="utf-8">
    <title>帮助文档</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <%--    <link type="text/css" href="${pageContext.request.contextPath}/css/styleArticle_manage2.css" rel="stylesheet" />--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/theme.css">
    <%--    <link rel="stylesheet" href="/css/font-awesome.css">--%>
    <%--    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">--%>
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
    <%--        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>--%>
    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="/css/favicon.ico">
</head>
<body class="">
<div class="navbar">
    <div class="navbar-inner">
        <ul class="nav pull-right">

            <li id="fat-menu" class="dropdown">
                <a role="button" class="dropdown-toggle" data-toggle="dropdown">
                    <i></i> <%=username%>
                    <i></i>
                </a>

            </li>

        </ul>
        <a class="brand" href="/SecondPage/tipe1.jsp"><span class="first">mine</span> <span class="second">IDEA</span></a>
    </div>
</div>




<a href="/quit">
    <img class="break1" src="/img/reback.png"  alt="" width="20" height="20" >
</a>
<div class="sidebar-nav">
    <form class="search form-inline">
        <input type="text" placeholder="Search...">
    </form>

    <a href="#dashboard-menu" class="nav-header" data-toggle="collapse"><i></i>管理功能</a>
    <ul id="dashboard-menu" class="nav nav-list collapse in">
        <li><a href="/manage/article_read.jsp?">文章查看</a></li>
        <li ><a href="/manage/article_write.jsp">写博客</a></li>

    </ul>



    <a href="/manage/article_help.jsp" class="nav-header" ><i class="icon-question-sign"></i>帮助文档</a>

</div>






<script language="JavaScript">
    function delcfm() {
        if(!(confirm("确定要删除？"))){
            window.event.returnValue=false;
        }
    }
</script>

<script src="/WEB-INF/lib/bootstrap.js"></script>
<script type="text/javascript">
    $("[rel=tooltip]").tooltip();
    $(function() {
        $('.demo-cancel-click').click(function(){return false;});
    });
</script>

</body>
</html>


