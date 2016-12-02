 /*
   * Classname 
   * ContextListener
   * Version information
   * 2.2.3
   * Date
   * 11-21
   * Copyright notice
   */

package tutorial;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ContextListener implements  ServletContextListener{
	private static final long serialVersionUID = 1L;

	public ContextListener() {
	}

	private java.util.Timer timer = null;

	public void contextInitialized(ServletContextEvent event) {
		
		/**
		 * 璁剧疆涓�涓畾鏃跺櫒
		 */
		timer = new java.util.Timer(true);
		
		event.getServletContext().log("瀹氭椂鍣ㄥ凡鍚姩");

		/**
		 * 瀹氭椂鍣ㄥ埌鎸囧畾鐨勬椂闂存椂,鎵ц鏌愪釜鎿嶄綔(濡傛煇涓被,鎴栨柟娉�)
		 */

		//后边最后一个参数代表监视器的监视周期,现在为一小时

		timer.schedule(new MyTask(event.getServletContext()), 0, 60*60*1000);

		event.getServletContext().log("宸茬粡娣诲姞浠诲姟璋冨害琛�");
	}

	public void contextDestroyed(ServletContextEvent event) {
		timer.cancel();
		System.out.println("瀹氭椂鍣ㄩ攢姣�");
		event.getServletContext().log("瀹氭椂鍣ㄩ攢姣�");
	}

}