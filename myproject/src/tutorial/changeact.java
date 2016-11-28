 /*
   * Classname 
   * changeact
   * Version information
   * 2.2.2
   * Date
   * 11-11
   * Copyright notice
   */
package tutorial;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.*;
import java.util.*;
public class changeact extends ActionSupport {
    public String actid;            //id of activity
    public String name;             //name of activity
    public String cphonenumber;     //phone number of creator
    public String creator;          //name of creator
    public String place;            //place of activity
    public String sdate;            //start date
    public String edate;            //end date
    public String type;             //type of activity
    public String brief;            //brief introduction
    public String phonenumber;      //phonenumber of user
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
        String posterid;
        Connection con = null;
        post Post= new post();
        /*
         * change activity
         */
        try{
            posterid= Post.getpost(type);
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pro?useUnicode=true&characterEncoding=utf-8", "root", "123456");
            Statement stmt=con.createStatement();
            String sql="update act set actid='"+actid+"',name='"+name+"',cphonenumber='"+cphonenumber+"',creator='"+creator+"',place='"+place+"',sdate='"+sdate+"',edate='"+edate+"',type='"+type+"',brief='"+brief+"',posterid='"+posterid+"' where actid='"+actid+"'";
            stmt.executeUpdate(sql);
            sql= "drop table s"+actid+"";
            stmt.executeUpdate(sql);
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
