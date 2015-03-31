package com.jcos.teaching.core.service.Impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jcos.teaching.core.dao.BookPlanStatusMapper;
import com.jcos.teaching.core.model.BookPlanStatus;
import com.jcos.teaching.core.service.BookPlanStatusService;

@Service
public class BookPlanStatusImpl implements BookPlanStatusService {
	@Inject
	private BookPlanStatusMapper bookPlanStatusDao;

	@Override
	public List<BookPlanStatus> getAllBookPlanStatus() {
		return bookPlanStatusDao.getAllPlanStatus();
	}

	@Override
	public boolean authBookPlanStatus(Integer statusId) {
		Integer i = bookPlanStatusDao.authBookPlanStatus(statusId);
		if (i == 1) {
			return true;
		} else {
			return false;
		}
	}
}
