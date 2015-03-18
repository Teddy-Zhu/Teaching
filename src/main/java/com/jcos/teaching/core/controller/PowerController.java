package com.jcos.teaching.core.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jcos.teaching.core.model.Power;
import com.jcos.teaching.core.service.PowerService;
import com.jcos.teaching.core.util.annotation.AuthPower;

@Controller
@RequestMapping(value = "/Power")
public class PowerController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(PowerController.class);

	@Inject
	private PowerService powerService;

	@RequestMapping(value = "/GetUserTypePower", method = RequestMethod.POST)
	@ResponseBody
	@AuthPower(value = "accesscontrol")
	public List<Power> getPower(HttpServletRequest request, Model model, HttpServletResponse response) {
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
	@AuthPower(value = "accesscontrol")
	public boolean updatePower(@RequestParam(value = "powerId[]") Integer[] powerId, HttpServletRequest request, Model model, HttpServletResponse response) {
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
