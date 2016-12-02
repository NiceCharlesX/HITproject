 /*
   * Classname 
   * activity
   * Version information
   * 2.2.2
   * Date
   * 11-10
   * Copyright notice
   */
	  
package tutorial;

import java.util.*;

public class activity {
    public String actid;            //id of activity
    public  String name;            //name of activity
    public  String cphonenumber;    //phone number of creator
    public String creator;          //name of creator
    public String place;            //place of activity
    public String sdate;            //start date
    public String edate;            //end date
    public String type;             //type of activity
    public String brief;            //brief introduction
    public String posterid;         //id of poster
    public ArrayList<Map<String,String>> slist;   //list of schedule
    
    public ArrayList<Map<String,String>> getslist(){
        return slist;
    }
    
    public void setslist(ArrayList<Map<String,String>> slist){
        this.slist = slist;
    } 
    
    public String getactid(){
        return actid;
    }
    
    public void setactid(String actid){
        this.actid = actid;
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
    
    public String getbrief(){
        return brief;
    }   
    
    public void setbrief(String brief){
        this.brief = brief;
    }
    
    public String getposterid(){
        return posterid;
    }   
    
    public void setposterid(String posterid){
        this.posterid = posterid;
    }
}








