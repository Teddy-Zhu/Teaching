/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jcos.teaching.core.exmodel;

import com.jcos.teaching.core.model.User;

/**
 *
 * @author ext_beyondsoft_ets12
 */
public class LoginSession {

    User loginUser = new User();

    public User getLoginUser() {
        return loginUser;
    }

    public void setLoginUser(User loginUser) {
        this.loginUser = loginUser;
    }

}
