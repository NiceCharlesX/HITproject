package tutorial;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.*;
import java.util.*;
public class changeact extends ActionSupport {
    public String actid;
    public String name;
    public String cphonenumber;
    public String creator;
    public String place;
    public String sdate;
    public String edate;
    public String type;
    public String brief;
    public String phonenumber;
    public String getphonenumber(){
      return phonenumber;
    }    
    public void setphonenumber(String phonenumber){
        this.phonenumber = phonenumber;
    }
    public String getcphonenumber(){
        return cphonenumber;
    }
    public void setcphonenumber(String cphonenumber){
        this.cphonenumber = cphonenumber;
    }   
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
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pro?useUnicode=true&characterEncoding=utf-8", "root", "123456");
            Statement stmt=con.createStatement();
            String sql="update act set actid='"+actid+"',name='"+name+"',cphonenumber='"+cphonenumber+"',creator='"+creator+"',place='"+place+"',sdate='"+sdate+"',edate='"+edate+"',type='"+type+"',brief='"+brief+"' where actid='"+actid+"'";
            stmt.executeUpdate(sql);
            sql= "drop table s"+actid+"";
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
