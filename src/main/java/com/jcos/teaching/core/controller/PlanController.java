package com.jcos.teaching.core.controller;

import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jcos.teaching.core.exmodel.LoginSession;
import com.jcos.teaching.core.model.Book;
import com.jcos.teaching.core.model.BookPlan;
import com.jcos.teaching.core.model.BookPlanChange;
import com.jcos.teaching.core.model.BookPlanLog;
import com.jcos.teaching.core.model.BookPlanStatus;
import com.jcos.teaching.core.model.CourseType;
import com.jcos.teaching.core.service.BookPlanChangeService;
import com.jcos.teaching.core.service.BookPlanLogService;
import com.jcos.teaching.core.service.BookPlanService;
import com.jcos.teaching.core.service.BookPlanStatusService;
import com.jcos.teaching.core.service.BookService;
import com.jcos.teaching.core.service.CourseTypeService;
import com.jcos.teaching.core.util.DownloadTool;
import com.jcos.teaching.core.util.ExcelTool;
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
	private BookPlanStatusService bookPlanStatusService;
	@Inject
	private BookService bookService;
	@Inject
	private PowerTool pwTool;
	@Inject
	private BookPlanChangeService bookPlanChangeService;
	@Inject
	private BookPlanLogService bookPlanLogService;
	@Inject
	private DownloadTool dlTool;

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
		if (stucount < 0 || teacount < 0) {
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

		if (!bookPlanService.insertPlan(record)) {
			return false;
		}

		// for insert log
		BookPlanLog log = new BookPlanLog();
		log.setDatecreatetime(new Date());
		log.setIntoperateid(3);
		log.setIntuserid(loginSession.getLoginUser().getIntid());
		log.setIntplanid(record.getIntplanid());
		if (!bookPlanLogService.addNewLog(log)) {
			response.setStatus(3383);
			return false;
		}

		return true;
	}

	/**
	 * 
	 * @author zhuxi
	 * @method for get course type
	 * @param request
	 * @param model
	 * @param response
	 * @return courst type list
	 */
	@RequestMapping(value = "/GetCourseType", method = RequestMethod.POST)
	@ResponseBody
	public List<CourseType> getCourseType(HttpServletRequest request, Model model, HttpServletResponse response) {

		return courseTypeService.getAllCourseType();
	}

	@RequestMapping(value = "/GetBookPlanStatus", method = RequestMethod.POST)
	@ResponseBody
	public List<BookPlanStatus> getBookPlanStatus(HttpServletRequest request, Model model, HttpServletResponse response) {

		return bookPlanStatusService.getAllBookPlanStatus();
	}

	@RequestMapping(value = "/GetPerPlanHistory", method = RequestMethod.POST)
	@ResponseBody
	public List<BookPlanLog> getPerPlanHistory(HttpServletRequest request, Model model, HttpServletResponse response) {
		if (!pwTool.authUserTypePower(request, "queryplan")) {
			response.setStatus(3388);
			return null;
		}

		LoginSession loginSession = (LoginSession) request.getSession().getAttribute("loginSession");

		Integer userId = loginSession.getLoginUser().getIntid();

		return bookPlanLogService.getBookPlanLogByUserId(userId);
	}

	@RequestMapping(value = "/ImportPerPlan", method = RequestMethod.GET)
	@ResponseBody
	public boolean importPersonalPlan(HttpServletRequest request, Model model, HttpServletResponse response) {
		// if (!pwTool.authUserTypePower(request, "queryplan")) {
		// response.setStatus(3388);
		// return null;
		// }
		// int rows = 10, page = 1;
		// String CourseName = "", ClassId = "", BookName = "";
		// Integer CourseType = -1, PlanStatus = -1, FromYear = -1, ToYear = -1,
		// Term = -1, StuCount = -1, TeaCount = -1;
		// Date date = null;
		// try {
		// rows = Integer.valueOf(request.getParameter("rows"));
		// page = Integer.valueOf(request.getParameter("page"));
		// CourseName = request.getParameter("CourseName").trim().equals("") ?
		// null : request.getParameter("CourseName");
		// ClassId = request.getParameter("ClassId").trim().equals("") ? null :
		// request.getParameter("ClassId");
		// BookName = request.getParameter("BookName").trim().equals("") ? null
		// : request.getParameter("BookName");
		// StuCount = request.getParameter("StuCount").trim().equals("") ? null
		// : Integer.valueOf(request.getParameter("StuCount"));
		// TeaCount = request.getParameter("TeaCount").trim().equals("") ? null
		// : Integer.valueOf(request.getParameter("TeaCount"));
		// CourseType = Integer.valueOf(request.getParameter("CourseType")) ==
		// -1 ? null : Integer.valueOf(request.getParameter("CourseType"));
		// PlanStatus = Integer.valueOf(request.getParameter("PlanStatus")) ==
		// -1 ? null : Integer.valueOf(request.getParameter("PlanStatus"));
		// FromYear = request.getParameter("FromYear").trim().equals("") ? null
		// : Integer.valueOf(request.getParameter("FromYear"));
		// ToYear = request.getParameter("ToYear").trim().equals("") ? null :
		// Integer.valueOf(request.getParameter("ToYear"));
		// Term = Integer.valueOf(request.getParameter("Term")) == -1 ? null :
		// Integer.valueOf(request.getParameter("Term"));
		// date = request.getParameter("SearchDate").equals("") ? null : new
		// SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("SearchDate"));
		// } catch (Exception e) {
		// logger.debug(e.getMessage());
		// response.setStatus(3386);
		// return null;
		// }
		// if (FromYear != null && ToYear != null && FromYear > ToYear) {
		// response.setStatus(3387);
		// return null;
		// }
		// LoginSession loginSession = (LoginSession)
		// request.getSession().getAttribute("loginSession");
		// BookPlan record = new BookPlan(null, CourseName, CourseType, ClassId,
		// StuCount, TeaCount, null, loginSession.getLoginUser().getIntid(),
		// PlanStatus, FromYear, ToYear, Term, date, null, null, null, new
		// Book(BookName));
		// Map<String, Object> ret = new HashMap<String, Object>();
		// ret.put("total", bookPlanService.getPersonalBookPlanTotal(record));
		// ret.put("rows", bookPlanService.getPersonalBookPlan(record, page,
		// rows));

		ExcelTool excel = null;
		try {
			excel = new ExcelTool(request);
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		ByteArrayOutputStream output = excel.getXlsStream();

		return dlTool.pushOutputStream(response, output, System.currentTimeMillis() + ".xls");

	}

	@RequestMapping(value = "/GetPerPlan", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getPersonalPlan(HttpServletRequest request, Model model, HttpServletResponse response) {
		if (!pwTool.authUserTypePower(request, "queryplan")) {
			response.setStatus(3388);
			return null;
		}
		int rows = 10, page = 1;
		String CourseName = "", ClassId = "", BookName = "";
		Integer CourseType = -1, PlanStatus = -1, FromYear = -1, ToYear = -1, Term = -1, StuCount = -1, TeaCount = -1;
		Date date = null;
		try {
			rows = Integer.valueOf(request.getParameter("rows"));
			page = Integer.valueOf(request.getParameter("page"));
			CourseName = request.getParameter("CourseName").trim().equals("") ? null : request.getParameter("CourseName");
			ClassId = request.getParameter("ClassId").trim().equals("") ? null : request.getParameter("ClassId");
			BookName = request.getParameter("BookName").trim().equals("") ? null : request.getParameter("BookName");
			StuCount = request.getParameter("StuCount").trim().equals("") ? null : Integer.valueOf(request.getParameter("StuCount"));
			TeaCount = request.getParameter("TeaCount").trim().equals("") ? null : Integer.valueOf(request.getParameter("TeaCount"));
			CourseType = Integer.valueOf(request.getParameter("CourseType")) == -1 ? null : Integer.valueOf(request.getParameter("CourseType"));
			PlanStatus = Integer.valueOf(request.getParameter("PlanStatus")) == -1 ? null : Integer.valueOf(request.getParameter("PlanStatus"));
			FromYear = request.getParameter("FromYear").trim().equals("") ? null : Integer.valueOf(request.getParameter("FromYear"));
			ToYear = request.getParameter("ToYear").trim().equals("") ? null : Integer.valueOf(request.getParameter("ToYear"));
			Term = Integer.valueOf(request.getParameter("Term")) == -1 ? null : Integer.valueOf(request.getParameter("Term"));
			date = request.getParameter("SearchDate").equals("") ? null : new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("SearchDate"));
		} catch (Exception e) {
			logger.debug(e.getMessage());
			response.setStatus(3386);
			return null;
		}
		if (FromYear != null && ToYear != null && FromYear > ToYear) {
			response.setStatus(3387);
			return null;
		}
		LoginSession loginSession = (LoginSession) request.getSession().getAttribute("loginSession");
		BookPlan record = new BookPlan(null, CourseName, CourseType, ClassId, StuCount, TeaCount, null, loginSession.getLoginUser().getIntid(), PlanStatus, FromYear, ToYear, Term, date, null, null, null, new Book(BookName));
		Map<String, Object> ret = new HashMap<String, Object>();
		ret.put("total", bookPlanService.getPersonalBookPlanTotal(record));
		ret.put("rows", bookPlanService.getPersonalBookPlan(record, page, rows));

		return ret;
	}

	@RequestMapping(value = "/ChangePlan", method = RequestMethod.POST)
	@ResponseBody
	public boolean changePlan(HttpServletRequest request, Model model, HttpServletResponse response) {
		if (!pwTool.authUserTypePower(request, "queryplan")) {
			response.setStatus(3388);
			return false;
		}
		Integer StudentCount = 0, TeacherCount = 0, planId = -1;
		String reason = "";
		try {
			planId = Integer.valueOf(request.getParameter("PlanId"));
			StudentCount = Integer.valueOf(request.getParameter("StuChange"));
			TeacherCount = Integer.valueOf(request.getParameter("TeaChange"));
			reason = request.getParameter("ChangeReason");
		} catch (Exception e) {
			logger.debug(e.getMessage());
			response.setStatus(3386);
			return false;
		}

		if (planId == -1 || (StudentCount == 0 && TeacherCount == 0)) {
			response.setStatus(3386);
			return false;
		}

		// auth planId exist for the user
		LoginSession loginSession = (LoginSession) request.getSession().getAttribute("loginSession");
		if (!bookPlanService.authPlanByUserIdAndPlanId(planId, loginSession.getLoginUser().getIntid())) {
			response.setStatus(3386);
			return false;
		}

		// auth plan status
		// pending
		if (!bookPlanService.authPlanStatusForChange(planId)) {
			response.setStatus(3386);
			return false;
		}

		// for insert log first
		// for insert log
		BookPlanLog log = new BookPlanLog();
		log.setDatecreatetime(new Date());
		log.setIntoperateid(6);
		log.setIntuserid(loginSession.getLoginUser().getIntid());
		log.setIntplanid(planId);
		if (!bookPlanLogService.addNewLog(log)) {
			response.setStatus(3383);
			return false;
		}

		// add record
		BookPlanChange record = new BookPlanChange(null, planId, log.getIntplanlogid(), StudentCount, TeacherCount, reason, new Date());
		if (!bookPlanChangeService.insertBookPlanChange(record)) {
			// remove log if failed ;
			bookPlanLogService.removeLogById(log.getIntplanlogid());
			return false;
		}

		return true;
	}

}
