package com.jcos.teaching.core.dao;

import com.jcos.teaching.core.model.BookPlan;

public interface BookPlanMapper {
	int deleteByPrimaryKey(Integer intplanid);

	int insert(BookPlan record);

	int insertSelective(BookPlan record);

	BookPlan selectByPrimaryKey(Integer intplanid);

	int updateByPrimaryKeySelective(BookPlan record);

	int updateByPrimaryKey(BookPlan record);

	Integer authUserIds(Integer intuserid);

	Integer authBookIds(Integer intbookid);
}