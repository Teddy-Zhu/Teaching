package com.jcos.teaching.core.controller;

import java.util.ArrayList;
import java.util.Date;
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
import com.jcos.teaching.core.model.BookPlan;
import com.jcos.teaching.core.model.CourseType;
import com.jcos.teaching.core.service.BookPlanService;
import com.jcos.teaching.core.service.BookService;
import com.jcos.teaching.core.service.CourseTypeService;
import com.jcos.teaching.core.util.PowerTool;

@Controller
@RequestMapping(value = "/Plan")
public class PlanController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(PlanController.class);

	@Inject
	private BookPlanService bookPlanService;

	@Inject
	private CourseTypeService courseTypeService;

	@Inject
	private BookService bookService;

	@Inject
	private PowerTool pwTool;

	@RequestMapping(value = "/Submit", method = RequestMethod.POST)
	@ResponseBody
	public boolean getbooks(HttpServletRequest request, Model model, HttpServletResponse response) {
		if (!pwTool.authUserTypePower(request, "submitplan")) {
			response.setStatus(3388);
			return false;
		}
		String name = "", classid = "", mark = "";
		int stucount = -1, teacount = -1, bookid = -1, from = -1, to = -1, term = -1, type = -1;

		try {
			name = request.getParameter("CourseName");
			type = Integer.valueOf(request.getParameter("CourseType"));
			classid = request.getParameter("ClassId");
			stucount = Integer.valueOf(request.getParameter("StudentCount"));
			teacount = Integer.valueOf(request.getParameter("TeacherCount"));
			from = Integer.valueOf(request.getParameter("FromYear"));
			to = Integer.valueOf(request.getParameter("ToYear"));
			term = Integer.valueOf(request.getParameter("Term"));
			bookid = Integer.valueOf(request.getParameter("BookId"));
			mark = request.getParameter("Mark");

		} catch (Exception e) {
			logger.debug(e.getMessage());
			response.setStatus(3386);
			return false;
		}
		// auth parameters
		if (name.equals("") || classid.equals("") || mark.equals("") || stucount == -1 || teacount == -1 || bookid == -1 || from == -1 || to == -1 || term == -1 || type == -1) {
			response.setStatus(3387);
			return false;
		}
		if (from > to) {
			response.setStatus(3387);
			return false;
		}
		// auth book id coursetype exist
		if (!bookService.authBook(bookid)) {
			response.setStatus(3385);
			return false;
		}
		if (!courseTypeService.authCourseType(type)) {
			response.setStatus(3385);
			return false;
		}
		LoginSession loginSession = (LoginSession) request.getSession().getAttribute("loginSession");

		BookPlan record = new BookPlan(null, name, type, classid, stucount, teacount, bookid, loginSession.getLoginUser().getIntid(), 1, from, to, term, new Date(), mark);

		return bookPlanService.insertPlan(record);
	}

	@RequestMapping(value = "/GetCourseType", method = RequestMethod.POST)
	@ResponseBody
	public List<CourseType> getCourseType(HttpServletRequest request, Model model, HttpServletResponse response) {

		return courseTypeService.getAllCourseType();
	}

	@RequestMapping(value = "/GetPerPlan", method = RequestMethod.POST)
	@ResponseBody
	public List<BookPlan> getPersonalPlan(HttpServletRequest request, Model model, HttpServletResponse response) {
		if (!pwTool.authUserTypePower(request, "queryplan")) {
			response.setStatus(3388);
			return new ArrayList<BookPlan>();
		}
		String CourseName = "", ClassId = "", BookName = "";
		Integer CourseType = -1, PlanStatus = -1, FromYear = -1, ToYear = -1, Term = -1;
		Date date = null;
		try {
			CourseName = request.getParameter("CourseName").trim().equals("") ? null : request.getParameter("CourseName");
			ClassId= request.getParameter("ClassId").trim().equals("") ? null : request.getParameter("ClassId");
			
		} catch (Exception e) {
			logger.debug(e.getMessage());
			response.setStatus(3386);
			return new ArrayList<BookPlan>();
		}

		return null;
	}
}
