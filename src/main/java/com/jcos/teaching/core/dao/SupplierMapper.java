package com.jcos.teaching.core.dao;

import com.jcos.teaching.core.model.Supplier;

public interface SupplierMapper {
    int deleteByPrimaryKey(Integer intsupplierid);

    int insert(Supplier record);

    int insertSelective(Supplier record);

    Supplier selectByPrimaryKey(Integer intsupplierid);

    int updateByPrimaryKeySelective(Supplier record);

    int updateByPrimaryKey(Supplier record);
}