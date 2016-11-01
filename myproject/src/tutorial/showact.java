package tutorial;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.*;
import java.util.*;
public class showact extends ActionSupport {
	public String orderby;
	public ArrayList<Map<String,String>> list;
	public String getorderby(){
		return orderby;
	}
	public void setorderby(String orderby){
		this.orderby = orderby;
	}	
	public String execute(){
		String ret = ERROR;
		Connection con = null;
		list = new ArrayList<Map<String,String>>();
		if(orderby==null)
		{
		    orderby = "actid";
		}
		try{
  		    Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pro?useUnicode=true&characterEncoding=utf-8", "root", "123456");
            Statement stmt=con.createStatement();
        	String s="select * from act order by "+orderby+"";
        	ResultSet rs=stmt.executeQuery(s);
            while(rs.next())
            {
                Map<String,String> map = new HashMap<String,String>();
                map.put("actid", rs.getString(1));
                map.put("name", rs.getString(2));
                map.put("creatoremail", rs.getString(3));
                map.put("creator", rs.getString(4));
                map.put("place", rs.getString(5));
                map.put("sdate", rs.getString(6));
                map.put("edate", rs.getString(7));
                map.put("type", rs.getString(8));
                list.add(map);
            }
            rs.close();
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
