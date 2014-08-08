package com.seaport.utils;

public class VikingUtils {
	public static boolean isEmpty(String strObject) {
		if (strObject == null || strObject.trim().equalsIgnoreCase("")) {
			return true;
		}
		return false;
	}
}
