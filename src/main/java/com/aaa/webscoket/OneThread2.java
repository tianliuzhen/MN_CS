package com.aaa.webscoket;

import java.util.List;
import java.util.Map;

import javax.websocket.Session;


import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


import com.aaa.service.depotService;


public class OneThread2 extends Thread{
	private Session session;
  //  private DBUtil dbUtil;
	private ApplicationContext ac = new ClassPathXmlApplicationContext("spring-mybatis.xml");
	private  depotService depotService=(com.aaa.service.depotService) ac.getBean("depotServiceimpl");
    private int currentIndex;
    
    public OneThread2(Session session) {
        this.session = session;
    
        currentIndex = -1;// 0
    }
    @Override
    public void run() {
    	try {
			
		
        while (true) {
            List<Map> list = null;
            list = depotService.zbu();
           int i=Integer.parseInt(String.valueOf(list.get(0).get("b")));
               
               
          
            if (list != null && currentIndex !=i ) {
                	
                        session.getAsyncRemote().sendText(String.valueOf(list.get(0).get("b")));  //异步的 
                        //      session.getBasicRemote().sendObject(list.get(0).get("s")); // 同步的
                    
                  currentIndex = i;
              }
             
                  Thread.sleep(1000);
            
        }
    	} catch (Exception e) {
			// TODO: handle exception
		}
    }
                }
