package com.jcos.teaching.core.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
import com.jcos.teaching.core.util.annotation.AuthPower;

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
	private BookPlanChangeService bookPlanChangeService;
	@Inject
	private BookPlanLogService bookPlanLogService;
	@Inject
	private DownloadTool dlTool;

	@RequestMapping(value = "/Submit", method = RequestMethod.POST)
	@ResponseBody
	@AuthPower(value = "submitplan")
	public boolean getbooks(HttpServletRequest request, Model model, HttpServletResponse response) {
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

	@RequestMapping(value = "/ChangeStatus", method = RequestMethod.POST)
	@ResponseBody
	@AuthPower(value = "auditplan")
	public boolean changePlanStatus(@RequestParam(value = "planId[]") Integer[] planId, HttpServletRequest request, Model model, HttpServletResponse response) {
		if (planId.length <= 0) {
			response.setStatus(3386);
			return false;
		}
		Integer status = -1;
		try {
			status = Integer.valueOf(request.getParameter("Status").trim());
		} catch (Exception e) {
			response.setStatus(3386);
			return false;
		}
		if (status != -1) {
			if (!bookPlanStatusService.authBookPlanStatus(status)) {
				response.setStatus(3386);
				return false;
			}
		} else {
			response.setStatus(3386);
			return false;
		}

		if (!bookPlanService.updatePlanStatusByIds(planId, status)) {
			return false;
		}
		// log
		LoginSession loginSession = (LoginSession) request.getSession().getAttribute("loginSession");
		BookPlanLog log = new BookPlanLog();
		log.setDatecreatetime(new Date());
		log.setIntoperateid(status + 10);
		log.setIntuserid(loginSession.getLoginUser().getIntid());

		for (int i = 0, len = planId.length; i < len; i++) {
			log.setIntplanid(planId[i]);
			if (!bookPlanLogService.addNewLog(log)) {
				response.setStatus(3383);
				return false;
			}
		}

		return true;
	}

	@RequestMapping(value = "/GetPerPlanHistory", method = RequestMethod.POST)
	@ResponseBody
	@AuthPower(value = "queryplan")
	public List<BookPlanLog> getPerPlanHistory(HttpServletRequest request, Model model, HttpServletResponse response) {

		LoginSession loginSession = (LoginSession) request.getSession().getAttribute("loginSession");

		Integer userId = loginSession.getLoginUser().getIntid();

		Integer planId = -1;
		try {
			planId = Integer.valueOf(request.getParameter("PlanId"));
		} catch (Exception e) {
			logger.debug(e.getMessage());
			response.setStatus(3386);
			return new ArrayList<BookPlanLog>();
		}
		if (planId == -1) {
			response.setStatus(3386);
			return new ArrayList<BookPlanLog>();
		}

		return bookPlanLogService.getBookPlanLogByUserId(userId, planId);
	}

	@RequestMapping(value = "/GetPlanHistory", method = RequestMethod.POST)
	@ResponseBody
	@AuthPower(value = "auditplan")
	public List<BookPlanLog> getPlanHistory(HttpServletRequest request, Model model, HttpServletResponse response) {

		LoginSession loginSession = (LoginSession) request.getSession().getAttribute("loginSession");

		Integer userId = loginSession.getLoginUser().getIntid();

		Integer planId = -1;
		try {
			planId = Integer.valueOf(request.getParameter("PlanId"));
		} catch (Exception e) {
			logger.debug(e.getMessage());
			response.setStatus(3386);
			return new ArrayList<BookPlanLog>();
		}
		if (planId == -1) {
			response.setStatus(3386);
			return new ArrayList<BookPlanLog>();
		}

		return bookPlanLogService.getBookPlanLogByUserIdAdmin(planId);
	}

	@RequestMapping(value = "/ExportPerPlan", method = RequestMethod.POST)
	@ResponseBody
	@AuthPower(value = "queryplan")
	public boolean importPersonalPlan(HttpServletRequest request, Model model, HttpServletResponse response) {

		int rows = 200, page = 1;
		String CourseName = "", ClassId = "", BookName = "";
		Integer CourseType = -1, PlanStatus = -1, FromYear = -1, ToYear = -1, Term = -1, StuCount = -1, TeaCount = -1;
		Date date = null;
		try {
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
			return false;
		}
		if (FromYear != null && ToYear != null && FromYear > ToYear) {
			response.setStatus(3387);
			return false;
		}
		LoginSession loginSession = (LoginSession) request.getSession().getAttribute("loginSession");
		BookPlan record = new BookPlan(null, CourseName, CourseType, ClassId, StuCount, TeaCount, null, loginSession.getLoginUser().getIntid(), PlanStatus, FromYear, ToYear, Term, date, null, null,
				null, new Book(BookName));

		List<BookPlan> plans = bookPlanService.getPersonalBookPlan(record, page, rows);

		if (plans.size() == 0) {
			response.setStatus(3387);
			return false;
		}
		ExcelTool excel = null;
		try {
			excel = new ExcelTool(request.getSession().getServletContext().getRealPath("/") + "/WEB-INF/resources/excel/teacher.xls");
		} catch (IOException e1) {
			logger.debug(e1.getMessage());
		}
		excel.setworkSheet(0);

		// update title
		String title = excel.getCellString(0, 0);
		excel.setCellText(0, 0,
				title.replace("{From}", plans.get(0).getIntfromyear().toString()).replace("{To}", plans.get(0).getInttoyear().toString()).replace("{Term}", plans.get(0).getIntterm() == 0 ? "一" : "二"));
		excel.setCellAlign(0, 0, HSSFCellStyle.ALIGN_CENTER);
		// update excel content
		for (int i = 0; i < plans.size(); i++) {
			BookPlan curPlan = plans.get(i);
			excel.setCellBorderStyle(3 + i, 0, Integer.toString(i + 1), HSSFCellStyle.BORDER_THIN);
			excel.setCellBorderStyle(3 + i, 1, curPlan.getStrcoursename(), HSSFCellStyle.BORDER_THIN);
			excel.setCellBorderStyle(3 + i, 2, curPlan.getCourseType().getStrcoursename(), HSSFCellStyle.BORDER_THIN);
			excel.setCellBorderStyle(3 + i, 3, curPlan.getStrclass(), HSSFCellStyle.BORDER_THIN);
			excel.setCellBorderStyle(3 + i, 4, curPlan.getIntstudcount().toString(), HSSFCellStyle.BORDER_THIN);
			excel.setCellBorderStyle(3 + i, 5, curPlan.getIntstudcount().toString(), HSSFCellStyle.BORDER_THIN);
			excel.setCellBorderStyle(3 + i, 6, curPlan.getIntteaccount().toString(), HSSFCellStyle.BORDER_THIN);
			excel.setCellBorderStyle(3 + i, 7, Integer.toString(curPlan.getIntteaccount() + curPlan.getIntstudcount()), HSSFCellStyle.BORDER_THIN);
			excel.setCellBorderStyle(3 + i, 8, curPlan.getBook().getStrbookname(), HSSFCellStyle.BORDER_THIN);
			excel.setCellBorderStyle(3 + i, 9, curPlan.getBook().getStrauthor(), HSSFCellStyle.BORDER_THIN);
			excel.setCellBorderStyle(3 + i, 10, Double.toString(curPlan.getBook().getStrprice() * curPlan.getBook().getIntpricediscount() / 10), HSSFCellStyle.BORDER_THIN);
			excel.setCellBorderStyle(3 + i, 11, curPlan.getBook().getStrpress(), HSSFCellStyle.BORDER_THIN);
			excel.setCellBorderStyle(3 + i, 12, curPlan.getStrmark() == null || curPlan.getStrmark().equals("") || curPlan.getStrmark().equals("none") ? "" : curPlan.getStrmark(),
					HSSFCellStyle.BORDER_THIN);
		}

		ByteArrayOutputStream output = excel.getXlsStream();

		return dlTool.pushOutputStream(response, output, System.currentTimeMillis() + ".xls");
	}

	@RequestMapping(value = "/GetPerPlan", method = RequestMethod.POST)
	@ResponseBody
	@AuthPower(value = "queryplan")
	public Map<String, Object> getPersonalPlan(HttpServletRequest request, Model model, HttpServletResponse response) {
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
		BookPlan record = new BookPlan(null, CourseName, CourseType, ClassId, StuCount, TeaCount, null, loginSession.getLoginUser().getIntid(), PlanStatus, FromYear, ToYear, Term, date, null, null,
				null, new Book(BookName));
		Map<String, Object> ret = new HashMap<String, Object>();
		ret.put("total", bookPlanService.getPersonalBookPlanTotalOrAll(record));
		ret.put("rows", bookPlanService.getPersonalBookPlan(record, page, rows));

		return ret;
	}

	@RequestMapping(value = "/PassPlan", method = RequestMethod.POST)
	@ResponseBody
	@AuthPower(value = "auditplan")
	public boolean pass(@RequestParam(value = "planId[]") Integer[] planId, HttpServletRequest request, Model model, HttpServletResponse response) {
		if (planId.length <= 0) {
			response.setStatus(3386);
			return false;
		}
		if (!bookPlanService.authPlanStatusForPassAndRejectAndRefuse(planId)) {
			response.setStatus(3386);
			return false;
		}

		if (!bookPlanService.updatePlanStatusByIds(planId, 5)) {
			return false;
		}
		// log
		LoginSession loginSession = (LoginSession) request.getSession().getAttribute("loginSession");
		BookPlanLog log = new BookPlanLog();
		log.setDatecreatetime(new Date());
		log.setIntoperateid(8);
		log.setIntuserid(loginSession.getLoginUser().getIntid());

		for (int i = 0, len = planId.length; i < len; i++) {
			log.setIntplanid(planId[i]);
			if (!bookPlanLogService.addNewLog(log)) {
				response.setStatus(3383);
				return false;
			}
		}

		return true;
	}

	@RequestMapping(value = "/RejectPlan", method = RequestMethod.POST)
	@ResponseBody
	@AuthPower(value = "auditplan")
	public boolean reject(@RequestParam(value = "planId[]") Integer[] planId, HttpServletRequest request, Model model, HttpServletResponse response) {
		if (planId.length <= 0) {
			response.setStatus(3386);
			return false;
		}
		if (!bookPlanService.authPlanStatusForPassAndRejectAndRefuse(planId)) {
			response.setStatus(3386);
			return false;
		}

		if (!bookPlanService.updatePlanStatusByIds(planId, 2)) {
			return false;
		}
		// log
		LoginSession loginSession = (LoginSession) request.getSession().getAttribute("loginSession");
		BookPlanLog log = new BookPlanLog();
		log.setDatecreatetime(new Date());
		log.setIntoperateid(5);
		log.setIntuserid(loginSession.getLoginUser().getIntid());

		for (int i = 0, len = planId.length; i < len; i++) {
			log.setIntplanid(planId[i]);
			if (!bookPlanLogService.addNewLog(log)) {
				response.setStatus(3383);
				return false;
			}
		}

		return true;
	}

	@RequestMapping(value = "/RefusePlan", method = RequestMethod.POST)
	@ResponseBody
	@AuthPower(value = "auditplan")
	public boolean refuse(@RequestParam(value = "planId[]") Integer[] planId, HttpServletRequest request, Model model, HttpServletResponse response) {
		if (planId.length <= 0) {
			response.setStatus(3386);
			return false;
		}
		if (!bookPlanService.authPlanStatusForPassAndRejectAndRefuse(planId)) {
			response.setStatus(3386);
			return false;
		}

		if (!bookPlanService.updatePlanStatusByIds(planId, 3)) {
			return false;
		}
		// log
		LoginSession loginSession = (LoginSession) request.getSession().getAttribute("loginSession");
		BookPlanLog log = new BookPlanLog();
		log.setDatecreatetime(new Date());
		log.setIntoperateid(10);
		log.setIntuserid(loginSession.getLoginUser().getIntid());

		for (int i = 0, len = planId.length; i < len; i++) {
			log.setIntplanid(planId[i]);
			if (!bookPlanLogService.addNewLog(log)) {
				response.setStatus(3383);
				return false;
			}
		}
		return true;
	}

	@RequestMapping(value = "/GetAllPlan", method = RequestMethod.POST)
	@ResponseBody
	@AuthPower(value = "queryallplan")
	public Map<String, Object> getAllPlan(HttpServletRequest request, Model model, HttpServletResponse response) {
		int rows = 10, page = 1;
		String CourseName = "", ClassId = "", BookName = "";
		Integer CourseType = -1, PlanStatus = -1, FromYear = -1, ToYear = -1, Term = -1, StuCount = -1, TeaCount = -1, userId = -1;
		Date date = null;
		try {
			rows = Integer.valueOf(request.getParameter("rows"));
			page = Integer.valueOf(request.getParameter("page"));
			userId = request.getParameter("UserId").trim().equals("") ? null : Integer.valueOf(request.getParameter("UserId"));
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
		BookPlan record = new BookPlan(null, CourseName, CourseType, ClassId, StuCount, TeaCount, null, userId, PlanStatus, FromYear, ToYear, Term, date, null, null, null, new Book(BookName));
		Map<String, Object> ret = new HashMap<String, Object>();
		ret.put("total", bookPlanService.getPersonalBookPlanTotalOrAll(record));
		ret.put("rows", bookPlanService.getAllBookPlan(record, page, rows));

		return ret;
	}

	@RequestMapping(value = "/Cancel", method = RequestMethod.POST)
	@ResponseBody
	@AuthPower(value = "queryplan")
	public boolean cancelPlan(HttpServletRequest request, Model model, HttpServletResponse response) {
		Integer planId = -1;
		try {
			planId = Integer.valueOf(request.getParameter("PlanId"));
		} catch (Exception e) {
			logger.debug(e.getMessage());
			response.setStatus(3386);
			return false;
		}

		if (planId == -1) {
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
		BookPlanLog log = new BookPlanLog();
		log.setDatecreatetime(new Date());
		log.setIntoperateid(7);
		log.setIntuserid(loginSession.getLoginUser().getIntid());
		log.setIntplanid(planId);
		if (!bookPlanLogService.addNewLog(log)) {
			response.setStatus(3383);
			return false;
		}

		// set record
		BookPlan record = new BookPlan();
		record.setIntplanid(planId);
		record.setIntplanstatusid(4);

		return bookPlanService.updatePlan(record);
	}

	@RequestMapping(value = "/ReSubmit", method = RequestMethod.POST)
	@ResponseBody
	@AuthPower(value = "queryplan")
	public boolean resubmitPlan(HttpServletRequest request, Model model, HttpServletResponse response) {
		Integer planId = -1;
		try {
			planId = Integer.valueOf(request.getParameter("PlanId"));
		} catch (Exception e) {
			logger.debug(e.getMessage());
			response.setStatus(3386);
			return false;
		}

		if (planId == -1) {
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
		if (!bookPlanService.authPlanStatusForResubmit(planId)) {
			response.setStatus(3386);
			return false;
		}

		// for insert log first
		// for insert log
		BookPlanLog log = new BookPlanLog();
		log.setDatecreatetime(new Date());
		log.setIntoperateid(7);
		log.setIntuserid(loginSession.getLoginUser().getIntid());
		log.setIntplanid(planId);
		if (!bookPlanLogService.addNewLog(log)) {
			response.setStatus(3383);
			return false;
		}

		// set record
		BookPlan record = new BookPlan();
		record.setIntplanid(planId);
		record.setIntplanstatusid(1);

		return bookPlanService.updatePlan(record);
	}

	@RequestMapping(value = "/Change", method = RequestMethod.POST)
	@ResponseBody
	@AuthPower(value = "queryplan")
	public boolean changePlan(HttpServletRequest request, Model model, HttpServletResponse response) {
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
