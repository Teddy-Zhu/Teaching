package com.jcos.teaching.core.util;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class SessionFilter  implements HandlerInterceptor {

	public boolean isEqualsStr(String origin, String[] allowlist) {
		for (String list : allowlist) {
			if (origin.equals(list)) {
				return true;
			}
		}
		return false;
	}

	public boolean isContainStr(String origin, String[] allowlist) {
		for (String list : allowlist) {
			if (origin.contains(list)) {
				return true;
			}
		}
		return false;
	}

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		HttpSession session = request.getSession();
		String url = request.getRequestURI();
		String[] allowliste = new String[] { "/", "index" };
		String[] allowlistc = new String[] { "logout", "/resources/", "/Type/", "/action/", "User/AuthLogout", "/User/AuthUserName", "/User/AuthLogin", "/User/AuthRegister", "AdminMenu" };

		if (session.getAttribute("loginSession") == null) {
			if (isEqualsStr(url, allowliste) || isContainStr(url, allowlistc)) {
				return true;
			} else {
				if (request.getHeader("x-requested-with") != null && request.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")) {
					response.setStatus(3389);
					return false;
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
					return false;
				}
			}
		} else {
			return true;
		}
	}

}
