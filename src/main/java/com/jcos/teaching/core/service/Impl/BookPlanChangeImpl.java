package com.jcos.teaching.core.service.Impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jcos.teaching.core.dao.BookPlanChangeMapper;
import com.jcos.teaching.core.model.BookPlanChange;
import com.jcos.teaching.core.service.BookPlanChangeService;

@Service
public class BookPlanChangeImpl implements BookPlanChangeService {

	@Inject
	private BookPlanChangeMapper bookPlanChangeDao;

	@Override
	public boolean insertBookPlanChange(BookPlanChange record) {
		Integer i = bookPlanChangeDao.insertSelective(record);
		if (i == 1) {
			return true;
		} else {
			return false;
		}
	}
}
