package com.jcos.teaching.core.util.filter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.jcos.teaching.core.util.PersonalConfigTool;
import com.jcos.teaching.core.util.PowerTool;
import com.jcos.teaching.core.util.annotation.AuthGlobalConfig;
import com.jcos.teaching.core.util.annotation.AuthPower;
import com.jcos.teaching.core.util.annotation.SetGlobalSettings;
import com.jcos.teaching.core.util.annotation.SetPerSettings;
import com.jcos.teaching.core.util.annotation.SetPower;

public class AuthenticationFilter implements HandlerInterceptor {

	@Inject
	private PowerTool pwTool;
	@Inject
	private PersonalConfigTool pcTool;

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3) throws Exception {

	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView model) throws Exception {
		if (handler.getClass().isAssignableFrom(HandlerMethod.class)) {
			SetPower set = ((HandlerMethod) handler).getMethodAnnotation(SetPower.class);
			if (set != null) {
				String value = set.value();
				if (!("").trim().equals(value)) {
					pwTool.setModel(request, model, value);
				}
			}
			SetPerSettings setuser = ((HandlerMethod) handler).getMethodAnnotation(SetPerSettings.class);
			if (setuser != null) {
				String[] value = setuser.value();
				if (value.length != 0) {
					pcTool.setModelPConfig(request, model, value);
				}
			}
			SetGlobalSettings setglobalsetting = ((HandlerMethod) handler).getMethodAnnotation(SetGlobalSettings.class);
			if (setglobalsetting != null) {
				String[] value = setglobalsetting.value();
				if (value.length != 0) {
					pcTool.setGlobalConfig(model, value);
				}
			}
		}
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		if (handler.getClass().isAssignableFrom(HandlerMethod.class)) {
			boolean flag = true;
			AuthPower auth = ((HandlerMethod) handler).getMethodAnnotation(AuthPower.class);
			if (auth != null) {
				String value = auth.value();
				if (!pwTool.authUserTypePower(request, value)) {
					response.setStatus(3388);
					flag = false;
				}
			}
			AuthGlobalConfig authConfig = ((HandlerMethod) handler).getMethodAnnotation(AuthGlobalConfig.class);
			if (authConfig != null) {
				String value = authConfig.value();
				if (!pwTool.authGlobalConfig(value)) {
					response.setStatus(3388);
					flag = false;
				}
			}
			return flag;
		} else {
			return true;
		}
	}
}
