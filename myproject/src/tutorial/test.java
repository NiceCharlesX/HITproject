package tutorial;

import com.opensymphony.xwork2.ActionSupport;

public class test extends ActionSupport{
	public String[] time;
	
	public String[] gettime(){
		return time;
	}
	
	public void settime(String[] time){
		this.time = time;
	}

	public String execute(){
		return SUCCESS;
	}
}
