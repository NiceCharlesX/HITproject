package tutorial;


import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.*;
import java.util.Map;



public class login extends ActionSupport {
	public String email;
	public String password;
	public String phonenumber;
    public String getphonenumber(){
        return phonenumber;
    }
    public void setphonenumber(String phonenumber){
        this.phonenumber = phonenumber;
    }   
	Map<String,Object> session = ActionContext.getContext().getSession();
	public Map<String,Object>  getsession(){
		return session;
	}
	
	public void setsession(Map<String,Object> session){
		this.session = session;
	}
	
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
		    conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/pro?useUnicode=true&characterEncoding=utf-8", "root", "123456");
		    Statement stmt=conn.createStatement();
		    String sql;
		    sql="select * from user";
		    ResultSet rs=stmt.executeQuery(sql);
		    while(rs.next())
		    {
		    	if(email.equals(rs.getString(1))&&password.equals(rs.getString(3)))
		    	{		    		
		    		session.put("email", "abc");
		    		phonenumber = rs.getString(4);
		    		return SUCCESS;
		    	}
		    	if(email.equals(rs.getString(2))&&password.equals(rs.getString(3)))
		    	{
		    		phonenumber = rs.getString(4);
                    return SUCCESS;
		    	}
		    	if(email.equals(rs.getString(4))&&password.equals(rs.getString(3)))
                {
		    		phonenumber = rs.getString(4);
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
