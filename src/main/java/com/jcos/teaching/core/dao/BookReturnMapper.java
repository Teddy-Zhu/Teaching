package com.jcos.teaching.core.dao;

import com.jcos.teaching.core.model.BookReturn;

public interface BookReturnMapper {
    int deleteByPrimaryKey(Integer intbookreturnid);

    int insert(BookReturn record);

    int insertSelective(BookReturn record);

    BookReturn selectByPrimaryKey(Integer intbookreturnid);

    int updateByPrimaryKeySelective(BookReturn record);

    int updateByPrimaryKey(BookReturn record);
}