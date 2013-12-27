package com.seaport.utils;

public class SystemConstants {
	public static final String USER_MODEL = "userModel";
	
	public boolean localConfig;
	public boolean responsiveDesign;
	public boolean applPhaseII;
	
	public boolean isApplPhaseII() {
		return applPhaseII;
	}
	public void setApplPhaseII(boolean applPhaseII) {
		this.applPhaseII = applPhaseII;
	}
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
