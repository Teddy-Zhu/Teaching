package com.jcos.teaching.core.Util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SessionFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		HttpSession session = httpRequest.getSession();

		String loginUrl = httpRequest.getContextPath() + "/";
		String url = httpRequest.getRequestURI();
		if (session.getAttribute("loginSession") == null) {
			if (url.equals("/") || url.equals("/index") || url.contains("logout") || url.contains("/resources/") || url.contains("/Type/")|| url.contains("/User/") || url.contains("/action/") || url.contains("AdminMenu")) {
				chain.doFilter(request, response);
			} else {
				if (httpRequest.getHeader("x-requested-with") != null && httpRequest.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")) {
					httpResponse.setStatus(3389);
				} else {
					String str = "<script language='javascript'>sessionout();</script>";
					response.setContentType("text/html;charset=UTF-8");
					try {
						PrintWriter writer = response.getWriter();
						writer.write(str);
						writer.flush();
						writer.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		} else {
			chain.doFilter(request, response);
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
	}

}
