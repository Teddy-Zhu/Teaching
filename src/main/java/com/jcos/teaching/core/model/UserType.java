package com.jcos.teaching.core.model;

public class UserType {
    private Integer intidentityid;

    private String strname;

    public Integer getIntidentityid() {
        return intidentityid;
    }

    public void setIntidentityid(Integer intidentityid) {
        this.intidentityid = intidentityid;
    }

    public String getStrname() {
        return strname;
    }

    public void setStrname(String strname) {
        this.strname = strname == null ? null : strname.trim();
    }
}