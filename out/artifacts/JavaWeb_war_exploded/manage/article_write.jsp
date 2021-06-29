<!DOCTYPE html>
<html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
    <link rel="stylesheet" href="/editormd/css/editormd.css" />
    <link rel="stylesheet" href="/editormd/examples/css/style.css">
    <link rel="stylesheet" href="/css/stylewrite.css">
</head>

<body>

        <div id='bar'>
            <div id="topbar">

            </div>
                <div id="czbar">
                    <input name="article_name" id="article_name" style="font-size: 26px;width: 80%;padding-left: 10px;border: 0px none #FFFFFF;padding-top: 5px;" type="text" value="文章标题" placeholder="文章标题" />


                    <button type=button id="commit" onclick="publish()">发表博客</button>

                </div>
        </div>
        <!-- Editor容器... -->
            <div id="test-editormd">
            </div>
        <div id="test-editor" class="editormd">
        <textarea class="editormd-markdown-textarea" name="content" id="content" style="display:none;">### 关于 Editor.md

    **Editor.md** 是一款开源的、可嵌入的 Markdown 在线编辑器（组件），基于 CodeMirror、jQuery 和 Marked 构建。

        </textarea>
            <textarea class="editormd-html-textarea" id="content1" name="content1" style="display:none;"></textarea>
        </div>
        <script src="https://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
        <script src="/editormd/editormd.min.js"></script>
</body>
</html>


<script type="text/javascript">
    $(function() {
        var editor = editormd("test-editor", {
            width  : "98%",
            height : "100%",
            syncScrolling:"single",
            path   : "../editormd/lib/",
            emoji:true,
            taskList:true,
            tocm:true,
            imageUpload:true,
            imageFormats:["jpg", "jpeg", "gif", "png", "bmp", "webp"],
            imageUploadURL:"imageUpload"
        });
    });

    function publish(){
        $.ajax(
            {
                data:{content:"@Article_name"+$("#article_name").val()+ "@Content" + $("#content").val()},
                dataType:'text',
                type:'post',
                url:'<%=basepath%>publish'
            }
        );
        location.href = '../SecondPage/tipe2.jsp';
    }
</script>