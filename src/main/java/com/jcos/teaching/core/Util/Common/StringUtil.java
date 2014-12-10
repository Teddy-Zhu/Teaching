/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jcos.teaching.core.Util.Common;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author ext_beyondsoft_ets12
 */
public class StringUtil {

    public StringUtil() {
    }

    public boolean isNull(HttpServletRequest request, String variable) {
        if (request != null && variable != null && !variable.equals("")) {
            if (request.getParameter(variable) != null && !request.getParameter(variable).equals("")) {
                return false;
            } else {
                return true;
            }
        } else {
            return true;
        }
    }
}
