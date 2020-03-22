package com.backend.service;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MailService {
	@Transactional(propagation= Propagation.REQUIRED)
	public boolean sendLink(String requestURL, String email,String name, String typeOfLink) {
		boolean check = true;
		try {
			Properties mailServerProperties;
			Session getMailSession;
			MimeMessage mailMessage;
			String from = "zenfone51997@gmail.com";
			String password = "123456789asdA";
			String to = email;
			mailServerProperties = System.getProperties();
			mailServerProperties.put("mail.smtp.port", "587");
			mailServerProperties.put("mail.smtp.auth", "true");
			mailServerProperties.put("mail.smtp.starttls.enable", "true");
			mailServerProperties.put("mail.smtp.host", "smtp.gmail.com");
			mailServerProperties.put("mail.smtp.starttls.required", "true");
			getMailSession = Session.getDefaultInstance(mailServerProperties, null);
			mailMessage = new MimeMessage(getMailSession);

			mailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			String messageText = "";
			// there are two types of link. verification and reset password link
			if(typeOfLink.equals("verification")) {
				messageText = "Thank you for creating an account in our company. \r\n" + 
						"\r\n" + 
						"Please visit the link below to verify your email address and complete your registration.\r\n" + 
						"\r\n" + 
						requestURL+" \r\n" + 
						"\r\n" + 
						"You are receiving this email because you recently created an account or changed your email address. If you did not do this, please contact us.\r\n" + 
						"\r\n" + 
						"Kind regards\r\n";
				mailMessage.setSubject("Verify Your Registration");
			}
			else {
				messageText = "Hi "+name+", \r\n" + 
						"\r\n" + 
						"Please visit the link below to change your password.\r\n" + 
						"\r\n" + 
						requestURL+" \r\n" + 
						"\r\n" + 
						"You are receiving this email because you recently asked for resetting your password. If you did not do this, please contact us.\r\n" + 
						"\r\n" + 
						"Kind regards\r\n";
				mailMessage.setSubject("Your password reset request");
			}
			mailMessage.setText(messageText);
			Transport transport = getMailSession.getTransport("smtp");
			transport.connect("smtp.gmail.com", from, password);
			transport.sendMessage(mailMessage, mailMessage.getAllRecipients());
			transport.close();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			check = false;
		}
		return check;
	}
}
