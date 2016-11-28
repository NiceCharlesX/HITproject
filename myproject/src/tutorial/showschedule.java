/*
   * Classname 
   * showschedule
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
public class showschedule extends ActionSupport {
	public String actid;
	public ArrayList<Map<String,String>> list;
	public String phonenumber;
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
		list = new ArrayList<Map<String,String>>();
		try{
  		    Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pro?useUnicode=true&characterEncoding=utf-8", "root", "123456");
            Statement stmt=con.createStatement();
            String s="select * from s"+actid+"";
        	ResultSet rs=stmt.executeQuery(s);
            while(rs.next())
            {
                Map<String,String> map = new HashMap<String,String>();
                map.put("sid", rs.getString(1));
                map.put("time", rs.getString(2));
                map.put("contents", rs.getString(3));
                map.put("place", rs.getString(4));
                map.put("person", rs.getString(5));
                list.add(map);
            }
            rs.close();
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
