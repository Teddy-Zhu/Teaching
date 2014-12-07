package com.jcos.teaching.core.dao;

import com.jcos.teaching.core.model.BookEnter;

public interface BookEnterMapper {
    int deleteByPrimaryKey(Integer intbookenterid);

    int insert(BookEnter record);

    int insertSelective(BookEnter record);

    BookEnter selectByPrimaryKey(Integer intbookenterid);

    int updateByPrimaryKeySelective(BookEnter record);

    int updateByPrimaryKey(BookEnter record);
}