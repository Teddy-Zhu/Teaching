package com.jcos.teaching.core.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jcos.teaching.core.exmodel.LoginSession;
import com.jcos.teaching.core.model.CourseType;
import com.jcos.teaching.core.service.BookPlanService;
import com.jcos.teaching.core.service.CourseTypeService;
import com.jcos.teaching.core.service.PowerService;

@Controller
@RequestMapping(value = "/Plan")
public class PlanController {

	@Inject
	private PowerService powerService;

	@Inject
	private BookPlanService bookPlanService;

	@Inject
	private CourseTypeService courseTypeService;

	/**
	 * 
	 * @param request
	 * @return
	 */
	public boolean authUserTypePower(HttpServletRequest request, String name) {
		LoginSession loginSession = (LoginSession) request.getSession().getAttribute("loginSession");
		if (loginSession == null) {
			return false;
		}
		return powerService.queryPowerByName(name, loginSession.getLoginUser().getIntid());
	}

	@RequestMapping(value = "/Submit", method = RequestMethod.POST)
	@ResponseBody
	public boolean getbooks(HttpServletRequest request, Model model, HttpServletResponse response) {
		if (!authUserTypePower(request, "submitplan")) {
			response.setStatus(3388);
			return false;
		}

		return false;
	}

	@RequestMapping(value = "/GetCourseType", method = RequestMethod.POST)
	@ResponseBody
	public List<CourseType> getcoursetype(HttpServletRequest request, Model model, HttpServletResponse response) {

		return courseTypeService.getAllCourseType();
	}
}
