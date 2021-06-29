package com.dao.impl;

import com.dao.OperaDao;
import com.util.DBUtil;
import jdk.nashorn.internal.runtime.OptimisticReturnFilters;
import jdk.nashorn.internal.runtime.regexp.joni.ast.StringNode;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class OperaDaoImpl implements OperaDao {
    public List<List<String>> list_comment = new ArrayList<List<String>>();

    /**
     * @description 创建数据库
     * @param name 数据库名字
     * @return boolean
     */
    public boolean create_database(String name) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            con = DBUtil.getConnection();
            String sql = "CREATE DATABASE if not exists " + name + " DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci";
            ps = con.prepareStatement(sql);
            int result = ps.executeUpdate(sql);
        }catch (Exception e){
            System.out.println("创建失败" + name);
            e.printStackTrace();
            return false;
        }finally {
            DBUtil.close(rs, ps, con);
        }
        return true;
    }

    public boolean create_table(String name) {
        return false;
    }


    /**
     * @description 获取点赞数
     * @param art_id 文章id
     * @return int
     */
    public int get_applaud(String art_id) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBUtil.getConnection();
            String sql = "SELECT applaud FROM article WHERE articleid = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, art_id);
            rs = ps.executeQuery();
            while(rs.next()){
                return Integer.parseInt(rs.getObject("applaud").toString());
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.close(rs, ps, con);
        }

        return 0;
    }

    /**
     * @description 获取文章内容
     * @param art_id 文章id
     * @return List
     */

    public List<String> get_article(String art_id) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<String> save_article = new ArrayList<String>();
        try {
            con = DBUtil.getConnection();
            String sql = "SELECT articleid, article_context, topic, author, applaud, time FROM article WHERE articleid = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, art_id);
            rs = ps.executeQuery();
            while(rs.next()){
                save_article.add(rs.getObject("articleid").toString());
                save_article.add(rs.getObject("topic").toString());
                save_article.add(rs.getObject("article_context").toString());
                save_article.add(rs.getObject("author").toString());
                save_article.add(rs.getObject("applaud").toString());
                save_article.add(rs.getObject("time").toString());
                return save_article;
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.close(rs, ps, con);
        }

        return null;
    }

    /**
     * @description 点赞
     * @param art_id 文章id
     * @param username 用户名
     * @return boolean
     */

    public boolean applaud(String art_id, String username) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            con = DBUtil.getConnection();
            String sql = "INSERT INTO applaud_user VALUES(?, ?, 1)";
            ps = con.prepareStatement(sql);
            ps.setString(1,art_id);
            ps.setString(2,username);
            int result = ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }finally {
            DBUtil.close(rs, ps, con);
        }
        return true;
    }

    /**
     * @description 检测是否已经点赞
     * @param art_id 文章id
     * @param username 用户名
     * @return boolean
     */
    public boolean check_applaud(String art_id, String username) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            con = DBUtil.getConnection();
            String sql = "SELECT ifapplaud FROM applaud_user WHERE articleid = ? AND username = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, art_id);
            ps.setString(2, username);
            rs = ps.executeQuery();
            while(rs.next()){
                applaud_cancel(art_id, username);
                return true;
            }
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }finally {
            DBUtil.close(rs, ps, con);
        }
        applaud(art_id, username);
        return false;
    }

    /**
     * @description 取消点赞
     * @param art_id 文章id
     * @param username 用户名
     * @return boolean
     */
    public boolean applaud_cancel(String art_id, String username) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            con = DBUtil.getConnection();
            String sql = "DELETE FROM applaud_user WHERE articleid = ? AND username = ?";
            ps =con.prepareStatement(sql);
            ps.setString(1,art_id);
            ps.setString(2,username);
            int result = ps.executeUpdate();

        }catch (Exception e){
            e.printStackTrace();
            return false;
        }finally {
            DBUtil.close(rs, ps, con);
        }
        return true;
    }

    /**
     * @description 发表评论
     * @param art_id 文章id
     * @param username 用户名
     * @param context 评论内容
     * @return boolean
     */
    public boolean comment(String art_id, String username, String context) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String time = df.format(System.currentTimeMillis());
            con = DBUtil.getConnection();
            String sql = "INSERT INTO comment VALUES(0, ?, ?, ?, ?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, art_id);
            ps.setString(2, username);
            ps.setString(3, context);
            ps.setString(4, time);
            int result = ps.executeUpdate();
