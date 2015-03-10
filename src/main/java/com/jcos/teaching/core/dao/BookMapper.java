package com.jcos.teaching.core.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jcos.teaching.core.model.Book;

public interface BookMapper {
	int deleteByPrimaryKey(Integer intbookid);

	int insert(Book record);

	int insertSelective(Book record);

	Book selectByPrimaryKey(Integer intbookid);

	int updateByPrimaryKeySelective(Book record);

	int updateByPrimaryKey(Book record);

	List<Book> queryBooks(@Param(value = "record") Book record, @Param(value = "start") Integer start, @Param(value = "size") Integer size);

	int queryBookTotal(Book record);

	Integer authSupplierById(Integer intsupplierid);

	Integer authBookType(Integer id);

}