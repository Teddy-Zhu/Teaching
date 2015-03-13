package com.jcos.teaching.core.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jcos.teaching.core.model.BookPlanLog;

public interface BookPlanLogMapper {
	int deleteByPrimaryKey(Integer intplanlogid);

	int insert(BookPlanLog record);

	int insertSelective(BookPlanLog record);

	BookPlanLog selectByPrimaryKey(Integer intplanlogid);

	int updateByPrimaryKeySelective(BookPlanLog record);

	int updateByPrimaryKey(BookPlanLog record);

	List<BookPlanLog> selectBookPlanLogByuserId(@Param(value = "userId") Integer userId);
}