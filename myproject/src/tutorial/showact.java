/*
   * Classname 
   * showact
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
public class showact extends ActionSupport {
	public String orderby;
	public ArrayList<Map<String,String>> list;
	public String phonenumber;
	public int temp=0;
	

	public int gettemp(){
		return temp;
	}
    public String getphonenumber(){
        return phonenumber;
    }
    public void setphonenumber(String phonenumber){
        this.phonenumber = phonenumber;
    }   
	public String getorderby(){
		return orderby;
	}
	public void setorderby(String orderby){
		this.orderby = orderby;
	}
	public String execute(){
		String ret = ERROR;
		Connection con = null;
		list = new ArrayList<Map<String,String>>();
		if(orderby==null)
		{
		    orderby = "actid";
		}
		try{
  		    Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pro?useUnicode=true&characterEncoding=utf-8", "root", "123456");
            Statement stmt=con.createStatement();
            String s;
            if(orderby.equals(null))
            {
            	s="select * from act where edate>=now() order by sdate";
            }
            else if(orderby.equals("time"))
            {
                s="select * from act order by sdate";
            }
            else
            {
                s="select * from act where edate>=now() and type='"+orderby+"' order by sdate";
            }
        	ResultSet rs=stmt.executeQuery(s);
            while(rs.next())
            {
                Map<String,String> map = new HashMap<String,String>();
                map.put("actid", rs.getString(1));
                map.put("name", rs.getString(2));
                map.put("cphonenumber", rs.getString(3));
                map.put("creator", rs.getString(4));
                map.put("place", rs.getString(5));
                map.put("sdate", rs.getString(6));
                map.put("edate", rs.getString(7));
                map.put("type", rs.getString(8));
                map.put("brief", rs.getString(9));
                map.put("posterid", rs.getString(10));
                list.add(map);
                temp++;
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
