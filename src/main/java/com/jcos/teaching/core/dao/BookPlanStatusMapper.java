package com.jcos.teaching.core.dao;

import java.util.List;

import com.jcos.teaching.core.model.BookPlanStatus;

public interface BookPlanStatusMapper {
	int deleteByPrimaryKey(Integer intplanstatusid);

	int insert(BookPlanStatus record);

	int insertSelective(BookPlanStatus record);

	BookPlanStatus selectByPrimaryKey(Integer intplanstatusid);

	int updateByPrimaryKeySelective(BookPlanStatus record);

	int updateByPrimaryKey(BookPlanStatus record);

	List<BookPlanStatus> getAllPlanStatus();

	int authBookPlanStatus(Integer statusId);
}