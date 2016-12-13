 /*
   * Classname 
   * collecting
   * Version information
   * 2.2.3
   * Date
   * 11-21
   * Copyright notice
   */
package tutorial;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.*;

public class collecting extends ActionSupport {
	public String actid;
	public String phonenumber;
	public String username;
    public String useremail;
    
    public String getusername(){
    	return username;
    }
    
    public void setusername(String username){
    	this.username = username;
    }
    
    public String getuseremail(){
    	return useremail;
    }
    
    public void setuseremail(String useremail){
    	this.useremail = useremail;
    }
	
	public String getactid(){
		return actid;
	}
	
	public void setactid(String actid){
		this.actid = actid;
	}
	
	public String getphonenumber(){
		return phonenumber;
	}
	
	public void setphonenumber(String phonenumber){
		this.phonenumber = phonenumber;
	}
	
	public String execute(){
		String ret = SUCCESS;
		Connection conn = null;
		try{			
			Class.forName("com.mysql.jdbc.Driver");
		    conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/pro?useUnicode=true&characterEncoding=utf-8", "root", "123456");
		    Statement stmt=conn.createStatement();
		    String sql="insert into c"+phonenumber+"(actid) values('"+actid+"')";
            stmt.executeUpdate(sql);   
            stmt.close();
        	conn.close();
        	ret = SUCCESS;
		}
		catch(Exception e){
			ret =  SUCCESS;
		}finally{
			if(conn != null){
				try{
					conn.close();
				}catch(Exception e){
					
				}
			}
		}
		return ret;
	}
}


