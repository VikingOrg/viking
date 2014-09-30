package com.seaport.service;

import java.sql.Timestamp;
import java.util.Date;

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
	      
	      loggedUser.setLastLoginDate(new Timestamp(new Date().getTime()));
	      userDAO.saveUser(loggedUser);
	  }	else {
	      //System.out.println ( "undefined: " + event.getClass ().getName () );
	  }
	}
}