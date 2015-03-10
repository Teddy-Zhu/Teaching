package com.jcos.teaching.core.service.Impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jcos.teaching.core.dao.BookPlanMapper;
import com.jcos.teaching.core.model.BookPlan;
import com.jcos.teaching.core.service.BookPlanService;

@Service
public class BookPlanImpl implements BookPlanService {

	@Inject
	private BookPlanMapper bookPlanDao;

	@Override
	public Integer authExistBookInUse(Integer[] bookIds) {
		for (Integer i : bookIds) {
			Integer ret = bookPlanDao.authBookIds(i);
			if (ret > 0)
				return i;
		}
		return 0;
	}

	@Override
	public Integer authExistUserInUse(Integer[] userIds) {
		for (Integer i : userIds) {
			Integer ret = bookPlanDao.authUserIds(i);
			if (ret > 0)
				return i;
		}
		return 0;
	}

	@Override
	public boolean insertPlan(BookPlan record) {
		Integer i = bookPlanDao.insertSelective(record);
		if (i == 1) {
			return true;
		} else {
			return false;
		}
	}
}
