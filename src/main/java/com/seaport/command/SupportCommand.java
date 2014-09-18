package com.seaport.command;

/**
 * The abstract form class contains common data to be shared by others 
 * form classes in the presentation layer.<P>
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 09/18/14 <P>
 * 
 */

public class SupportCommand {
	private String supportMessage = "";

	public String getSupportMessage() {
		return supportMessage;
	}

	public void setSupportMessage(String supportMessage) {
		this.supportMessage = supportMessage;
	}
	
	
}
