package tutorial;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.*;
import java.util.*;
public class mycollection extends ActionSupport {
	public String phonenumber;
	public ArrayList<Map<String,String>> list;
	public String getphonenumber(){
		return phonenumber;
	}
	public void setphonenumber(String phonenumber){
		this.phonenumber = phonenumber;
	}	
	public String execute(){
		String ret = ERROR;
		Connection con = null;
		list = new ArrayList<Map<String,String>>();
		try{
		    String actid;
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://cnphlspinrfu.rds.sae.sina.com.cn:10468/bookdb?useUnicode=true&characterEncoding=utf-8", "bookdb", "02111996");
		    Statement stmt=con.createStatement();
		    String s="select * from c"+phonenumber+"";
            ResultSet rss=stmt.executeQuery(s);
		    while(rss.next())
		    {
		        actid= rss.getString(1);
		        s="select * from book where actid ='"+actid+"'";
	            ResultSet rs=stmt.executeQuery(s);
	            rs.next();
	            Map<String,String> map = new HashMap<String,String>();
	            map.put("ISBN", rs.getString(1));
	            map.put("Title", rs.getString(2));
	            map.put("AuthorID", rs.getString(3));
	            map.put("Publisher", rs.getString(4));
	            map.put("PublishDate", rs.getString(5));
	            map.put("Price", rs.getString(6));
	            list.add(map);
	            rs.close();
		    }
		    rss.close();
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
