package com.seaport.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
 
@ControllerAdvice
public class GlobalExceptionController {

//  If there is need to create custom Exception class...
//	@ExceptionHandler(CustomGenericException.class)
//	public ModelAndView handleCustomException(CustomGenericException ex) {
//		ModelAndView model = new ModelAndView("error/generic_error");
//		model.addObject("errCode", ex.getErrCode());
//		model.addObject("errMsg", ex.getErrMsg());
//		return model;
//	}
 
	@ExceptionHandler(Exception.class)
	public ModelAndView handleAllException(HttpServletRequest request, Exception ex) {
 
		ModelAndView model = new ModelAndView("blank");
		// Make more information available to the view
		model.addObject("exception", ex);
		model.addObject("url", request.getRequestURL());
		model.addObject("timestamp", new Date());
		model.addObject("status", 500);			
		model.addObject("errMsg", "this is Exception.class");
		return model;
 	}
}