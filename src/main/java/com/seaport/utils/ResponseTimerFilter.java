package com.seaport.utils;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class ResponseTimerFilter implements Filter {
  protected FilterConfig config;

  public void init(FilterConfig config) throws ServletException {
    this.config = config;
  }

  public void destroy() {
  }

  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
      throws ServletException, IOException {
    long startTime = System.currentTimeMillis();
    chain.doFilter(request, response);
    long elapsed = System.currentTimeMillis() - startTime;
    String name = "servlet";
    if (request instanceof HttpServletRequest) {
      name = ((HttpServletRequest) request).getRequestURI();
    }

    config.getServletContext().log(name + " took " + elapsed + " ms");
  }
}
