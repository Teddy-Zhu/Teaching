package com.jcos.teaching.core.model;

public class PersonalConfig {
    private Integer intpersonconfigid;

    private Integer intuserid;

    private String strconfigname;

    private Integer intconfigvalue;

    public Integer getIntpersonconfigid() {
        return intpersonconfigid;
    }

    public void setIntpersonconfigid(Integer intpersonconfigid) {
        this.intpersonconfigid = intpersonconfigid;
    }

    public Integer getIntuserid() {
        return intuserid;
    }

    public void setIntuserid(Integer intuserid) {
        this.intuserid = intuserid;
    }

    public String getStrconfigname() {
        return strconfigname;
    }

    public void setStrconfigname(String strconfigname) {
        this.strconfigname = strconfigname == null ? null : strconfigname.trim();
    }

    public Integer getIntconfigvalue() {
        return intconfigvalue;
    }

    public void setIntconfigvalue(Integer intconfigvalue) {
        this.intconfigvalue = intconfigvalue;
    }
}