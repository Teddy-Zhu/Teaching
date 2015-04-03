package com.jcos.teaching.core.dao;

import java.util.List;

import com.jcos.teaching.core.model.Menus;

public interface MenusMapper {
	int deleteByPrimaryKey(Integer intmenuid);

	int insert(Menus record);

	int insertSelective(Menus record);

	Menus selectByPrimaryKey(Integer intmenuid);

	int updateByPrimaryKeySelective(Menus record);

	int updateByPrimaryKey(Menus record);

	List<Menus> selectAllMenus();

	List<Menus> selectAllMenusNoFilter();
}