package tutorial;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.*;
import java.util.*;
public class makeposter extends ActionSupport {
    public String actid;
    public ArrayList<Map<String,String>> list;
    public  String name;
    public  String creatoremail;
    public String creator;
    public String place;
    public String sdate;
    public String edate;
    public String type;
    public String brief;
    public String getbrief(){
      return brief;
    }   
    public void setbrief(String brief){
        this.brief = brief;
    }
    public String getname(){
        return name;
    }   
    public void setname(String name){
        this.name = name;
    }
    public String getcreatoremail(){
        return creatoremail;
    }
    
    public void setcreatoremail(String creatoremail){
        this.creatoremail = creatoremail;
    }
    public String getcreator(){
        return creator;
    } 
    public void setcreator(String creator){
        this.creator = creator;
    }
    public String getplace(){
        return place;
    } 
    public void setplace(String place){
        this.place = place;
    }
    public String getsdate(){
        return sdate;
    } 
    public void setsdate(String sdate){
        this.sdate = sdate;
    }
    public String getedate(){
      return edate;
    } 
    public void setedate(String edate){
        this.edate = edate;
    }
    public String gettype(){
        return type;
    } 
    public void settype(String type){
        this.type = type;
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
            s="select * from act where actid ="+actid+"";
            ResultSet rss=stmt.executeQuery(s);
            rss.next();
            name=rss.getString(2);
            creatoremail=rss.getString(3);
            creator=rss.getString(4);
            place=rss.getString(5);
            sdate=rss.getString(6);
            edate=rss.getString(7);
            type=rss.getString(8);
            brief=rss.getString(9);
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