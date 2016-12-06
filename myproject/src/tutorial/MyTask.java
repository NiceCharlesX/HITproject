/*
   * Classname 
   * MyTask
   * Version information
   * 2.2.3
   * Date
   * 11-21
   * Copyright notice
   */
package tutorial;

import java.util.Calendar;
import java.util.TimerTask;
import javax.servlet.ServletContext;

/** 
* 
*  
*/  

public class MyTask extends TimerTask{
	public MyTask(){
		super();
	}
 
    private static final int C_SCHEDULE_HOUR = 23;  
  
    private static boolean isRunning = false;  
  
    private ServletContext context = null;  
    
    public MyTask(ServletContext context) {  
        this.context = context;  
    }  
  
    public void run() {  
        Calendar cal = Calendar.getInstance();  
        whocollect co= new whocollect();
        co.execute();
        String actname= "error";
        String addr=new String();
        if (!isRunning) {  
            if (C_SCHEDULE_HOUR == cal.get(Calendar.HOUR_OF_DAY)) {  
                isRunning = true;  
                context.log("start send email");                 
                for(String temp:co.list)
                {
                	  if(temp.indexOf("@")==-1)
                	  {
                	       actname= temp;
                    	   System.out.println(actname); 
                           System.out.println(addr);
                           SendEmail send = new SendEmail();
                           send.setToAddr(addr);
                           send.setFromAddr("18245010845@163.com");
                           send.setUsername("18245010845@163.com");
                           send.setPassword("as123456");
                           send.setSubject("你是谁");
                           send.setContent(actname+"肖");
                           send.sendMail();
                		   addr = new String();
                		   
                	  }
                	  else
                	  {
                	      if(addr.isEmpty())
                	      {
                	          addr=temp;
                	      }
                	      else
                	      {
                	          addr=temp+","+addr;
                	      }
                	  }
                }        
                // new YouCode().changeState();  
                
                isRunning = false;  
                context.log("ending");  
            }  
        } else {  
            context.log("no email");  
        }  
    }   
}  