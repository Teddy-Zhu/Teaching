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

import com.jcos.teaching.core.model.BookType;
import com.jcos.teaching.core.model.Supplier;
import com.jcos.teaching.core.model.UserDepartMent;
import com.jcos.teaching.core.model.UserType;
import com.jcos.teaching.core.service.BookTypeService;
import com.jcos.teaching.core.service.SupplierService;
import com.jcos.teaching.core.service.UserDepartMentService;
import com.jcos.teaching.core.service.UserTypeService;
import com.jcos.teaching.core.util.annotation.AuthPower;

@Controller
@RequestMapping(value = "/Type")
public class TypeController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TypeController.class);

	@Inject
	private UserTypeService userTypeService;
	@Inject
	private BookTypeService bookTypeService;
	@Inject
	private SupplierService supplierService;
	@Inject
	private UserDepartMentService userDepartMentService;

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
		logger.debug("GetDepartMent");
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
		return userTypeService.getUserTypeForReg();
	}

	/**
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/GetBookType", method = RequestMethod.POST)
	@ResponseBody
	public List<BookType> getBookType(HttpServletRequest request, Model model, HttpServletResponse response) {
		return bookTypeService.getAllBookType();
	}

	/**
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/GetBookTypeForType", method = RequestMethod.POST)
	@ResponseBody
	@AuthPower(value = "querybooktype")
	public List<BookType> getBookTypeFortype(HttpServletRequest request, Model model, HttpServletResponse response) {
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
		List<UserType> allowUserType = userTypeService.getUserType();
		return allowUserType;
	}

	@RequestMapping(value = "/GetUserTypeAllForType", method = RequestMethod.POST)
	@ResponseBody
	@AuthPower(value = "queryusertype")
	public List<UserType> getUserTypeFortype(HttpServletRequest request, Model model, HttpServletResponse response) {
		return userTypeService.getUserType();
	}
}
