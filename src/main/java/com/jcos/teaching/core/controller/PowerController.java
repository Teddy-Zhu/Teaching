package com.jcos.teaching.core.controller;

import org.apache.log4j.Logger;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jcos.teaching.core.exmodel.LoginSession;
import com.jcos.teaching.core.model.Power;
import com.jcos.teaching.core.service.PowerService;
import com.jcos.teaching.core.util.PowerTool;

@Controller
@RequestMapping(value = "/Power")
public class PowerController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(PowerController.class);

	@Inject
	private PowerService powerService;

	@Inject
	private PowerTool pwTool;

	@RequestMapping(value = "/GetUserTypePower", method = RequestMethod.POST)
	@ResponseBody
	public List<Power> getPower(HttpServletRequest request, Model model, HttpServletResponse response) {
		if (!pwTool.authUserTypePower(request, "accesscontrol")) {
			response.setStatus(3388);
			return null;
		}
		int id = 0;
		try {
			id = Integer.valueOf(request.getParameter("id"));
		} catch (Exception e) {
			logger.debug(e.getMessage());
			response.setStatus(3386);
			return null;
		}
		return powerService.getPowerbyUserType(Arrays.asList(0, id));
	}

	@RequestMapping(value = "/UpdateUserTypePower", method = RequestMethod.POST)
	@ResponseBody
	public boolean updatePower(@RequestParam(value = "powerId[]") Integer[] powerId, HttpServletRequest request, Model model, HttpServletResponse response) {
		if (!pwTool.authUserTypePower(request, "accesscontrol")) {
			response.setStatus(3388);
			return false;
		}
		List<Integer> powerstrue = new ArrayList<Integer>();
		List<Integer> powersfalse = new ArrayList<Integer>();
		try {
			if (powerId.length > 0) {
				for (Integer i : powerId) {
					boolean value = Boolean.valueOf(request.getParameter("value" + i));
					if (value) {
						powerstrue.add(i);
					} else {
						powersfalse.add(i);
					}
				}
			}
		} catch (Exception e) {
			logger.debug(e.getMessage());
			response.setStatus(3386);
			return false;
		}
		if (powerstrue.size() > 0) {
			if (!powerService.updatePowers(1, powerstrue)) {
				return false;
			}
		}
		if (powersfalse.size() > 0) {
			if (!powerService.updatePowers(0, powersfalse)) {
				return false;
			}
		}

		// update db
		return false;
	}
}
