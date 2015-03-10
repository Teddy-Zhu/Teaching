package com.jcos.teaching.core.service;

import com.jcos.teaching.core.model.BookPlan;


public interface BookPlanService {

	Integer authExistBookInUse(Integer[] bookIds);

	Integer authExistUserInUse(Integer[] userIds);

	boolean insertPlan(BookPlan record);

}
