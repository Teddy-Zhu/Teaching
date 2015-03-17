package com.jcos.teaching.core.util.filter;

import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.jcos.teaching.core.exmodel.LoginSession;
import com.jcos.teaching.core.util.PersonalConfigTool;
import com.jcos.teaching.core.util.PowerTool;
import com.jcos.teaching.core.util.auth.AuthPower;
import com.jcos.teaching.core.util.auth.SetAttributes;
import com.jcos.teaching.core.util.auth.SetPower;
import com.jcos.teaching.core.util.auth.SetSettings;

public class AuthenticationFilter implements HandlerInterceptor {

	@Inject
	private PowerTool pwTool;
	@Inject
	private PersonalConfigTool pcTool;

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView model) throws Exception {
		if (handler.getClass().isAssignableFrom(HandlerMethod.class)) {
			SetAttributes attributes = ((HandlerMethod) handler).getMethodAnnotation(SetAttributes.class);
			if (attributes != null) {
				String[] value = attributes.value();
				String[] name = attributes.name();
				if (value.length != 0 && name.length != 0 && value.length == name.length) {
					for (int i = 0; i < value.length; i++) {
						model.addObject(value[i], name[i]);
					}
				}
			}
			SetPower set = ((HandlerMethod) handler).getMethodAnnotation(SetPower.class);
			if (set != null) {
				String value = set.value();
				if (!value.trim().equals("")) {
					pwTool.setModel(request, model, value);
				}
			}
			SetSettings setuser = ((HandlerMethod) handler).getMethodAnnotation(SetSettings.class);
			if (setuser != null) {
				String[] value = setuser.value();
				if (value.length != 0) {
					pcTool.setModelPConfig(request, model, value);
				}
			}
		}
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		// if (handler.getClass().isAssignableFrom(HandlerMethod.class)) {
		// AuthPower auth = ((HandlerMethod)
		// handler).getMethodAnnotation(AuthPower.class);
		// if (auth == null) {
		// return true;
		// } else {
		// String value = auth.value();
		// if (!pwTool.authUserTypePower(request, "querybook")) {
		// response.setStatus(3388);
		// return false;
		// } else {
		// return true;
		// }
		// }
		// } else {
		// return true;
		// }
		return true;
	}
}
