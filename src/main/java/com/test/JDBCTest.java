//测试能否连接数据库
package com.test;
import com.dao.OperaDao;
import com.dao.impl.InitDaoImpl;
import com.dao.impl.OperaDaoImpl;
import com.dao.impl.UserDaolmpl;
import com.domain.User;
import com.util.DBUtil;
import com.dao.UserDao;
import com.dao.InitDao;
import com.thread.CommentThread;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class JDBCTest extends HttpServlet{
    List<List<String>> list_for_thread = new ArrayList<List<String>>();


    public static void main(String[] args) throws SQLException {

        JDBCTest jd = new JDBCTest();
        OperaDao operation_dao = new OperaDaoImpl();
        CommentThread thread1 = new CommentThread(jd.list_for_thread);
        Thread thread_comment = new Thread(thread1);
        thread_comment.start();//评论线程
/**手动输入
 Scanner sc = new Scanner(System.in);
        while(sc.hasNext()){
            String str = sc.next();
            list_1.add(str);
//            jd.list_for_thread.add(str);
            while(list_1.size() == 3){
                jd.list_for_thread.add(list_1);
                list_1 = new ArrayList<String>();
            }

        }
 **/

    }
}
