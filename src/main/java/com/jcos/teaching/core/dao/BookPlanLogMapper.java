package com.jcos.teaching.core.dao;

import com.jcos.teaching.core.model.BookPlanLog;

public interface BookPlanLogMapper {
    int deleteByPrimaryKey(Integer intplanlogid);

    int insert(BookPlanLog record);

    int insertSelective(BookPlanLog record);

    BookPlanLog selectByPrimaryKey(Integer intplanlogid);

    int updateByPrimaryKeySelective(BookPlanLog record);

    int updateByPrimaryKey(BookPlanLog record);
}