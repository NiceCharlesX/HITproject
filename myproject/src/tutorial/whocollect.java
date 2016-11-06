package tutorial;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.*;
import java.util.*;
public class whocollect extends ActionSupport {
    public String actid;
    public String phonenumber;
    public ArrayList<String> list;
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
        try{            
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/pro?useUnicode=true&characterEncoding=utf-8", "root", "123456");
            Statement stmt=conn.createStatement();
            String s="select * from user";
            ResultSet rs=stmt.executeQuery(s);  
            while(rs.next())
            {
                s="select * from c"+rs.getString(4)+" where actid='"+actid+"'";
                ResultSet rss=stmt.executeQuery(s);
                if(rss.next())
                {
                    list.add(rs.getString(1));
                }
                rss.close();
            }
            rs.close();
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
