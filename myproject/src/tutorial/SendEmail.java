package tutorial;

import java.util.Date;

import java.util.Properties;  
 
import java.util.*;
import javax.mail.*;  
import javax.mail.internet.*;  

public class SendEmail {
	String host;
	String username;
	String password;
	String fromAddr;
	String toAddr;
	String subject;
	String content;
	Address[] address;

	public SendEmail()
	{
		// 鍙橀噺鍒濆鍖�
		host = "smtp.163.com";
		username = "";
		password = "";
		fromAddr = "@";
	}

	// 鍙戦�侀偖浠�
	public boolean sendMail()
	{
		Properties prop;
		Session session;
		MimeMessage msg;

		try
		{
			prop = new Properties(); // 瀛樺偍杩炴帴鍙傛暟
			prop.put("mail.smtp.host",host);
			prop.put("mail.smtp.auth","true");

			session = Session.getDefaultInstance(prop,null); // 鑾峰緱涓�涓偖浠剁殑Session
			msg = new MimeMessage(session); // 閭欢淇℃伅

			// 妫�鏌ラ偖浠跺湴鍧�鏄惁鍚堟硶
			if(fromAddr == null || fromAddr.equals(""))
			{
				throw new Exception("鍙戜欢鍦板潃閿欒");
			}
			if(toAddr == null || toAddr.equals(""))
			{
				throw new Exception("鐩爣鍦板潃閿欒");
			}

			//璁剧疆婧愬湴鍧�
			msg.setFrom(new InternetAddress(fromAddr));
			//璁剧疆鐩殑鍦板潃
			
		
			String[] gods = toAddr.split("[,]");	
			System.out.println(toAddr);
			System.out.println(gods.length);
			address = new InternetAddress[gods.length];
			for(int i=0;i<gods.length;i++){
				address[i] = new InternetAddress(gods[i]);
			}
			msg.setRecipients(Message.RecipientType.TO,address);
			//璁剧疆涓婚
			msg.setSubject(subject,"GBK");

			Multipart mp = new MimeMultipart(); //閭欢鍐呭
			MimeBodyPart mbpContent = new MimeBodyPart();
			mbpContent.setContent(content,"text/html;charset=GBK"); // 閭欢鏍煎紡


			mp.addBodyPart(mbpContent);
			msg.setContent(mp,"text/html;charset=GBK");
			msg.setSentDate(new Date());

			// 鍙戦�侀偖浠�
			Transport transport = session.getTransport("smtp");
			transport.connect((String)prop.get("mail.smtp.host"),username,password);
			transport.sendMessage(msg,msg.getRecipients(MimeMessage.RecipientType.TO));

			transport.close();
			return true;
		}
		catch(Exception e)
		{
			System.out.println(e);
			return false;
		}
	}

	// getter and setter
	public String getPassword()
	{
		return password;
	}
	public void setPassword(String password)
	{
		this.password = password;
	}

	public String getHost()
	{
		return host;
	}
	public void setHost(String host)
	{
		this.host = host;
	}

	public String getUsername()
	{
		return username;
	}
	public void setUsername(String username)
	{
		this.username = username;
	}

	public String getFromAddr()
	{
		return this.fromAddr;
	}
	public void setFromAddr(String addr)
	{
		fromAddr = addr;
	}

	public String getToAddr()
	{
		return this.toAddr;
	}
	public void setToAddr(String addr)
	{
		toAddr = addr;
	}

	public String getSubject()
	{
		return subject;
	}
	public void setSubject(String sub)
	{
		subject = sub;
	}

	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	


}