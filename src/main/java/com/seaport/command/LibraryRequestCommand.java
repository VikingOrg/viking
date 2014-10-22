package com.seaport.command;

/**
 * The abstract form class contains common data to be shared by others 
 * form classes in the presentation layer.<P>
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 10/22/14 <P>
 * 
 */

public class LibraryRequestCommand {
	private String supportMessage = "";

	public String getSupportMessage() {
		return supportMessage;
	}

	public void setSupportMessage(String supportMessage) {
		this.supportMessage = supportMessage;
	}
	
	
}
