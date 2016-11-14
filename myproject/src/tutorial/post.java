package tutorial;

import java.util.*;

public class post{
  public String getpost(String type){
      switch(type){
        case "会议":
          return "1";
        case "展览":
          return "2";
        case "论坛":
          return "3";
        case "课程":
          return "4";
        case "讲座":
          return "5";
        default:
          return "0";        
      }
  } 
}
