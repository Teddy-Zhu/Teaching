package com.jcos.teaching.core.util;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.jcos.teaching.core.exmodel.LoginSession;
import com.jcos.teaching.core.model.BookPlanLog;
import com.jcos.teaching.core.service.BookPlanLogService;

@Service
public class BookPlanLogTool {

	@Inject
	private BookPlanLogService bookPlanLogService;

	public boolean AddBookPlanLog(HttpServletRequest request, Integer planId, Integer type) {

		LoginSession loginSession = (LoginSession) request.getSession().getAttribute("loginSession");
		// for insert log
		BookPlanLog log = new BookPlanLog();
		log.setDatecreatetime(new Date());
		log.setIntoperateid(type);
		log.setIntuserid(loginSession.getLoginUser().getIntid());
		log.setIntplanid(planId);
		if (!bookPlanLogService.addNewLog(log)) {
			return false;
		} else {
			return true;
		}
	}
}
