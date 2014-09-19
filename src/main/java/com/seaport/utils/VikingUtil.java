package com.seaport.utils;

import java.io.UnsupportedEncodingException;
import java.util.Properties;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.SendFailedException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class VikingUtil {
	private static final int THREADS_NUM = 2;
	
	/**
	 * Checking if String object is empty meaning Viking empty business logic definition.
	 * @param strObject
	 * @return
	 */
	public static boolean isEmpty(String strObject) {
		if (strObject == null || strObject.trim().equalsIgnoreCase("")) {
			return true;
		}
		return false;
	}
	
	/**
	 * Specifically for Viking project it's checking type of record.
	 * @param archived
	 * @return
	 */
	public static boolean isArchived(String archived) {
		if (!isEmpty(archived)) {
			if (archived.equalsIgnoreCase(VikingConstant.VIKING_YES)) {
				return true;
			}
		}
		return false;
	}
	
	/**
	 * Sends email using external SMPT server. 
	 * @param nameFrom
	 * @param fromEmail
	 * @param subject
	 * @param message
	 * @param toEmail
	 * @throws AddressException
	 * @throws MessagingException
	 * @throws UnsupportedEncodingException
	 * @throws SendFailedException
	 */
	public static void sendEmail(final String nameFrom, final String fromEmail, final String subject, final String message, final String toEmail) {
		ExecutorService executor = Executors.newFixedThreadPool( THREADS_NUM );
        executor.submit( new Runnable() {
            @Override
            public void run()  {
                try {
					sendMailTo(nameFrom, fromEmail, subject, message, toEmail);
				} catch (AddressException e) {
					e.printStackTrace();
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				} catch (SendFailedException e) {
					e.printStackTrace();
				} catch (MessagingException e) {
					e.printStackTrace();
				}
            }
        } );

	}
	
	/*sending email in multiple threads*/
	public static void sendMailTo(String nameFrom, String fromEmail, String subject, String message, String toEmail) throws AddressException, MessagingException, 
					UnsupportedEncodingException, SendFailedException {
		//Set Mail properties
		Properties props = System.getProperties();
		props.setProperty("mail.smtp.starttls.enable", "true");
		props.setProperty("mail.smtp.host", "smtp.gmail.com");
		props.setProperty("mail.smtp.socketFactory.port", "465");
		props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.setProperty("mail.smtp.auth", "true");
		props.setProperty("mail.smtp.port", "465");
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("viking.openshift", "viking12345678");
			}
		});
		
		//Create the email with variable input
		MimeMessage mimeMessage = new MimeMessage(session);
		mimeMessage.setHeader("Content-Type", "text/plain; charset=UTF-8");
		mimeMessage.setFrom(new InternetAddress(fromEmail, nameFrom));
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
		mimeMessage.setSubject(subject, "utf-8");
		mimeMessage.setContent(message, "text/plain; charset=UTF-8");
		
		//Send the email
		Transport.send(mimeMessage);		
	}
}



