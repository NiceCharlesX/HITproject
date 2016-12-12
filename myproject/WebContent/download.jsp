<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE >
<html>
<head>
   <meta charset="utf-8"> 
   <title>下载海报</title>
   <meta name="viewport"
          content=" height = device-height,
                    width = device-width,
                    initial-scale = 1.0,
                    minimum-scale = 1.0,
                    maximum-scale = 1.0,
                    user-scalable = no"/>
                    
   <link rel="stylesheet" type="text/css" href="css/post.css"/>
   <link rel="stylesheet" type="text/css" href="css/post2.css"/>
   <link rel="stylesheet" type="text/css" href="css/post3.css"/>    
     
     
</head>
				
				<div class="post<s:property value="act.posterid"/>" >
						<img src="images/post<s:property value="act.posterid"/>.jpg" alt="" />
						<p class = "name<s:property value="act.posterid"/>"><s:property value="act.name"/></p>
						<p class = "sdate<s:property value="act.posterid"/>"><s:property value="act.sdate"/></p>
						<p class = "place<s:property value="act.posterid"/>">地点：<s:property value="act.place"/></p>
						<p class = "creator<s:property value="act.posterid"/>">主办方：<s:property value="act.creator"/></p>
						<p class = "cphonenumber<s:property value="act.posterid"/>">联系方式：<s:property value="act.cphonenumber"/></p>
						<p class = "brief<s:property value="act.posterid"/>"><s:property value="act.brief"/></p>
						
				</div>
					
				<jsp:forward page="myactivity"/>
		
<body>
</body>
</html>