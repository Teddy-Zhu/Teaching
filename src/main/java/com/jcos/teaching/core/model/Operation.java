package com.jcos.teaching.core.model;

public class Operation {
    private Integer intoperationid;

    private String stroperationname;

    public Integer getIntoperationid() {
        return intoperationid;
    }

    public void setIntoperationid(Integer intoperationid) {
        this.intoperationid = intoperationid;
    }

    public String getStroperationname() {
        return stroperationname;
    }

    public void setStroperationname(String stroperationname) {
        this.stroperationname = stroperationname == null ? null : stroperationname.trim();
    }
}