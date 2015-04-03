package com.jcos.teaching.core.service.Impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jcos.teaching.core.dao.MenusMapper;
import com.jcos.teaching.core.model.Menus;
import com.jcos.teaching.core.service.MenuService;

@Service
public class MenuImpl implements MenuService {

	@Inject
	private MenusMapper menuDao;

	@Override
	public List<Menus> getAllMenus() {
		return menuDao.selectAllMenus();
	}

	@Override
	public List<Menus> getAllMenusNoFilter() {
		return menuDao.selectAllMenusNoFilter();
	}

	@Override
	public boolean updateMenu(Menus record) {
		Integer i = menuDao.updateByPrimaryKeySelective(record);
		if (i == 1) {
			return true;
		} else {
			return false;
		}
	}
}
