package tutorial;


import com.opensymphony.xwork2.ActionSupport;
import java.sql.*;


public class collecting extends ActionSupport {
	public  String actid;
	public String email;
	public String getactid(){
		return actid;
	}	
	public void setactid(String actid){
		this.actid = actid;
	}
	public String getemail(){
		return email;
	}
	
	public void setemail(String email){
		this.email = email;
	}
	public String execute(){
		String ret = ERROR;
		Connection conn = null;
		try{			
			Class.forName("com.mysql.jdbc.Driver");
		    conn=DriverManager.getConnection("jdbc:mysql://localhost/bookdb?useUnicode=true&characterEncoding=utf-8", "root", "123456");
		    Statement stmt=conn.createStatement();
		    String sql="insert into "+email+"(actid) values('"+actid+"')";
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
