/*
   * Classname 
   * mycollecting
   * Version information
   * 2.2.3
   * Date
   * 11-21
   * Copyright notice
   */
//鎴戠殑鍏虫敞鐨勬椿鍔�

package tutorial;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.*;
import java.util.*;
public class mycollecting extends ActionSupport {
    public ArrayList<String> actid;
    public ArrayList<Map<String,String>> list;
    public ArrayList<activity> act;
    public String phonenumber;
    public String username;
    public String useremail;
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
    public String getphonenumber(){
        return phonenumber;
    }
    public void setphonenumber(String phonenumber){
        this.phonenumber = phonenumber;
    }   
    public String execute(){
        String ret = ERROR;
        Connection con = null;
        list = new ArrayList<Map<String,String>>();
        act= new ArrayList<activity>();
        actid = new ArrayList<String>();
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pro?useUnicode=true&characterEncoding=utf-8", "root", "123456");
            Statement stmt=con.createStatement();
            String s="select * from c"+phonenumber+"";
            ResultSet r=stmt.executeQuery(s);
            while(r.next())
            {   
                actid.add(r.getString(1));
            }
            r.close();
            for(String temp:actid)
            {
                s="select * from act where actid ='"+temp+"'";
                ResultSet rs=stmt.executeQuery(s);
                rs.next();
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
                rs.close();
            }
            for(Map<String,String> temp:list)
            {
                activity a= new activity();
                a.slist =new ArrayList<Map<String,String>>();  
                s="select * from s"+temp.get("actid")+"";
                ResultSet rss=stmt.executeQuery(s);
                while(rss.next())
                {
                    Map<String,String> map = new HashMap<String,String>();
                    map.put("sid", rss.getString(1));
                    map.put("time", rss.getString(2));
                    map.put("contents", rss.getString(3));
                    map.put("place", rss.getString(4));
                    map.put("person", rss.getString(5));
                    a.slist.add(map);
                 }
                 rss.close();  
                 a.brief= temp.get("brief");
                 a.actid= temp.get("actid");
                 a.cphonenumber= temp.get("cphonenumber");
                 a.creator= temp.get("creator");
                 a.name =temp.get("name");
                 a.place= temp.get("place");
                 a.edate= temp.get("edate");
                 a.sdate= temp.get("sdate");
                 a.type = temp.get("type");
                 a.posterid= temp.get("posterid");
                 act.add(a);
                 
            }
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
