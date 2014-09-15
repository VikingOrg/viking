package com.seaport.aop;

import org.aopalliance.intercept.MethodInvocation;
import org.apache.commons.logging.Log;
import org.springframework.aop.interceptor.CustomizableTraceInterceptor;

/**
 * Extends {@link CustomizableTraceInterceptor} to provide custom logging levels
 */
public class TraceInterceptor extends CustomizableTraceInterceptor {
	private static final long serialVersionUID = 287162721460370957L;
  
	@Override
	protected void writeToLog(Log logger, String message, Throwable ex) {
	    if (ex != null) {
	    	logger.info(message, ex);
	    } else {
	    	logger.info(message);
	        //System.out.println(message);
	    }
	}

	@Override
	protected boolean isInterceptorEnabled(MethodInvocation invocation, Log logger) {
		return true;
	}
}