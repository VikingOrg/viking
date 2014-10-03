package com.seaport.utils;

/**
 * Static constants and public static objects for application. 
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 08/16/14 <P>
 */

public class VikingConstant {
	/*Application wide user object name to get access from session.*/
	public static final String USER_MODEL = "userModel";
	
	/*E-mail related constants*/
	public static String MAIL_ADMIN_EMAIL = "viking.openshift@gmail.com";
	public static String MAIL_FROM_EMAIL = "vetalik@gotmilk.com";
	
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
	
	/*User Roles*/
	public static int USER_ROLE_ADMIN = 1;
	public static int USER_ROLE_MECH = 2;
	public static int USER_ROLE_GUEST = 3;

	/*Not static Global properties settings.*/
	public boolean localConfig;
	public boolean responsiveDesign;
	public String rootPath;
	public String userImgPath;
	public String modelImgPath;

	/*Record types (for now)*/
	public static String RECORD_TYPE_ALL = "ALL";
	public static String RECORD_TYPE_ACTIVE = "A";
	public static String RECORD_TYPE_ARCHIVED = "Y";
	public static String RECORD_TYPE_RETIRED = "R";
	
	/*Default image file names for Users, Models etc*/
	public static String DEFAULT_USER_IMG = "default.jpg";
	
	/*Semantic shortcuts*/
	public static String VIKING_YES = "Y";
	
	public String getModelImgPath() {
		return modelImgPath;
	}
	public void setModelImgPath(String modelImgPath) {
		this.modelImgPath = modelImgPath;
	}
	public String getUserImgPath() {
		return userImgPath;
	}
	public void setUserImgPath(String userImgPath) {
		this.userImgPath = userImgPath;
	}
	public String getRootPath() {
		return rootPath;
	}
	public void setRootPath(String rootPath) {
		this.rootPath = rootPath;
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
