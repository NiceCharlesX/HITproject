package tutorial;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.*;
import java.util.*;
public class changeschedule extends ActionSupport {
	public String actid;
	public String sid;
	public String time;
	public String contents;
	public String place;
	public String person;
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
	public String getsid(){
        return sid;
	}
    public void setsid(String sid){
        this.sid = sid;
    }
    public String gettime(){
        return time;
    }
    public void settime(String time){
        this.time = time;
    }
    public String getcontents(){
        return contents;
    }
    public void setcontents(String contents){
        this.contents = contents;
    }
    public String getplace(){
        return place;
    }
    public void setplace(String place){
        this.place = place;
    }
    public String getperson(){
        return person;
    }
    public void setperson(String person){
        this.person = person;
    }
	public String execute(){
		String ret = ERROR;
		Connection con = null;
		try{
  		    Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pro?useUnicode=true&characterEncoding=utf-8", "root", "123456");
            Statement stmt=con.createStatement();
            String sql="update s"+actid+" set sid='"+sid+"',time='"+time+"',contents='"+contents+"',place='"+place+"',person='"+person+"' where sid='"+sid+"'";
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
