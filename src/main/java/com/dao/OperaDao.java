package com.dao;

import java.util.ArrayList;
import java.util.List;

public interface OperaDao {
    public boolean create_database(String name);
    //创建数据库
    public boolean create_table(String name);
    public int get_applaud(String art_id);
    //获取文章赞数
    public List<String> get_article(String art_id);
    //获取文章内容
    public boolean applaud(String art_id, String username);
    //点赞
    public boolean check_applaud(String art_id, String username);
    //检测是否已点赞
    public boolean applaud_cancel(String art_id, String username);
    //取消点赞
    public boolean comment(String art_id, String username, String context);
    //评论
    public List<List<String>> get_comment(String art_id);
    //获取文章评论
    public int get_line(String table_name);
    //删除文章
    public boolean delete_article(String art_id);
    //搜索文章
    public List<List<String>> search_article(String topic);
    //更新赞数(add)
    public boolean article_update_add(String art_id);
    //更新赞数(sub)
    public boolean article_update_sub(String art_id);
    //发表文章
    public boolean new_article(String topic, String username, String context);
}