//            System.out.println(list_for_thread);
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }finally {
            DBUtil.close(rs, ps, con);
        }
        return true;
    }

    /**
     * @description 获取某篇文章的评论list
     * @param art_id 文章id
     * @return List
     */
    public List<List<String>> get_comment(String art_id) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            con = DBUtil.getConnection();
            String sql = "SELECT context, time, user.username, picture FROM comment INNER JOIN user WHERE user.username = comment.username AND articleid =?";
//            String sql = "SELECT DISTINCT"
            ps = con.prepareStatement(sql);
            ps.setString(1, art_id);
            rs = ps.executeQuery();
            while(rs.next()){
                List<String> list = new ArrayList<String>();
                list.add(rs.getObject("username").toString());
                list.add(rs.getObject("context").toString());
                list.add(rs.getObject("time").toString());
                list.add(rs.getObject("picture").toString());
                list_comment.add(list);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.close(rs, ps, con);
        }
        return list_comment;
    }

    /**
     * @description 获取表的行数
     * @param table_name 表名
     * @return int
     */
    public int get_line(String table_name) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int i = 0;
        try {
            con = DBUtil.getConnection();
            String sql = "SELECT * FROM " + table_name;
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                i++;
            }
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }finally {
            DBUtil.close(rs, ps, con);
        }
        return i;
    }

    /**
     * @description 删除文章
     * @param art_id
     * @return boolean
     */
    public boolean delete_article(String art_id) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            con = DBUtil.getConnection();
            String sql = "DELETE FROM article WHERE articleid = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, art_id);
            ps.execute();
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.close(rs, ps, con);
        }
        return false;
    }

    /**
     * @description 查询文章
     * @param topic 标题
     * @return  List
     */
    public List<List<String>> search_article(String topic) {
        List<List<String>> list_search = new ArrayList<List<String>>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            con = DBUtil.getConnection();
            String sql = "SELECT * FROM article WHERE topic LIKE ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, topic);
            rs = ps.executeQuery();
            while(rs.next()){
                List<String> list = new ArrayList<String>();
                list.add(rs.getObject("articleid").toString());
                list.add(rs.getObject("topic").toString());
                list.add(rs.getObject("article_context").toString());
                list.add(rs.getObject("author").toString());
                list_search.add(list);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.close(rs, ps, con);
        }
        return list_search;

    }

    /**
     * @description 更新赞数量(增加)
     * @param art_id
     * @return boolean
     */
    public boolean article_update_add(String art_id) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs =null;
        try {
            con = DBUtil.getConnection();
            String sql = "UPDATE article SET applaud = applaud + 1 WHERE articleid = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, art_id);
            int result = ps.executeUpdate();

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.close(rs, ps, con);
        }
        return false;
    }

    /**
     * @description 更新赞数量(减少)
     * @param art_id
     * @return boolean
     */
    public boolean article_update_sub(String art_id) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs =null;
        try {
            con = DBUtil.getConnection();
            String sql = "UPDATE article SET applaud = applaud - 1 WHERE articleid = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, art_id);
            int result = ps.executeUpdate();

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.close(rs, ps, con);
        }
        return false;
    }

    /**
     * @description 发表新文章
     * @param topic
     * @param username
     * @param context
     * @return boolean
     */
    public boolean new_article(String topic, String username, String context) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String time = df.format(System.currentTimeMillis());
            con = DBUtil.getConnection();
            String sql = "INSERT INTO article(articleid, applaud, author, article_context, topic, time) values(0,?,?,?,?,?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, "0");
            ps.setString(2, username);
            ps.setString(3, context);
            ps.setString(4, topic);
            ps.setString(5, time);
            int result = ps.executeUpdate();
            System.out.println("发表成功");
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBUtil.close(rs, ps, con);
        }
        return false;
    }
}
