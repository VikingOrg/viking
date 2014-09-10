package com.seaport.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.seaport.dao.IUserDAO;
import com.seaport.utils.VikingUtil;

@Service("customUserDetailsService")
@Transactional(readOnly=true)
public class CustomUserDetailsService implements UserDetailsService {
	
	@Autowired
	private IUserDAO userDAO;	

	public UserDetails loadUserByUsername(String login)	throws UsernameNotFoundException {
		
		com.seaport.domain.User domainUser = userDAO.getUser(login);
		
		boolean enabled = true;
		boolean accountNonExpired = true;
		boolean credentialsNonExpired = true;
		boolean accountNonLocked = true;

	    if(domainUser==null) { 
	    	throw new UsernameNotFoundException("No such user: ");
	    } else if (domainUser.getRole()==null) { 
	    	throw new UsernameNotFoundException("User " + domainUser.getLogin() + " has no authorities");
	    } else if (VikingUtil.isArchived(domainUser.getArchived())) { 
	    	throw new UsernameNotFoundException("User " + domainUser.getLogin() + " has no authorities");
	    }		
		
		User user = new User(
					domainUser.getLogin(), 
					domainUser.getPassword(), 
					enabled, 
					accountNonExpired, 
					credentialsNonExpired, 
					accountNonLocked,
					getAuthorities(domainUser.getRole().getId())
					);
		
		return user;
	}
	
	public Collection<? extends GrantedAuthority> getAuthorities(Integer role) {
		List<GrantedAuthority> authList = getGrantedAuthorities(getRoles(role));
		return authList;
	}
	
	public List<String> getRoles(Integer role) {

		List<String> roles = new ArrayList<String>();
		if (role.intValue() == 1) {
			roles.add("ROLE_USER");
			roles.add("ROLE_ADMIN");
			roles.add("ROLE_GUEST");
			
		} else if (role.intValue() == 2) {
			roles.add("ROLE_USER");
			roles.add("ROLE_GUEST");
		} else if (role.intValue() == 3)
			roles.add("ROLE_GUEST");
		return roles;
	}
	
	public static List<GrantedAuthority> getGrantedAuthorities(List<String> roles) {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		
		for (String role : roles) {
			authorities.add(new SimpleGrantedAuthority(role));
		}
		return authorities;
	}

}
