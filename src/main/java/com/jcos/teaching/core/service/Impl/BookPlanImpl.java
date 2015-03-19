package com.jcos.teaching.core.service.Impl;

import java.util.ArrayList;
import java.util.List;

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

	@Override
	public boolean updatePlan(BookPlan record) {
		Integer i = bookPlanDao.updateByPrimaryKeySelective(record);
		if (i == 1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public List<BookPlan> getPersonalBookPlan(BookPlan record, Integer page, Integer rows) {
		List<BookPlan> list = bookPlanDao.selectPersonal(record, rows * (page - 1), rows);
		if (list == null || list.get(0) == null) {
			return new ArrayList<BookPlan>();
		} else {
			return list;
		}
	}

	@Override
	public Integer getPersonalBookPlanTotal(BookPlan record) {
		return bookPlanDao.selectPersonalTotalCount(record);
	}

	@Override
	public boolean authPlanByUserIdAndPlanId(Integer planId, Integer userId) {
		Integer i = bookPlanDao.authPlanByUserIdAndPlanId(userId, planId);
		if (i == 1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean authPlanStatusForChange(Integer planId) {
		Integer i = bookPlanDao.selectPlanStatusForChange(planId);
		if (i > 2) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public boolean authPlanStatusForResubmit(Integer planId) {
		Integer i = bookPlanDao.selectPlanStatusForChange(planId);
		if (i != 2) {
			return false;
		} else {
			return true;
		}
	}
}
