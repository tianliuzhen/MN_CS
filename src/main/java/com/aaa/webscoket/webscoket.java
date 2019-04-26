package com.aaa.webscoket;

import javax.servlet.jsp.tagext.TryCatchFinally;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
@ServerEndpoint("/websocketAlert/{userno}")
public class webscoket {
	 private String userno = "";
	 @OnOpen
	    public void onOpen(Session session,@PathParam(value = "userno") String param){
		 System.out.println(param);
		 try {
			 if(param.equals("a")){  // extends Thread
					System.out.println("thread1");
				 OneThread thread =null;
			        thread=new OneThread(session);
			        thread.start();
			      thread.yield();  //让步
			
			 }else if(param.equals("a2")){  //implements Runnable
				 System.out.println("thread2");
				 OneThread2 thread2 =null;
				 thread2=new OneThread2(session);
				 Thread t=new Thread(thread2); 
			        t.start();
			       t.yield();
				 
			 }
			 else if(param.equals("a3")){  //implements Runnable
		
				 OneThread3 thread3 =null;
				 thread3=new OneThread3(session);
				 Thread t3=new Thread(thread3); 
			        t3.start();
			       t3.yield();
				 
			 }else if(param.equals("a4")){  //implements Runnable
				 System.out.println("thread2");
				 OneThread4 thread4 =null;
				 thread4=new OneThread4(session);
				 Thread t4=new Thread(thread4); 
			        t4.start();
			       t4.yield();
				 
			 }else if(param.equals("a5")){  //implements Runnable
				 System.out.println("thread5");
				 OneThread5 thread5=null;
				 thread5=new OneThread5(session);
				 Thread t5=new Thread(thread5); 
			        t5.start();
			       t5.yield();
				 
			 }else if(param.equals("a6")){  //implements Runnable
				 System.out.println("thread2");
				 OneThread6 thread6 =null;
				 thread6=new OneThread6(session);
				 Thread t6=new Thread(thread6); 
			        t6.start();
			       t6.yield();
				 
			 }else if(param.equals("a7")){  //implements Runnable
				 System.out.println("thread2");
				 OneThread7 thread7=null;
				 thread7=new OneThread7(session);
				 Thread t7=new Thread(thread7); 
			        t7.start();
			       t7.yield();
				 
			 }else if(param.equals("a8")){  //implements Runnable
				 System.out.println("thread2");
				 OneThread8 thread8 =null;
				 thread8=new OneThread8(session);
				 Thread t8=new Thread(thread8); 
			        t8.start();
			       t8.yield();
				 
			 }
			 
		} catch (Exception e) {
			// TODO: handle exception
		}
		 
	    }
	 
}
