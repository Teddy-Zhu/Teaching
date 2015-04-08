package com.jcos.teaching.core.service;

import java.util.List;

import com.jcos.teaching.core.model.BookPlan;


public interface BookPlanService {

	Integer authExistBookInUse(Integer[] bookIds);

	Integer authExistUserInUse(Integer[] userIds);

	boolean insertPlan(BookPlan record);

	boolean authPlanByUserIdAndPlanId(Integer planId, Integer userId);

	boolean authPlanStatusForChange(Integer planId);

	boolean updatePlan(BookPlan record);

	boolean authPlanStatusForResubmit(Integer planId);

	Integer getPersonalBookPlanTotalOrAll(BookPlan record);

	boolean authPlanStatusForPassAndRejectAndRefuse(Integer[] planId);

	boolean updatePlanStatusByIds(Integer[] planId, Integer statusId);

	List<BookPlan> getPersonalBookPlan(BookPlan record, Integer page, Integer rows, boolean isAll);

	List<BookPlan> getAllBookPlan(BookPlan record, Integer page, Integer rows, boolean isAll);

}
