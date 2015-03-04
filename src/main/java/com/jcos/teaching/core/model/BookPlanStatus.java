package com.jcos.teaching.core.model;

public class BookPlanStatus {
    private Integer intplanstatusid;

    private String strname;

    private String strmark;

    public Integer getIntplanstatusid() {
        return intplanstatusid;
    }

    public void setIntplanstatusid(Integer intplanstatusid) {
        this.intplanstatusid = intplanstatusid;
    }

    public String getStrname() {
        return strname;
    }

    public void setStrname(String strname) {
        this.strname = strname == null ? null : strname.trim();
    }

    public String getStrmark() {
        return strmark;
    }

    public void setStrmark(String strmark) {
        this.strmark = strmark == null ? null : strmark.trim();
    }
}