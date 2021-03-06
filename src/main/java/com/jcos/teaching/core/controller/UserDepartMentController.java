package com.jcos.teaching.core.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jcos.teaching.core.model.UserDepartMent;
import com.jcos.teaching.core.service.UserDepartMentService;
import com.jcos.teaching.core.service.UserService;
import com.jcos.teaching.core.util.PowerTool;
import com.jcos.teaching.core.util.annotation.AuthPower;

@Controller
@RequestMapping(value = "/DepartMent")
public class UserDepartMentController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(UserDepartMentController.class);

	@Inject
	private UserService userService;

	@Inject
	private PowerTool pwTool;

	@Inject
	private UserDepartMentService userDepartMentService;

	@RequestMapping(value = "/GetAllDepartMent", method = RequestMethod.POST)
	@ResponseBody
	public List<UserDepartMent> getAlldepartMent(HttpServletRequest request, Model model, HttpServletResponse response) {
		if (!pwTool.authUserTypePower(request, "queryuserdepart")) {
			response.setStatus(3388);
			return null;
		}
		return userDepartMentService.getAllDepartMent();
	}

	@RequestMapping(value = "/Update", method = RequestMethod.POST)
	@ResponseBody
	@AuthPower(value = "edituserdepart")
	public boolean updateDepartMent(HttpServletRequest request, Model model, HttpServletResponse response) {
		int id = 0, oldParentId = 0, newParentId = 0;
		String name = "";
		try {

			id = Integer.valueOf(request.getParameter("id"));
			oldParentId = Integer.valueOf(request.getParameter("oldParentId"));
			newParentId = Integer.valueOf(request.getParameter("newParentId"));
			name = request.getParameter("name");
		} catch (Exception e) {
			logger.debug(e.getMessage());
			response.setStatus(3386);
			return false;
		}
		if (id == 1) {
			return false;
		}
		if (oldParentId == 1 && oldParentId != newParentId) {
			return false;
		}
		if (name.equals("")) {
			return false;
		}
		UserDepartMent record = new UserDepartMent();

		record.setIntid(id);
		record.setIntparentid(newParentId);
		record.setIsleaf(null);
		record.setStrname(name);
		return userDepartMentService.updateDepartMent(record);

	}

	@RequestMapping(value = "/Insert", method = RequestMethod.POST)
	@ResponseBody
	@AuthPower(value = "adduserdepart")
	public boolean insertDepartMent(HttpServletRequest request, Model model, HttpServletResponse response) {
		int parentid = 0;
		String name = "";
		try {
			parentid = Integer.valueOf(request.getParameter("parentId"));
			name = request.getParameter("name");

		} catch (Exception e) {
			logger.debug(e.getMessage());
			response.setStatus(3386);
			return false;
		}

		UserDepartMent record = new UserDepartMent();

		record.setIntid(null);
		record.setIntparentid(parentid);
		record.setIsleaf(0);
		record.setStrname(name);

		return userDepartMentService.insertDepartMent(record);
	}

	@RequestMapping(value = "/Delete", method = RequestMethod.POST)
	@ResponseBody
	@AuthPower(value = "rmuserdepart")
	public boolean deleteDepartMent(HttpServletRequest request, Model model, HttpServletResponse response) {
		int id = 0;

		try {
			id = Integer.valueOf(request.getParameter("id"));
		} catch (Exception e) {
			logger.debug(e.getMessage());
			response.setStatus(3386);
			return false;
		}
		List<UserDepartMent> depart = userDepartMentService.getAllDepartMent(id);
		if (depart != null) {
			if (depart.size() > 0) {
				return false;
			}
		}
		if (!userService.authUserDepartMent(id)) {
			return false;
		}
		return userDepartMentService.deleteDepartMent(id);
	}
}
