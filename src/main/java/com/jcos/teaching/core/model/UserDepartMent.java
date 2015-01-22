package com.jcos.teaching.core.model;

public class UserDepartMent {
    private Integer intid;

    private Integer intparentid;

    private String strname;

    private Integer isleaf;

    public Integer getIntid() {
        return intid;
    }

    public void setIntid(Integer intid) {
        this.intid = intid;
    }

    public Integer getIntparentid() {
        return intparentid;
    }

    public void setIntparentid(Integer intparentid) {
        this.intparentid = intparentid;
    }

    public String getStrname() {
        return strname;
    }

    public void setStrname(String strname) {
        this.strname = strname == null ? null : strname.trim();
    }

    public Integer getIsleaf() {
        return isleaf;
    }

    public void setIsleaf(Integer isleaf) {
        this.isleaf = isleaf;
    }
}