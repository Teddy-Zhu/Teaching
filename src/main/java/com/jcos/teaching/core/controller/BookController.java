package com.jcos.teaching.core.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BookController {

	@RequestMapping(value = "/books", method = RequestMethod.POST)
	@ResponseBody
	public String getbooks(HttpServletRequest request, Model model) {

		return "index";
	}

}
