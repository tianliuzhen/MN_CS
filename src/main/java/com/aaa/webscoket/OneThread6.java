package com.aaa.webscoket;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;

import com.aaa.service.depotService;
import com.aaa.service.tlzService;
import com.aaa.serviceImpl.depotServiceimpl;
import com.aaa.serviceImpl.tlzServiceImpl;
import com.aaa.serviceImpl.zyqServiceImpl;
public class OneThread6 extends Thread{
	private Session session;
  //  private DBUtil dbUtil;
	private ApplicationContext ac = new ClassPathXmlApplicationContext("spring-mybatis.xml");
	private  depotService depotService=(com.aaa.service.depotService) ac.getBean("depotServiceimpl");
    private int currentIndex;
    
    public OneThread6(Session session) {
        this.session = session;
    
        currentIndex = -1;// 0
    }
    @Override
    public void run() {
    	try {
			
		
        while (true) {
        	  List<Map> list = null;
              list = depotService.dzd();
             int i=Integer.parseInt(String.valueOf(list.get(0).get("d")));
           
               
          
            if (list != null && currentIndex !=i ) {
                	
                     //     session.getAsyncRemote().sendText(String.valueOf(list.get(0).get("s")));  //异步的 
                               session.getBasicRemote().sendObject(list.get(0).get("d")); // 同步的
                    
                  currentIndex = i;
              }
             
                  Thread.sleep(1000);
            
        }
    	} catch (Exception e) {
			// TODO: handle exception
		}
    }
                }
