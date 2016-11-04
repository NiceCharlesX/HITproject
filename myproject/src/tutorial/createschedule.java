package tutorial;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.*;
import java.util.*;
public class createschedule extends ActionSupport {
    public String actid;
	public String[] time;
	public String[] contents;
	public String[] place;
	public String[] person;

	public String getactid(){
		return actid;
	}
	public void setactid(String actid){
		this.actid = actid;
	}	
	public String[] gettime(){
      return time;
    }
    public void settime(String[] time){
        this.time = time;
    }
    public String[] getcontents(){
      return contents;
    }
    public void setcontents(String[] contents){
        this.contents = contents;
    }
    public String[] getplace(){
      return place;
    }
    public void setplace(String[] place){
        this.place = place;
    }
    public String[] getperson(){
      return person;
    }
    public void setperson(String[] person){
        this.person = person;
    }
    
	public String execute(){
		String ret = ERROR;

		Connection conn = null;
		try{
  		    Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/pro?useUnicode=true&characterEncoding=utf-8", "root", "123456");
            Statement stmt=conn.createStatement();
            String sql;
            for(int i=0;i<time.length;i++)
            {
                sql="insert into s"+actid+"(time,contents,place,person) values('"+time[i]+"','"+contents[i]+"','"+place[i]+"','"+person[i]+"')";
                stmt.executeUpdate(sql);
            }
            ret = SUCCESS;
            stmt.close();
            conn.close();
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
