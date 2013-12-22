package com.seaport.utils;

public class SystemConstants {
	public static final String USER_MODEL = "userModel";
	public static final String PAGE_STATE_USER_SEARCH = "pageStatusUserSearch";
	
	public boolean localConfig;
	public boolean responsiveDesign;
	
	public boolean isLocalConfig() {
		return localConfig;
	}
	public void setLocalConfig(boolean localConfig) {
		this.localConfig = localConfig;
	}
	public boolean isResponsiveDesign() {
		return responsiveDesign;
	}
	public void setResponsiveDesign(boolean responsiveDesign) {
		this.responsiveDesign = responsiveDesign;
	}
	
}
