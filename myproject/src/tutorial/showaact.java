/*
   * Classname 
   * showaact
   * Version information
   * 2.2.3
   * Date
   * 11-21
   * Copyright notice
   */
package tutorial;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.*;
import java.util.*;

public class showaact extends ActionSupport {
    public activity act;
    public String phonenumber;
    public String actid;
    public String username;
	public String useremail;
	
	public String getuseremail(){
		return useremail;
	}
	
	public void setuseremail(String useremail){
		this.useremail = useremail;
	}
	
	public String getusername(){
		return username;
	}
	
	public void setusername(String username){
		this.username = username;
	}
	
    public String getphonenumber(){
        return phonenumber;
    }
    
    public void setphonenumber(String phonenumber){
        this.phonenumber = phonenumber;
    }
    
    public String getactid(){
        return actid;
    }
    
    public void setactid(String actid){
        this.actid = actid;
    }
    
    public String execute(){
        String ret = ERROR;
        Connection con = null;
        act= new activity();
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pro?useUnicode=true&characterEncoding=utf-8", "root", "123456");
            Statement stmt=con.createStatement();
            String s="select * from act where actid='"+actid+"'";
            ResultSet rs=stmt.executeQuery(s);
            rs.next();
            act.actid=actid;
            act.name= rs.getString(2);
            act.cphonenumber=rs.getString(3);
            act.creator=rs.getString(4);
            act.place=rs.getString(5);
            act.sdate=rs.getString(6);
            act.edate=rs.getString(7);
            act.type=rs.getString(8);
            act.brief=rs.getString(9);
            act.posterid=rs.getString(10);
            rs.close();
            act.slist=new ArrayList<Map<String,String>>();
            s="select * from s"+actid+"";
            ResultSet rss=stmt.executeQuery(s);
            while(rss.next())
            {
                 Map<String,String> map = new HashMap<String,String>();
                 map.put("sid", rss.getString(1));
                 map.put("time", rss.getString(2));
                 map.put("contents", rss.getString(3));
                 map.put("place", rss.getString(4));
                 map.put("person", rss.getString(5));
                 act.slist.add(map);
            }
            rss.close();
            stmt.close();
            con.close();
            ret = SUCCESS;
        }
        catch(Exception e){
            ret =  ERROR;
        }finally{
            if(con != null){
                try{
                    con.close();
                }catch(Exception e){
                    
                }
            }
        }
        return ret;
    }
}


