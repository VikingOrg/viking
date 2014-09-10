package com.seaport.utils;

public class VikingUtil {
	
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
	
	public static boolean isArchived(String archived) {
		if (!isEmpty(archived)) {
			if (archived.equalsIgnoreCase(VikingConstant.VIKING_YES)) {
				return true;
			}
		}
		return false;
	}
}
