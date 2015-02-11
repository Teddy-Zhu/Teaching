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
import com.jcos.teaching.core.model.BookType;
import com.jcos.teaching.core.model.Supplier;
import com.jcos.teaching.core.model.UserDepartMent;
import com.jcos.teaching.core.model.UserType;
import com.jcos.teaching.core.service.BookTypeService;
import com.jcos.teaching.core.service.PowerService;
import com.jcos.teaching.core.service.SupplierService;
import com.jcos.teaching.core.service.UserDepartMentService;
import com.jcos.teaching.core.service.UserTypeService;

@Controller
@RequestMapping(value = "/Type")
public class TypeController {

	@Inject
	private UserTypeService userTypeService;
	@Inject
	private BookTypeService bookTypeService;
	@Inject
	private SupplierService supplierService;
	@Inject
	private UserDepartMentService userDepartMentService;

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

	/**
	 * 
	 * @param id
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/GetDepartMent", method = RequestMethod.POST)
	@ResponseBody
	public List<UserDepartMent> getDepartMent(int id, HttpServletRequest request, Model model) {
		return userDepartMentService.getAllDepartMent(id);
	}

	@RequestMapping(value = "/GetParentDepartMent", method = RequestMethod.POST)
	@ResponseBody
	public Integer getParentDepartMent(int id, HttpServletRequest request, Model model) {
		return userDepartMentService.getParentDepartMent(id);
	}

	/**
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/GetUserType", method = RequestMethod.POST)
	@ResponseBody
	public List<UserType> getUserTypeForReg(HttpServletRequest request, Model model) {
		List<UserType> allowUserType = userTypeService.getUserTypeForReg();
		return allowUserType;
	}

	/**
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/GetBookType", method = RequestMethod.POST)
	@ResponseBody
	public List<BookType> getBookType(HttpServletRequest request, Model model) {
		return bookTypeService.getAllBookType();
	}

	/**
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/GetSupplierType", method = RequestMethod.POST)
	@ResponseBody
	public List<Supplier> getSupplierType(HttpServletRequest request, Model model) {
		return supplierService.getAllSupplier();
	}

	@RequestMapping(value = "/GetUserTypeAll", method = RequestMethod.POST)
	@ResponseBody
	public List<UserType> getUserType(HttpServletRequest request, Model model, HttpServletResponse response) {
		if (!authUserTypePower(request, "getallusertype")) {
			response.setStatus(3388);
			return null;
		}
		List<UserType> allowUserType = userTypeService.getUserType();
		return allowUserType;
	}
}
