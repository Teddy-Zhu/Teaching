package com.jcos.teaching.core.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jcos.teaching.core.exmodel.LoginSession;
import com.jcos.teaching.core.model.PersonalConfig;
import com.jcos.teaching.core.service.PersonalConfigService;

@Controller
@RequestMapping(value = "/PersonalConfig")
public class PersonalConfigController {

    @Inject
    private PersonalConfigService personalConfigService;

    @RequestMapping(value = "/SaveChanges", method = RequestMethod.POST)
    @ResponseBody
    public boolean savepersonalchange(HttpServletRequest request, Model model, HttpServletResponse response) {

        LoginSession loginSession = (LoginSession) request.getSession().getAttribute("loginSession");

        Integer userId = loginSession.getLoginUser().getIntid();

        Integer booksize = 10, usersize = 10, plansize = 10, suppliersize = 10, animation = 1;
        try {
            booksize = request.getParameter("BookGridSize") != null ? Integer.valueOf(request.getParameter("BookGridSize")) : null;
            usersize = request.getParameter("UserGridSize") != null ? Integer.valueOf(request.getParameter("UserGridSize")) : null;
            plansize = request.getParameter("UserGridSize") != null ? Integer.valueOf(request.getParameter("SupplierGridSize")) : null;
            suppliersize = request.getParameter("UserGridSize") != null ? Integer.valueOf(request.getParameter("PlanGridSize")) : null;
            animation = request.getParameter("AnimationToggle").equals("on") ? 1 : 0;
        } catch (Exception e) {
            response.setStatus(3386);
            return false;
        }
        List<PersonalConfig> list = new ArrayList<PersonalConfig>();
        if (booksize != null) {
            list.add(new PersonalConfig(null, userId, "bookgridsize", booksize));
        }
        if (usersize != null) {
            list.add(new PersonalConfig(null, userId, "usergridsize", usersize));
        }
        if (suppliersize != null) {
            list.add(new PersonalConfig(null, userId, "suppliergridsize", suppliersize));
        }
        if (plansize != null) {
            list.add(new PersonalConfig(null, userId, "plangridsize", plansize));
        }
        list.add(new PersonalConfig(null, userId, "openAnimation", animation));
        return personalConfigService.addOrUpdatePersonalConfig(list);
    }
}
