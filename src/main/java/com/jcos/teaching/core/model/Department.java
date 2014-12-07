package com.jcos.teaching.core.model;

public class Department {
    private Integer intdepartmentid;

    private String strdepartmentname;

    private String strdepartmentphone;

    private String intdepartmentcoding;

    public Integer getIntdepartmentid() {
        return intdepartmentid;
    }

    public void setIntdepartmentid(Integer intdepartmentid) {
        this.intdepartmentid = intdepartmentid;
    }

    public String getStrdepartmentname() {
        return strdepartmentname;
    }

    public void setStrdepartmentname(String strdepartmentname) {
        this.strdepartmentname = strdepartmentname == null ? null : strdepartmentname.trim();
    }

    public String getStrdepartmentphone() {
        return strdepartmentphone;
    }

    public void setStrdepartmentphone(String strdepartmentphone) {
        this.strdepartmentphone = strdepartmentphone == null ? null : strdepartmentphone.trim();
    }

    public String getIntdepartmentcoding() {
        return intdepartmentcoding;
    }

    public void setIntdepartmentcoding(String intdepartmentcoding) {
        this.intdepartmentcoding = intdepartmentcoding == null ? null : intdepartmentcoding.trim();
    }
}