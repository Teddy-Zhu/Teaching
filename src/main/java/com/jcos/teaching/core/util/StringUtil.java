package com.jcos.teaching.core.util;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

@Service
public class StringUtil {
	
	public boolean isNull(HttpServletRequest request, String variable) {
		if (request != null && variable != null && !variable.equals("")) {
			if (request.getParameter(variable) != null && !request.getParameter(variable).equals("")) {
				return false;
			} else {
				return true;
			}
		} else {
			return true;
		}
	}
}
