package tutorial;


import com.opensymphony.xwork2.ActionSupport;
import java.sql.*;
import java.util.HashMap;
import java.util.Map;


public class createact extends ActionSupport {
    public int actid;
	public  String name;
	public  String cphonenumber;
	public String creator;
	public String place;
	public String time;
	public String type;
	public String brief;
	public String[] date;
	public  String phonenumber;
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
    public String getbrief(){
		return brief;
	}	
	public void setbrief(String brief){
		this.brief = brief;
	}
    


	public String execute(){
		String ret = ERROR;
		Connection conn = null;
		date=time.split("[ - ]");
	
		
		try{			
			Class.forName("com.mysql.jdbc.Driver");
		    conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/pro?useUnicode=true&characterEncoding=utf-8", "root", "123456");
		    Statement stmt=conn.createStatement();
		    String sql;
		    sql="insert into act(name,cphonenumber,creator,place,sdate,edate,type,brief) values('"+name+"','"+cphonenumber+"','"+creator+"','"+place+"','"+date[0]+"','"+date[2]+"','"+type+"','"+brief+"')";
            stmt.executeUpdate(sql);
            ret = SUCCESS;
            sql="select * from act where name ='"+name+"'";
            ResultSet rs=stmt.executeQuery(sql);
            while(rs.next())
            {
                actid= rs.getInt(1);
            }
            rs.close();
            sql="CREATE TABLE s"+actid+"(sid bigint(30) not null AUTO_INCREMENT, time varchar(100) not null, contents varchar(100) not null,place varchar(30) not null,person varchar(30) not null,primary key (sid));";
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
