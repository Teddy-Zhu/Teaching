package com.jcos.teaching.core.service.Impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jcos.teaching.core.dao.BookPlanLogMapper;
import com.jcos.teaching.core.model.BookPlanLog;
import com.jcos.teaching.core.service.BookPlanLogService;

@Service
public class BookPlanLogImpl implements BookPlanLogService {

	@Inject
	private BookPlanLogMapper bookPlanLogDao;

	@Override
	public boolean addNewLog(BookPlanLog record) {
		if (bookPlanLogDao.insertSelective(record) != 1) {
			return false;
		} else {
			return true;
		}
	}
}
