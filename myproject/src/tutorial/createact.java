package tutorial;


import com.opensymphony.xwork2.ActionSupport;
import java.sql.*;
import java.util.HashMap;
import java.util.Map;


public class createact extends ActionSupport {
    public int actid;
	public  String name;
	public  String creatoremail;
	public String creator;
	public String place;
	public String time;
	public String type;
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
    public String gettime(){
        return time;
    } 
    public void settime(String time){
        this.time = time;
    }
    public String gettype(){
        return type;
    } 
    public void settype(String type){
        this.type = type;
    }


	public String execute(){
		String ret = ERROR;
		Connection conn = null;
		String[] date=time.split("+-+");
		if(name==null||name.length()<=0||creator==null||creator.length()<=0||place==null||place.length()<=0||time==null||time.length()<=0||type==null||type.length()<=0)
		{
			return "inputempty";
		}
		try{			
			Class.forName("com.mysql.jdbc.Driver");
		    conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/pro?useUnicode=true&characterEncoding=utf-8", "root", "123456");
		    Statement stmt=conn.createStatement();
		    String sql;
		    sql="insert into act(actid,name,creatoremail,creator,place,sdate,edate,type) values(NULL,'"+name+"','"+creatoremail+"','"+creator+"','"+place+"','"+date[0]+"','"+date[1]+"','"+type+"')";
            stmt.executeUpdate(sql);
            ret = SUCCESS;
            sql="select * from act where name ='"+name+"'";
            ResultSet rs=stmt.executeQuery(sql);
            while(rs.next())
            {
                actid= rs.getInt(1);
            }
            rs.close();
            sql="CREATE TABLE s"+actid+"(sid bigint(30) not null AUTO_INCREMENT, time varchar(30) not null, contents varchar(30) not null,place varchar(30) not null,person varchar(30) not null,primary key (sid));";
            stmt.executeUpdate(sql);
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
