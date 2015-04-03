package com.jcos.teaching.core.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jcos.teaching.core.model.Menus;
import com.jcos.teaching.core.service.MenuService;
import com.jcos.teaching.core.util.annotation.AuthPower;

@Controller
@RequestMapping(value = "/Menu")
public class MenuController {

	@Inject
	private MenuService menusService;

	@RequestMapping(value = "/MenuTree", method = RequestMethod.POST)
	@AuthPower(value = "menumanage")
	@ResponseBody
	public List<Menus> getAllMenus(HttpServletRequest request, Model model, HttpServletResponse response) {
		return menusService.getAllMenusNoFilter();
	}

	@RequestMapping(value = "/Update", method = RequestMethod.POST)
	@AuthPower(value = "menumanage")
	@ResponseBody
	public boolean update(HttpServletRequest request, Model model, HttpServletResponse response) {

		Integer id = -1;
		String menuname = "", menuicon = "";
		try {
			id = request.getParameter("menu").equals("") ? -1 : Integer.valueOf(request.getParameter("menu"));
			menuname = request.getParameter("menuname").trim();
			menuicon = request.getParameter("menuicon").trim();
		} catch (Exception e) {
			response.setStatus(3386);
			return false;
		}
		if (id == -1 || id == 1 || menuname.equals("") || menuicon.equals("")) {
			response.setStatus(3386);
			return false;
		}
		Menus record = new Menus();
		record.setIntmenuid(id);
		record.setStrmenuname(menuname);
		record.setStrmenuiconclass(menuicon);
		return menusService.updateMenu(record);
	}
}
