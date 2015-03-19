package com.jcos.teaching.core.service.Impl;

import java.util.List;

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

	@Override
	public List<BookPlanLog> getBookPlanLogByUserId(Integer userId, Integer planId) {
		return bookPlanLogDao.selectBookPlanLogByuserId(userId, planId);
	}

	@Override
	public boolean removeLogById(Integer logId) {
		Integer i = bookPlanLogDao.deleteByPrimaryKey(logId);
		if (i != 1) {
			return false;
		} else {
			return true;
		}
	}
}
