package com.jcos.teaching.core.dao;

import java.util.List;

import com.jcos.teaching.core.model.BookType;

public interface BookTypeMapper {
	int deleteByPrimaryKey(Integer intbooktypeid);

	int insert(BookType record);

	int insertSelective(BookType record);

	BookType selectByPrimaryKey(Integer intbooktypeid);

	int updateByPrimaryKeySelective(BookType record);

	int updateByPrimaryKey(BookType record);

	List<BookType> queryBookType();
}