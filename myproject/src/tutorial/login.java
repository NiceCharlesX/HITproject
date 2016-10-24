package tutorial;


import com.opensymphony.xwork2.ActionSupport;
import java.sql.*;


public class login extends ActionSupport {
	public  String usertype;
	public  String password;
	public String email;
	public String getusertype(){
		return usertype;
	}	
	public void setusertype(String usertype){
		this.usertype = usertype;
	}
	public String getpassword(){
		return password;
	}
	
	public void setpassword(String password){
		this.password = password;
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
		if(usertype==null||usertype.length()<=0||password==null||password.length()<=0||email==null||email.length()<=0)
		{
			return "inputempty";
		}
		try{			
			Class.forName("com.mysql.jdbc.Driver");
		    conn=DriverManager.getConnection("jdbc:mysql://cnphlspinrfu.rds.sae.sina.com.cn:10468/bookdb?useUnicode=true&characterEncoding=utf-8", "bookdb", "02111996");
		    Statement stmt=conn.createStatement();
		    String sql;
		    if(usertype.equals("organizer"))
		    {
		    	sql="select * from ouser";
		    }
		    else
		    {
		    	sql="select * from cuser";
		    }
		    ResultSet rs=stmt.executeQuery(sql);
		    while(rs.next())
		    {
		    	if(email.equals(rs.getString(4))&&password.equals(rs.getString(3)))
		    	{
		    		return SUCCESS;
		    	}
		    }
		    rs.close();	    
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
