package com.jcos.teaching.core.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jcos.teaching.core.exmodel.LoginSession;
import com.jcos.teaching.core.model.User;
import com.jcos.teaching.core.model.UserType;
import com.jcos.teaching.core.service.BookPlanService;
import com.jcos.teaching.core.service.PowerService;
import com.jcos.teaching.core.service.UserDepartMentService;
import com.jcos.teaching.core.service.UserService;
import com.jcos.teaching.core.service.UserTypeService;
import com.jcos.teaching.core.util.common.StringUtil;

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

	@Inject
	private UserDepartMentService userDepartMentService;

	@Inject
	private BookPlanService bookPlanService;

	private StringUtil tools = new StringUtil();

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
			userName = request.getParameter("UserName").trim();
			userTypeId = Integer.valueOf(request.getParameter("UserType").trim());
			passWord = request.getParameter("PassWord").trim();
			realName = request.getParameter("RealName").trim();
			IdCard = request.getParameter("IdCard").trim();
			phone = request.getParameter("Phone").trim();
			email = request.getParameter("Email").trim();
			DepartId = Integer.valueOf(request.getParameter("DepartId").trim());
			MajorId = Integer.valueOf(request.getParameter("MajorId").trim());
		} catch (Exception e) {
			response.setStatus(3386);
			logger.debug(e.getMessage());
			return false;
		}
		int reti = userService.selectUserByUserName(userName);
		if (reti != 0) {
			response.setStatus(3386);
			return false;
		}
		if (!userDepartMentService.authDepartAndMajor(DepartId, MajorId)) {
			response.setStatus(3386);
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
			response.setStatus(3386);
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
		record.setIntuserdepartment(DepartId);
		record.setIntusermajor(MajorId);
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
	public boolean authLogin(HttpServletRequest request, Model model, HttpServletResponse response) {
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
			if (!authUserTypePower(request, "Login")) {
				response.setStatus(3388);
				request.getSession().setAttribute("loginSession", null);
				return false;
			}
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
			response.setStatus(3386);
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
			userName = request.getParameter("newUserName").trim();
			userTypeId = Integer.valueOf(request.getParameter("newType").trim());
			passWord = request.getParameter("newPassword").trim();
			realName = request.getParameter("newRealName").trim();
			phone = request.getParameter("newPhone").trim();
			IdCard = request.getParameter("newNumber").trim();
			email = request.getParameter("newEmail").trim();
			DepartId = Integer.valueOf(request.getParameter("newDepartMent").trim());
			MajorId = Integer.valueOf(request.getParameter("newMajor").trim());
		} catch (Exception e) {
			response.setStatus(3386);
			logger.debug(e.getMessage());
			return false;
		}

		int i = userService.selectUserByUserName(userName);
		if (i != 0) {
			response.setStatus(3386);
			return false;
		}

		if (!userDepartMentService.authDepartAndMajor(DepartId, MajorId)) {
			response.setStatus(3386);
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
			response.setStatus(3386);
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
		record.setIntuserdepartment(DepartId);
		record.setIntusermajor(MajorId);
		i = userService.registerUser(record);
		if (i == 1) {
			return true;
		} else {
			return false;
		}
	}

	@RequestMapping(value = "/UpdateUserInfoAdmin", method = RequestMethod.POST)
	@ResponseBody
	public boolean UpdateUserForAdmin(@RequestParam(value = "userId[]") Integer[] userId, HttpServletRequest request, Model model, HttpServletResponse response) {
		if (!authUserTypePower(request, "edituser")) {
			response.setStatus(3389);
			return false;
		}
		String userName = "", passWord = "", phone = "", realName = "", email = "", IdCard = "";
		int DepartId = 0, MajorId = 0, userTypeId = 0;
		List<User> users = new ArrayList<User>();
		try {
			for (int i : userId) {
				userName = request.getParameter("editUserName" + i).trim();
				userTypeId = Integer.valueOf(request.getParameter("editType" + i).trim());
				passWord = request.getParameter("editPassword" + i).trim();
				realName = request.getParameter("editRealName" + i).trim();
				phone = request.getParameter("editPhone" + i).trim();
				IdCard = request.getParameter("editNumber" + i).trim();
				email = request.getParameter("editEmail" + i).trim();
				DepartId = Integer.valueOf(request.getParameter("editDepartMent" + i).trim());
				MajorId = Integer.valueOf(request.getParameter("editMajor" + i).trim());

				int reti = userService.selectUserByUserNameAndId(userName, i);
				if (reti != 0) {
					response.setStatus(3386);
					return false;
				}
				if (passWord.equals("[%keep%]") || passWord.equals("")) {
					passWord = null;
				}
				if (!userDepartMentService.authDepartAndMajor(DepartId, MajorId)) {
					response.setStatus(3386);
					return false;
				}

				User record = new User();
				record.setIntid(i);
				record.setUsername(userName);
				record.setInttypeid(userTypeId);
				record.setPassword(passWord);
				record.setStrmail(email);
				record.setStrstunum(IdCard);
				record.setStrname(realName);
				record.setStrphone(phone);
				record.setIntuserdepartment(DepartId);
				record.setIntusermajor(MajorId);
				users.add(record);
			}
		} catch (Exception e) {
			response.setStatus(3386);
			logger.debug(e.getMessage());
			return false;
		}

		return userService.updateUserByIds(users);
	}

	@RequestMapping(value = "/RemoveUser", method = RequestMethod.POST)
	@ResponseBody
	public Object removeuser(@RequestParam(value = "userId[]") Integer[] userId, HttpServletRequest request, Model model, HttpServletResponse response) {
		if (!authUserTypePower(request, "rmuser")) {
			response.setStatus(3388);
			return false;
		}
		if (userId != null && userId.length != 0) {
			Integer ret = bookPlanService.authExistBookInUse(userId);
			if (ret != 0) {
				return ret;
			}
			return userService.deleteuserbyId(userId);
		} else
			return false;
	}

	@RequestMapping(value = "/UpdateUser", method = RequestMethod.POST)
	@ResponseBody
	public boolean updateUser(HttpServletRequest request, Model model, HttpServletResponse response) {
		LoginSession loginSession = (LoginSession) request.getSession().getAttribute("loginSession");
		Integer userId = loginSession.getLoginUser().getIntid();
		String userName = "", oldPassword = "", passWord = "", phone = "", realName = "", email = "", IdCard = "";
		Integer DepartId = 0, MajorId = 0, userTypeId = 0;

		try {
			userName = request.getParameter("UserName").trim();
			userTypeId = null;
			oldPassword = request.getParameter("OldPassword").trim();
			passWord = request.getParameter("Password").trim();
			if (passWord.equals("")) {
				passWord = null;
			}
			realName = request.getParameter("RealName").trim();
			phone = request.getParameter("Phone").trim();
			IdCard = request.getParameter("Number").trim();
			email = request.getParameter("Email").trim();
			DepartId = Integer.valueOf(request.getParameter("DepartMent").trim());
			MajorId = Integer.valueOf(request.getParameter("Major").trim());
		} catch (Exception e) {
			response.setStatus(3386);
			return false;
		}
		User recordauth = new User();
		recordauth.setUsername(userName);
		recordauth.setPassword(oldPassword);

		User loginUser = userService.authLoginUser(recordauth);
		if (loginUser == null) {
			response.setStatus(3385);
			return false;
		}

		if (!userDepartMentService.authDepartAndMajor(DepartId, MajorId)) {
			response.setStatus(3386);
			return false;
		}

		User record = new User();
		record.setIntid(userId);
		record.setUsername(userName);
		record.setInttypeid(userTypeId);
		record.setPassword(passWord);
		record.setStrmail(email);
		record.setStrstunum(IdCard);
		record.setStrname(realName);
		record.setStrphone(phone);
		record.setIntuserdepartment(DepartId);
		record.setIntusermajor(MajorId);

		if (userService.updateUser(record)) {
			LoginSession loginSessiontmp = new LoginSession();
			recordauth = new User();
			recordauth.setUsername(userName);
			if (passWord == null) {
				recordauth.setPassword(oldPassword);
			} else {
				recordauth.setPassword(passWord);
			}
			User loginUsertmp = userService.authLoginUser(recordauth);
			loginSessiontmp.setLoginUser(loginUsertmp);
			// set global session
			request.getSession().setAttribute("loginSession", loginSessiontmp);
			return true;
		} else {
			return false;
		}

	}

}
