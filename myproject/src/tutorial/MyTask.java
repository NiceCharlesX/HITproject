package tutorial;

import java.util.Calendar;
import java.util.TimerTask;
 
import javax.servlet.ServletContext;

/** 
* 继承 定时器任务类 
*  
*/  

public class MyTask extends TimerTask{
	public MyTask(){
		super();
	}

    /** 这个代表3点钟的时候执行任务 */  
    private static final int C_SCHEDULE_HOUR = 23;  
  
    private static boolean isRunning = false;  
  
    private ServletContext context = null;  
    
    public MyTask(ServletContext context) {  
        this.context = context;  
    }  
  
    public void run() {  
        Calendar cal = Calendar.getInstance();  
        if (!isRunning) {  
            if (C_SCHEDULE_HOUR == cal.get(Calendar.HOUR_OF_DAY)) {  
                isRunning = true;  
                context.log("开始执行指定任务");  
  
                SendEmail send = new SendEmail();
                send.setToAddr("921159963@qq.com");
                send.setFromAddr("18245010845@163.com");
                send.setUsername("18245010845@163.com");
                send.setPassword("as123456");
                send.setSubject("ding shi fa song");
                send.setContent("ding shi ren wu ce shi!");
                send.sendMail();
                // new YouCode().changeState();  
                
                isRunning = false;  
                context.log("指定任务执行结束");  
            }  
        } else {  
            context.log("上一次任务执行还未结束");  
        }  
    }   
}  