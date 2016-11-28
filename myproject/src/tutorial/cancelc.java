 /*
   * Classname 
   * cancelc
   * Version information
   * 2.2.2
   * Date
   * 11-11
   * Copyright notice
   */
package tutorial;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.*;
import java.util.*;
public class cancelc extends ActionSupport {
    public String actid;            //id of activity
    public String phonenumber;      //phone number of creator
    public String username;         //user name of creator
    public String useremail;        //user email of creator
    public String getusername(){
    	return username;
    }
    
    public void setusername(String useremail){
    	this.useremail = useremail;
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
        String ret = ERROR;
        Connection conn = null;
        
        //delete data in database
        try{            
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/pro?useUnicode=true&characterEncoding=utf-8", "root", "123456");
            Statement stmt=conn.createStatement();
            String sql="delete from c"+phonenumber+" where actid='"+actid+"'";
            stmt.executeUpdate(sql);   
            stmt.close();
            conn.close();
            ret = SUCCESS;
        }
        catch(Exception e){
            ret =  ERROR;
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
