package com.jcos.teaching.core.util.common;

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
