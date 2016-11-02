package tutorial;


import com.opensymphony.xwork2.ActionSupport;
import java.sql.*;


public class register extends ActionSupport {
    public String email;
	public String name;
	public  String password;
	public  String phonenumber;	
	
	public String getemail(){
        return email;
    }
    public void setemail(String email){
        this.email = email;
    }
	public String getname(){
		return name;
	}
	
	public void setname(String name){
		this.name = name;
	}
	
	public String getpassword(){
		return password;
	}
	
	public void setpassword(String password){
		this.password = password;
	}
	public String getphonenumber(){
		return phonenumber;
	}
	
	public void setphonenumber(String phonenumber){
		this.phonenumber = phonenumber;
	}
	public String execute(){
		String ret = ERROR;
		Connection conn = null;
		
		try{			
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/pro?useUnicode=true&characterEncoding=utf-8", "root", "123456");
		    Statement stmt=conn.createStatement();
		    String sql="select * from user";
		    ResultSet rs=stmt.executeQuery(sql);
		    while(rs.next())
		    {
		    	if(email.equals(rs.getString(1)))
		    	{
		    		return "sameemail";
		    	}
		    	if(phonenumber.equals(rs.getString(4)))
		    	{
		    		return "samephonenumber";
		    	}
		    }
		    rs.close();
		    if(ret.equals(ERROR))
		    {
		    	sql="insert into user(email,name,password,phonenumber) values('"+email+"','"+name+"','"+password+"','"+phonenumber+"')";
		    	stmt.executeUpdate(sql);
		    	ret = SUCCESS;
		    	 sql="CREATE TABLE c"+email+"(actid bigint(30) not null,primary key (actid));";
		    	stmt.executeUpdate(sql);
		    }	    
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
