<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Mail</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	</head>
	<body>
		<center>
			<jsp:useBean id="email" class="tutorial.SendEmail" scope="page" />
			<jsp:setProperty name="email" property="toAddr" value="921159963@qq.com,2540116937@qq.com" />
			<jsp:setProperty name="email" property="fromAddr" value="18245010845@163.com" />
			<jsp:setProperty name="email" property="username" value="18245010845@163.com" />
			<jsp:setProperty name="email" property="password" value="as123456" />
			<jsp:setProperty name="email" property="subject" value="mail test" />
			<jsp:setProperty name="email" property="content" value="qun fa test!!!!!!" />

			
			<%=email.sendMail() %>
			
		</center>

	</body>
</html>