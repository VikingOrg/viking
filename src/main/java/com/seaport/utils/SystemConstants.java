package com.seaport.utils;

/**
 * Static constants and public static objects for application. 
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 08/16/14 <P>
 */

public class SystemConstants {
	/*Application wide user object.*/
	public static final String USER_MODEL = "userModel";
	
	/*Ajax RESTfull request types.*/
	public static String TRANS_TYPE_DELETE = "delete";
	public static String TRANS_TYPE_CREATE = "create";
	public static String TRANS_TYPE_UPDATE = "update";
	public static String TRANS_TYPE_COPY = "copy";

	/*For Reports Filters. */
	public static String COMPANY_MULTI_FILTER = "1";
	public static String COMPANY_SINGLE_FILTER = "2";
	public static String GROUP_FILTER = "3";
	public static String MODEL_FILTER = "4";
	public static String YEAR_START_FILTER = "5";
	public static String YEAR_END_FILTER = "6";
	public static String MANUFACTOR_FILTER = "7";
	
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
