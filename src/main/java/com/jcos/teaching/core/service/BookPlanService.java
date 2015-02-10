package com.jcos.teaching.core.service;


public interface BookPlanService {

	Integer authExistBookInUse(Integer[] bookIds);

	Integer authExistUserInUse(Integer[] userIds);

}
