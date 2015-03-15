package com.jcos.teaching.core.dao;

import com.jcos.teaching.core.model.BookPlanChange;
import com.jcos.teaching.core.model.BookPlanLog;

public interface BookPlanChangeMapper {
    int deleteByPrimaryKey(Integer intbookchangeid);

    int insert(BookPlanChange record);

    int insertSelective(BookPlanChange record);

    BookPlanChange selectByPrimaryKey(Integer intbookchangeid);

    int updateByPrimaryKeySelective(BookPlanChange record);

    int updateByPrimaryKey(BookPlanChange record);
    
	BookPlanLog selectByPlanLogId(Integer intbookplanlogid);
}