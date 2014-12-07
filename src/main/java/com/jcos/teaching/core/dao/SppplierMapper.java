package com.jcos.teaching.core.dao;

import com.jcos.teaching.core.model.Sppplier;

public interface SppplierMapper {
    int deleteByPrimaryKey(Integer intsupplierid);

    int insert(Sppplier record);

    int insertSelective(Sppplier record);

    Sppplier selectByPrimaryKey(Integer intsupplierid);

    int updateByPrimaryKeySelective(Sppplier record);

    int updateByPrimaryKey(Sppplier record);
}