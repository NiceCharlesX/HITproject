package tutorial;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.*;
import java.util.*;

public class changesend extends ActionSupport {
  public String phonenumber;
  public ArrayList<String> list;
  public String actid;
  public ArrayList<String> up;
  public String actname;
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
      Connection conn = null;
      String email="error";
      list= new ArrayList<String>();
      up= new ArrayList<String>();
      try{            
          Class.forName("com.mysql.jdbc.Driver");
          conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/pro?useUnicode=true&characterEncoding=utf-8", "root", "123456");
          Statement stmt=conn.createStatement();
          String s= "select * from act where actid='"+actid+"'";
          ResultSet r=stmt.executeQuery(s);
          r.next();
          actname=r.getString(2);
          r.close();
          s="select * from user";
          ResultSet rs=stmt.executeQuery(s);
          while(rs.next())
          {
              up.add(rs.getString(1));
              up.add(rs.getString(4));
          }
          rs.close();
          for(String ptemp:up)
          {
               if(ptemp.indexOf("@")!=-1)
               {
                    email=ptemp;
               }
               else
               {
                    s="select * from c"+ptemp+" where actid='"+actid+"'";
                    ResultSet rss=stmt.executeQuery(s);
                    if(rss.next())
                    {
                         list.add(email);
                    }
                    rss.close();           
               }
          }
          stmt.close();
          conn.close();
          String addr=new String();
          for(String temp:list)
          {
                    if(addr.isEmpty())
                    {
                        addr=temp;
                    }
                    else
                    {
                        addr=temp+","+addr;
                    }
          }  
	      System.out.println(actname); 
	      System.out.println(addr);
	      if(!addr.isEmpty())
	      {
			      SendEmail send = new SendEmail();
			      send.setToAddr(addr);
			      send.setFromAddr("18245010845@163.com");
			      send.setUsername("18245010845@163.com");
			      send.setPassword("as123456");
			      send.setSubject("你关注的活动有更新！");
			      send.setContent(actname+"活动信息有更新，请注意！");
			      send.sendMail();
	      }
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
