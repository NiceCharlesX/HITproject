package tutorial;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.*;
import java.util.*;
public class delact extends ActionSupport {
    public String actid;
    public String phonenumber;
    public ArrayList<String> user;
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
        user = new ArrayList<String>();
        try{            
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/pro?useUnicode=true&characterEncoding=utf-8", "root", "123456");
            Statement stmt=conn.createStatement();
            String sql="drop table s"+actid+"";
            stmt.executeUpdate(sql);   
            sql= "delete from act where actid='"+actid+"'";
            stmt.executeUpdate(sql); 
            sql= "select * from user";
            ResultSet rs=stmt.executeQuery(sql);
            while(rs.next())
            {
                user.add(rs.getString(4));
            }
            rs.close();
            for(String ph:user)
            {
                boolean tf= false;
                sql= "select * from c"+ph+" where actid='"+actid+"'";
                ResultSet rss=stmt.executeQuery(sql);
                if(rss.next())
                {
                    tf=true;
                }
                rss.close();
                if(tf)
                {
                    sql= "delete from c"+ph+" where actid='"+actid+"'";
                    stmt.executeUpdate(sql);     
                }
                
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
