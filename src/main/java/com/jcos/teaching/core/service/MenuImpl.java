package com.jcos.teaching.core.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jcos.teaching.core.dao.MenusMapper;
import com.jcos.teaching.core.model.Menus;

@Service
public class MenuImpl implements MenuService {

	@Inject
	private MenusMapper menuDao;

	@Override
	public List<Menus> getAllMenus() {
		return menuDao.selectAllMenus();
	}
}
