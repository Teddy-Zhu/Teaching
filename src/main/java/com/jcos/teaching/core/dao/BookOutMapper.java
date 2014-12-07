package com.jcos.teaching.core.dao;

import com.jcos.teaching.core.model.BookOut;

public interface BookOutMapper {
    int deleteByPrimaryKey(Integer intbookoutid);

    int insert(BookOut record);

    int insertSelective(BookOut record);

    BookOut selectByPrimaryKey(Integer intbookoutid);

    int updateByPrimaryKeySelective(BookOut record);

    int updateByPrimaryKey(BookOut record);
}