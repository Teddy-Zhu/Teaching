package com.jcos.teaching.core.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jcos.teaching.core.exmodel.LoginSession;
import com.jcos.teaching.core.util.annotation.SetPower;

@Controller
@RequestMapping(value = "/Model")
public class JspModelController {

	@RequestMapping(value = "/{html}", method = RequestMethod.POST)
	public String menu1(@PathVariable String html, HttpServletRequest request, Model model, HttpServletResponse response) {
		return "model/" + html;
	}

}
