<%@ page import="com.dao.OperaDao" %>
<%@ page import="com.dao.impl.OperaDaoImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>

    <%!
        public int jump_null(List<List<String>> save_articles, int j, int all_of_article){
            OperaDao operaDao = new OperaDaoImpl();
            if(save_articles.size() > all_of_article)//如果读取到的文章数比总文章数多，则跳出
                return 0;
            if(operaDao.get_article(j+"")!=null){//如果读取到的文章存在时，存入列表，下标+1
                save_articles.add(operaDao.get_article(j+""));
                j++;
            }
            else{//如果读到某ID的文章不存在时，跳过且下标+1，继续读取下一篇
                j++;
                j = jump_null(save_articles, j, all_of_article);
            }
            return j;
        }
    %>
    <%
        String flag1 = session.getAttribute("flag").toString();//获取判断值
        String username = session.getAttribute("username_always").toString();

        OperaDao operaDao = new OperaDaoImpl();
        int all_of_article = operaDao.get_line("article");//获取共有几篇文章
        List<List<String>> save_articles = new ArrayList<List<String>>();//用一个二维列表存入每一篇文章的相关信息
        int j = 0;
        for(int i = all_of_article - all_of_article; i <= all_of_article-1; i++){
            j = jump_null(save_articles, j, all_of_article);//遍历读取文章
        }
        if (flag1.equals("1")){//判断值为1时进入搜索
            OperaDao operaDao1 = new OperaDaoImpl();
            save_articles = operaDao1.search_article(request.getAttribute("search_use").toString());
            session.setAttribute("flag", "0");
        }
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
        a:link{color:white;}
        a:visited{color:white;}
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



    <a href="/quit">
        <img class="break1" src="/img/reback.png"  alt="" width="20" height="20" >
    </a>

    <div class="sidebar-nav">
        <form class="search form-inline" method="get" action="/search">
            <input type="text" placeholder="Search..." id="search_use" name="search_use" onkeyup="search_txt()">
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

        <div class="header">

            <h1 class="page-title">Users</h1>
        </div>

        <ul class="breadcrumb">
            <li><a href="index.html">Home</a> <span class="divider">/</span></li>
            <li class="active">Users</li>
        </ul>

        <div class="container-fluid">
            <div class="row-fluid">

                <div class="btn-toolbar">
                    <button class="btn btn-primary" >
                        <i class="icon-plus"/><a href="article_write.jsp" >新建文档</a></button>
                    </br>

                    <div class="btn-group">
                    </div>
                </div>
<%--                <div class="btn-toolbar">--%>
<%--                    <div class="update">--%>
<%--                        <td>--%>
<%--                            <a href="article_write.jsp" ><input type="button" value="增加"></a>--%>
<%--                        </td>--%>
<%--                    </div>--%>
<%--                </div>--%>


                <div class="well">
                    <table class="table" style="table-layout: fixed">
                        <thead>
                        <tr>
                            <th width="20%">#id</th>
                            <th width="20%">作者名</th>
                            <th width="20%">文章名</th>
                            <th width="25%">内容</th>
                            <th width="5%">  </th>
                            <th width="10%"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="article" items="<%=save_articles%>">

                            <tr>
                                <td style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis">${article.get(0)}</td>
                                <td style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis">${article.get(3)}</td>
                                <td style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis">${article.get(1)}</td>
                                <td style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis">${article.get(2)}</td>
                                <%
                                    String delete_articleid = "";
                                %>
                                <td>

                                </td>
                                <td>
                                    <a href="#myModal" role="button" data-toggle="modal"><input type="button" value="删除" class="delete" onclick="delcfm(${article.get(0)})"></a>
                                </td>
                            </tr>
                        </c:forEach>
<%--                        <tr>--%>
<%--                            <td>2</td>--%>
<%--                            <td>Ashley</td>--%>
<%--                            <td>Jacobs</td>--%>
<%--                            <td>ash11927</td>--%>
<%--                            <td>--%>
<%--                                <a href="user.html"><i class="icon-pencil"></i></a>--%>
<%--                                <a href="#myModal" role="button" data-toggle="modal"><i class="icon-remove"></i></a>--%>
<%--                            </td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td>3</td>--%>
<%--                            <td>Audrey</td>--%>
<%--                            <td>Ann</td>--%>
<%--                            <td>audann84</td>--%>
<%--                            <td>--%>
<%--                                <a href="user.html"><i class="icon-pencil"></i></a>--%>
<%--                                <a href="#myModal" role="button" data-toggle="modal"><i class="icon-remove"></i></a>--%>
<%--                            </td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td>4</td>--%>
<%--                            <td>John</td>--%>
<%--                            <td>Robinson</td>--%>
<%--                            <td>jr5527</td>--%>
<%--                            <td>--%>
<%--                                <a href="user.html"><i class="icon-pencil"></i></a>--%>
<%--                                <a href="#myModal" role="button" data-toggle="modal"><i class="icon-remove"></i></a>--%>
<%--                            </td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td>5</td>--%>
<%--                            <td>Aaron</td>--%>
<%--                            <td>Butler</td>--%>
<%--                            <td>aaron_butler</td>--%>
<%--                            <td>--%>
<%--                                <a href="user.html"><i class="icon-pencil"></i></a>--%>
<%--                                <a href="#myModal" role="button" data-toggle="modal"><i class="icon-remove"></i></a>--%>
<%--                            </td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td>6</td>--%>
<%--                            <td>Chris</td>--%>
<%--                            <td>Albert</td>--%>
<%--                            <td>cab79</td>--%>
<%--                            <td>--%>
<%--                                <a href="user.html" class="icon-pencil"/>--%>
<%--                                <a href="#myModal" role="button" data-toggle="modal" class="icon-remove"/>--%>
<%--                            </td>--%>
<%--                        </tr>--%>
                        </tbody>
                    </table>
                </div>
    <%--            <div class="pagination">--%>
    <%--                <ul>--%>
    <%--                    <li><a href="#">Prev</a></li>--%>
    <%--                    <li><a href="#">1</a></li>--%>
    <%--                    <li><a href="#">2</a></li>--%>
    <%--                    <li><a href="#">3</a></li>--%>
    <%--                    <li><a href="#">4</a></li>--%>
    <%--                    <li><a href="#">Next</a></li>--%>
    <%--                </ul>--%>
    <%--            </div>--%>

                <div class="modal small hide fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 id="myModalLabel">Delete Confirmation</h3>
                    </div>
                    <div class="modal-body">
                        <p class="error-text"><i class="icon-warning-sign modal-icon"></i>Are you sure you want to delete the user?</p>
                    </div>
                    <div class="modal-footer">
                        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
                        <button class="btn btn-danger" data-dismiss="modal">Delete</button>
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


    <script language="JavaScript">
        function delcfm(articleid) {
            if(!(confirm("确定要删除？"))){
            }
            else location.href='/delete_article?articleid='+articleid;
        }
    </script>

    <script src="/WEB-INF/lib/bootstrap.js"></script>
    <script type="text/javascript">
        $("[rel=tooltip]").tooltip();
        $(function() {
            $('.demo-cancel-click').click(function(){return false;});
        });
    </script>

    <script>
        function search_txt(event){
            if(event.keyCode == 13){
                document.getElementById("form").submit();
            }
        }
    </script>

</body>
</html>


