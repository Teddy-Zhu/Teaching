package com.jcos.teaching.core.model;

public class Config {
    private Integer intconfigid;

    private String strname;

    private String strvalue;

    public Integer getIntconfigid() {
        return intconfigid;
    }

    public void setIntconfigid(Integer intconfigid) {
        this.intconfigid = intconfigid;
    }

    public String getStrname() {
        return strname;
    }

    public void setStrname(String strname) {
        this.strname = strname == null ? null : strname.trim();
    }

    public String getStrvalue() {
        return strvalue;
    }

    public void setStrvalue(String strvalue) {
        this.strvalue = strvalue == null ? null : strvalue.trim();
    }
}