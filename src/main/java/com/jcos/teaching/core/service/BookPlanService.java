package com.jcos.teaching.core.service;

import java.util.List;

import com.jcos.teaching.core.model.BookPlan;


public interface BookPlanService {

	Integer authExistBookInUse(Integer[] bookIds);

	Integer authExistUserInUse(Integer[] userIds);

	boolean insertPlan(BookPlan record);

	List<BookPlan> getPersonalBookPlan(BookPlan record, Integer page, Integer rows);

	boolean authPlanByUserIdAndPlanId(Integer planId, Integer userId);

	boolean authPlanStatusForChange(Integer planId);

	boolean updatePlan(BookPlan record);

	boolean authPlanStatusForResubmit(Integer planId);

	List<BookPlan> getAllBookPlan(BookPlan record, Integer page, Integer rows);

	Integer getPersonalBookPlanTotalOrAll(BookPlan record);

}
