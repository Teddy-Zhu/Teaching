package com.jcos.teaching.core.controller;

import java.util.HashMap;
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

import com.jcos.teaching.core.exmodel.LoginSession;
import com.jcos.teaching.core.model.BookType;
import com.jcos.teaching.core.model.Power;
import com.jcos.teaching.core.model.UserType;
import com.jcos.teaching.core.service.BookService;
import com.jcos.teaching.core.service.BookTypeService;
import com.jcos.teaching.core.service.PowerService;
import com.jcos.teaching.core.service.UserService;
import com.jcos.teaching.core.service.UserTypeService;

@Controller
@RequestMapping(value = "/TypeOperate")
public class TypeOperateController {

	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TypeController.class);

	@Inject
	private UserTypeService userTypeService;
	@Inject
	private BookTypeService bookTypeService;
	@Inject
	private BookService bookService;
	@Inject
	private UserService userService;
	@Inject
	private PowerService powerService;

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

	@RequestMapping(value = "/UpdateUserType", method = RequestMethod.POST)
	@ResponseBody
	public boolean updateUserType(HttpServletRequest request, Model model, HttpServletResponse response) {
		if (!authUserTypePower(request, "editusertype")) {
			response.setStatus(3388);
			return false;
		}
		int id = 0, check = 0;
		String name = "";
		try {
			id = Integer.valueOf(request.getParameter("id"));
			check = Integer.valueOf(request.getParameter("allowreg"));
			name = request.getParameter("name").trim();
		} catch (Exception e) {
			logger.debug(e.getMessage());
			response.setStatus(3386);
			return false;
		}
		if (name.equals("")) {
			return false;
		}
		UserType type = new UserType();
		type.setIntidentityid(id);
		type.setStrname(name);
		type.setIntallowreg(check);
		return userTypeService.updateUserType(type);
	}

	@RequestMapping(value = "/InsertUserType", method = RequestMethod.POST)
	@ResponseBody
	public boolean insertUserType(HttpServletRequest request, Model model, HttpServletResponse response) {
		if (!authUserTypePower(request, "addusertype")) {
			response.setStatus(3388);
			return false;
		}
		int check = 0;
		String name = "";
		try {
			check = Integer.valueOf(request.getParameter("allowreg"));
			name = request.getParameter("name").trim();
		} catch (Exception e) {
			logger.debug(e.getMessage());
			response.setStatus(3386);
			return false;
		}
		if (name.equals("")) {
			return false;
		}
		if (!userTypeService.authusertype(name)) {
			return false;
		}
		UserType type = new UserType();
		type.setIntidentityid(null);
		type.setStrname(name);
		type.setIntallowreg(check);

		Integer newtypeId = 0;
		if (userTypeService.insertUserType(type)) {
			newtypeId = userTypeService.selectidByName(name);
		} else {
			return false;
		}
		if (newtypeId == 0) {
			return false;
		}

		// insert access controller
		List<Power> parentPower = powerService.selectParentPower(1, 1);
		for (Power parentpower : parentPower) {
			Integer originId = parentpower.getIntpowerid();
			parentpower.setIntpowerid(null);
			parentpower.setIntusertypeid(newtypeId);
			if (parentpower.getStrauthname().contains("manage")) {
				if(!powerService.insertPowerRetId(parentpower)){
					return false;
				}
				if (parentpower.getIntpowerid() == null) {
					return false;
				}
				List<Power> tmpchildren = powerService.selectParentPower(originId, 1);
				for (Power tmpchild : tmpchildren) {
					tmpchild.setIntpowerid(null);
					tmpchild.setIntusertypeid(newtypeId);
					tmpchild.setIntparentid(parentpower.getIntpowerid());
				}
				powerService.insertPowers(tmpchildren);
			} else {
				powerService.insertPower(parentpower);
			}
		}

		return true;
	}

	@RequestMapping(value = "/DeleteUserType", method = RequestMethod.POST)
	@ResponseBody
	public boolean deleteUserType(HttpServletRequest request, Model model, HttpServletResponse response) {
		if (!authUserTypePower(request, "rmusertype")) {
			response.setStatus(3388);
			return false;
		}
		int id = 0;
		try {
			id = Integer.valueOf(request.getParameter("id"));
		} catch (Exception e) {
			logger.debug(e.getMessage());
			response.setStatus(3386);
			return false;
		}
		if (!userService.authUserType(id)) {
			response.setStatus(3384);
			return false;
		}

		// delete access control
		powerService.deletePowerByUserType(id);
		
		return userTypeService.deleteUserType(id);
	}

	@RequestMapping(value = "/UpdateBookType", method = RequestMethod.POST)
	@ResponseBody
	public boolean updateBookType(HttpServletRequest request, Model model, HttpServletResponse response) {
		if (!authUserTypePower(request, "editbooktype")) {
			response.setStatus(3388);
			return false;
		}
		int id = 0;
		String name = "";
		try {
			id = Integer.valueOf(request.getParameter("id"));
			name = request.getParameter("name").trim();
		} catch (Exception e) {
			logger.debug(e.getMessage());
			response.setStatus(3386);
			return false;
		}
		if (name.equals("")) {
			return false;
		}
		BookType type = new BookType();
		type.setIntbooktypeid(id);
		type.setStrbooktypename(name);
		return bookTypeService.updateBookType(type);
	}

	@RequestMapping(value = "/InsertBookType", method = RequestMethod.POST)
	@ResponseBody
	public boolean insertBookType(HttpServletRequest request, Model model, HttpServletResponse response) {
		if (!authUserTypePower(request, "addbooktype")) {
			response.setStatus(3388);
			return false;
		}
		String name = "";
		try {
			name = request.getParameter("name").trim();
		} catch (Exception e) {
			logger.debug(e.getMessage());
			response.setStatus(3386);
			return false;
		}
		if (name.equals("")) {
			return false;
		}
		BookType type = new BookType();
		type.setIntbooktypeid(null);
		type.setStrbooktypename(name);
		return bookTypeService.insertBookType(type);
	}

	@RequestMapping(value = "/DeleteBookType", method = RequestMethod.POST)
	@ResponseBody
	public boolean deleteBookType(HttpServletRequest request, Model model, HttpServletResponse response) {
		if (!authUserTypePower(request, "rmbooktype")) {
			response.setStatus(3388);
			return false;
		}
		int id = 0;
		try {
			id = Integer.valueOf(request.getParameter("id"));
		} catch (Exception e) {
			logger.debug(e.getMessage());
			response.setStatus(3386);
			return false;
		}
		if (!bookService.authBookType(id)) {
			response.setStatus(3384);
			return false;
		}
		return bookTypeService.deleteBookType(id);
	}

}
