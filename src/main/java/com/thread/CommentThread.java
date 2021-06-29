package com.thread;
import com.dao.OperaDao;
import com.dao.impl.OperaDaoImpl;

import java.util.ArrayList;
import java.util.List;

public class CommentThread extends Thread{
    private OperaDao operation_dao = new OperaDaoImpl();
    private List<List<String>> list;
    //存储评论信息列表
    OperaDao operation_thread = new OperaDaoImpl();

    public CommentThread(List<List<String>> list) {
        this.list = list;
    }

    public void run(){
        try{
            while(true){
                if(!list.isEmpty())
                    synchronized (list){
                        while(!list.isEmpty()){
                            List<String> list_disperse = new ArrayList<String>();
                            list_disperse = list.get(0);
                            //每条评论的信息列表
//                            System.out.println(list);
                            operation_dao.comment(list_disperse.get(0), list_disperse.get(1), list_disperse.get(2));
                            list.remove(0);
                            Thread.sleep(100);
                        }
                    }
                else{
//                    System.out.println("睡觉！");
                    Thread.sleep(10000);
                }

            }

        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
