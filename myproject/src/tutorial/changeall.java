package tutorial;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.*;
import java.util.*;
public class changeall extends ActionSupport {
    public String actid;
    public String name;
    public String cphonenumber;
    public String creator;
    public String aplace;
    public String acttime;
    public String sdate;
    public String edate;
    public String type;
    public String brief;
    public String phonenumber;
    public String[] time;
    public String[] contents;
    public String[] place;
    public String[] person;
    public String[] date;
    
    public String username;
	public String useremail;
	
	public String getuseremai(){
		return useremail;
	}
	public void setuseremail(String useremail){
		this.useremail = useremail;
	}
	
	public String getusername(){
		return username;
	}
	
	public void setusername(String username){
		this.username = username;
	}
	
    public String getacttime(){
    	return acttime;
    }
    
    public void setacttime(String acttime){
    	this.acttime = acttime;
    }
    
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
    public String getaplace(){
        return aplace;
    } 
    public void setaplace(String aplace){
        this.aplace = aplace;
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
        date=acttime.split("[ - ]");
        sdate = date[0];
        edate = date[2];
        String posterid;
        Connection con = null;
        post Post= new post();
        try{
            posterid= Post.getpost(type);
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pro?useUnicode=true&characterEncoding=utf-8", "root", "123456");
            Statement stmt=con.createStatement();
            String sql="update act set actid='"+actid+"',name='"+name+"',cphonenumber='"+cphonenumber+"',creator='"+creator+"',place='"+aplace+"',sdate='"+sdate+"',edate='"+edate+"',type='"+type+"',brief='"+brief+"',posterid='"+posterid+"' where actid='"+actid+"'";
            stmt.executeUpdate(sql);
            sql= "drop table s"+actid+"";
            stmt.executeUpdate(sql);
            sql="CREATE TABLE s"+actid+"(sid bigint(30) not null AUTO_INCREMENT, time varchar(100) not null, contents varchar(100) not null,place varchar(30) not null,person varchar(30) not null,primary key (sid));";
            stmt.executeUpdate(sql); 
            for(int i=0;i<time.length;i++)
            {
                sql="insert into s"+actid+"(time,contents,place,person) values('"+time[i]+"','"+contents[i]+"','"+place[i]+"','"+person[i]+"')";
                stmt.executeUpdate(sql);
            }
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
