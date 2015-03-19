package com.jcos.teaching.core.service;

import java.util.List;

import com.jcos.teaching.core.model.BookPlanLog;

public interface BookPlanLogService {

	boolean addNewLog(BookPlanLog record);

	boolean removeLogById(Integer logId);

	List<BookPlanLog> getBookPlanLogByUserId(Integer userId, Integer planId);

}
