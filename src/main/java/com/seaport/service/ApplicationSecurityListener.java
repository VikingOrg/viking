package com.seaport.service;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.security.access.event.AuthorizationFailureEvent;
import org.springframework.security.authentication.event.AuthenticationFailureBadCredentialsEvent;
import org.springframework.security.authentication.event.AuthenticationSuccessEvent;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.seaport.dao.IUserDAO;
import com.seaport.domain.User;

@Service
@Transactional
public class ApplicationSecurityListener implements ApplicationListener<ApplicationEvent>{
	@Autowired
	private IUserDAO userDAO;
	
	@Override
	public void onApplicationEvent(ApplicationEvent event) {
	  if ( event instanceof AuthorizationFailureEvent )	  {
	      AuthorizationFailureEvent authorizationFailureEvent = ( AuthorizationFailureEvent ) event;
	  }  else if ( event instanceof AuthenticationFailureBadCredentialsEvent )  {
	      AuthenticationFailureBadCredentialsEvent badCredentialsEvent = ( AuthenticationFailureBadCredentialsEvent ) event;
	  }
	          //login success event
	  else if ( event instanceof AuthenticationSuccessEvent )  {
	      AuthenticationSuccessEvent authenticationSuccessEvent = ( AuthenticationSuccessEvent ) event;
	      UserDetails userDetails = (UserDetails)authenticationSuccessEvent.getAuthentication().getPrincipal();
	      User loggedUser = userDAO.getUser(userDetails.getUsername());
	      
	      SimpleDateFormat isoFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
	      isoFormat.setTimeZone(TimeZone.getTimeZone("Europe/Moscow"));
	      Date date = new Date();
		  try {
			date = isoFormat.parse("2010-05-23T09:01:02");
		  } catch (ParseException e) {
			 e.printStackTrace();
		  }	
	      
	      loggedUser.setLastLoginDate(new Timestamp(date.getTime()));
	      userDAO.saveUser(loggedUser);
	  }	else {
	      //System.out.println ( "undefined: " + event.getClass ().getName () );
	  }
	}
}