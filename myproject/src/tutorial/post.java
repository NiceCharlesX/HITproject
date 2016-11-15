package tutorial;

import java.util.*;

public class post{
  public String getpost(String type){
      switch(type){
        case "课程":
          return "1";
        case "体育":
          return "2";
        case "歌唱":
          return "3";
        case "讲座":
          return "4";
        case "舞蹈":
          return "5";
        default:
          return "0";        
      }
  } 
}
