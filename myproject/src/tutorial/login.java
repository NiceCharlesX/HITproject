package tutorial;


import com.opensymphony.xwork2.ActionSupport;
import java.sql.*;


public class login extends ActionSupport {
	public String email;
	public String password;
	public String getemail(){
      return email;
    }   
    public void setemail(String email){
        this.email = email;
    }
	public String getpassword(){
		return password;
	}	
	public void setpassword(String password){
		this.password = password;
	}
	public String execute(){
		String ret = ERROR;
		Connection conn = null;
		if(password==null||password.length()<=0||email==null||email.length()<=0)
		{
			return "inputempty";
		}
		try{			
			Class.forName("com.mysql.jdbc.Driver");
		    conn=DriverManager.getConnection("jdbc:mysql://localhost/bookdb?useUnicode=true&characterEncoding=utf-8", "root", "123456");
		    Statement stmt=conn.createStatement();
		    String sql;
		    sql="select * from user";
		    ResultSet rs=stmt.executeQuery(sql);
		    while(rs.next())
		    {
		    	if(email.equals(rs.getString(1))&&password.equals(rs.getString(3)))
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
