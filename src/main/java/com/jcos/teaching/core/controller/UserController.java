package com.jcos.teaching.core.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jcos.teaching.core.Exmodel.LoginSession;
import com.jcos.teaching.core.Util.Common.StringUtil;
import com.jcos.teaching.core.model.User;
import com.jcos.teaching.core.model.UserType;
import com.jcos.teaching.core.service.PowerService;
import com.jcos.teaching.core.service.UserService;
import com.jcos.teaching.core.service.UserTypeService;

@Controller
@RequestMapping(value = "/User")
public class UserController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(UserController.class);

	@Inject
	private UserService userService;

	@Inject
	private PowerService powerService;

	@Inject
	private UserTypeService userTypeService;

	private StringUtil tools = new StringUtil();

	/**
	 * 
	 * @param request
	 * @return
	 */
	public boolean authUserTypePower(HttpServletRequest request, String name) {
		LoginSession loginSession = (LoginSession) request.getSession().getAttribute("loginSession");
		return powerService.queryPowerByName(name, loginSession.getLoginUser().getInttypeid());
	}

	/**
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/AuthRegister", method = RequestMethod.POST)
	@ResponseBody
	public boolean register(HttpServletRequest request, Model model, HttpServletResponse response) {
		String userName = "", passWord = "", phone = "", realName = "", email = "", IdCard = "";
		int DepartId = 0, MajorId = 0, userTypeId = 0;
		try {
			userName = request.getParameter("UserName");
			userTypeId = Integer.valueOf(request.getParameter("UserType"));
			passWord = request.getParameter("PassWord");
			realName = request.getParameter("RealName");
			IdCard = request.getParameter("IdCard");
			phone = request.getParameter("Phone");
			email = request.getParameter("Email");
			DepartId = Integer.valueOf(request.getParameter("DepartId"));
			MajorId = Integer.valueOf(request.getParameter("MajorId"));
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return false;
		}
		List<UserType> allowUserType = userTypeService.getUserTypeForReg();
		boolean checktype = false;
		for (UserType type : allowUserType) {
			if (type.getIntidentityid() == userTypeId) {
				checktype = true;
				break;
			}
		}

		if (!checktype) {
			response.setStatus(3389);
			return false;
		}

		User record = new User();
		record.setUsername(userName);
		record.setPassword(passWord);
		record.setInttypeid(userTypeId);
		record.setStrmail(email);
		record.setStrstunum(IdCard);
		record.setStrname(realName);
		record.setStrphone(phone);
		record.setIntuserdepartment(MajorId);
		int i = userService.registerUser(record);
		if (i == 1) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/AuthUserName", method = RequestMethod.POST)
	@ResponseBody
	public boolean authUserName(HttpServletRequest request, Model model) {
		String userName = "";
		if (!tools.isNull(request, "UserName")) {
			userName = request.getParameter("UserName");
		} else {
			return false;
		}
		int i = userService.selectUserByUserName(userName);
		if (i != 0) {
			return false;
		}
		return true;
	}

	/**
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/AuthLogout", method = RequestMethod.POST)
	@ResponseBody
	public boolean authLogout(HttpServletRequest request, Model model) {
		request.getSession().setAttribute("loginSession", null);
		return true;
	}

	/**
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/AuthLogin", method = RequestMethod.POST)
	@ResponseBody
	public boolean authLogin(HttpServletRequest request, Model model) {
		String userName = "", passWord = "";

		if (!tools.isNull(request, "UserName") && !tools.isNull(request, "PassWord")) {
			userName = request.getParameter("UserName");
			passWord = request.getParameter("PassWord");
		} else {
			return false;
		}
		User record = new User();
		record.setUsername(userName);
		record.setPassword(passWord);

		User loginUser = userService.authLoginUser(record);
		if (loginUser != null) {
			LoginSession loginSession = new LoginSession();
			loginSession.setLoginUser(loginUser);
			// set global session
			request.getSession().setAttribute("loginSession", loginSession);
		} else {
			request.getSession().setAttribute("loginSession", null);
			return false;
		}
		return true;
	}

	@RequestMapping(value = "/GetAllUser", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getAllUser(HttpServletRequest request, Model model, HttpServletResponse response) {
		if (!authUserTypePower(request, "getalluser")) {
			response.setStatus(3388);
			return null;
		}
		Integer rows = 10, page = 1;
		try {
			rows = Integer.valueOf(request.getParameter("rows"));
			page = Integer.valueOf(request.getParameter("page"));
		} catch (Exception e) {
			response.setStatus(3387);
			return null;
		}

		Map<String, Object> ret = new HashMap<String, Object>();
		ret.put("total", userService.getuUserTotal());
		List<User> users = userService.getAllUser(page, rows);
		ret.put("rows", users);
		return ret;
	}

	/**
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/AuthRegisterAdmin", method = RequestMethod.POST)
	@ResponseBody
	public boolean registerForAdmin(HttpServletRequest request, Model model, HttpServletResponse response) {
		if (!authUserTypePower(request, "adduser")) {
			response.setStatus(3389);
			return false;
		}
		String userName = "", passWord = "", phone = "", realName = "", email = "", IdCard = "";
		int DepartId = 0, MajorId = 0, userTypeId = 0;
		try {
			userName = request.getParameter("newUserName");
			userTypeId = Integer.valueOf(request.getParameter("newType"));
			passWord = request.getParameter("newPassword");
			realName = request.getParameter("newRealName");
			phone = request.getParameter("newPhome");
			IdCard = request.getParameter("newNumber");
			email = request.getParameter("newEmail");
			DepartId = Integer.valueOf(request.getParameter("newDepartMent"));
			MajorId = Integer.valueOf(request.getParameter("newMajor"));
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return false;
		}

		User record = new User();
		record.setUsername(userName);
		record.setInttypeid(userTypeId);
		record.setPassword(passWord);
		record.setStrmail(email);
		record.setStrstunum(IdCard);
		record.setStrname(realName);
		record.setStrphone(phone);
		record.setIntuserdepartment(MajorId);
		int i = userService.registerUser(record);
		if (i == 1) {
			return true;
		} else {
			return false;
		}
	}
}
