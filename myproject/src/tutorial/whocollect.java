/*
   * Classname 
   * whocollect
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

public class whocollect extends ActionSupport {
    public String phonenumber;
    public ArrayList<String> list;
    public ArrayList<String> actid;
    public ArrayList<String> up;
    public String getphonenumber(){
        return phonenumber;
    }
    
    public void setphonenumber(String phonenumber){
        this.phonenumber = phonenumber;
    }
    
    public String execute(){
        String ret = ERROR;
        Connection conn = null;
        String email="error";
        actid= new ArrayList<String>();
        list= new ArrayList<String>();
        up= new ArrayList<String>();
        try{            
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/pro?useUnicode=true&characterEncoding=utf-8", "root", "123456");
            Statement stmt=conn.createStatement();
            String s= "select * from act where sdate<date_add(now(),interval 3 day) and sdate > now()";
            ResultSet r=stmt.executeQuery(s);
            while(r.next())
            {
                actid.add(r.getString(1));
                actid.add(r.getString(2));
            }
            r.close();
            s="select * from user";
            ResultSet rs=stmt.executeQuery(s);
            while(rs.next())
            {
                up.add(rs.getString(1));
                up.add(rs.getString(4));
            }
            rs.close();
            boolean tf= false;
            for(String temp:actid)
            {
               if(tf)
               {
                    list.add(temp);
               }
               else
               {
                     for(String ptemp:up)
                     {
                          if(ptemp.indexOf("@")!=-1)
                          {
                              email=ptemp;
                          }
                          else
                          {
                              s="select * from c"+ptemp+" where actid='"+temp+"'";
                              ResultSet rss=stmt.executeQuery(s);
                              if(rss.next())
                              {
                                  list.add(email);
                              }
                              rss.close();
                          }
                      }   
                 }
                 tf=!tf;
            
            }
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
