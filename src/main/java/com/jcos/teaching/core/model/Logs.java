package com.jcos.teaching.core.model;

import java.util.Date;

public class Logs {
    private Integer intlogid;

    private String intoperationid;

    private Date dateoperationtime;

    private Integer intuserid;

    public Integer getIntlogid() {
        return intlogid;
    }

    public void setIntlogid(Integer intlogid) {
        this.intlogid = intlogid;
    }

    public String getIntoperationid() {
        return intoperationid;
    }

    public void setIntoperationid(String intoperationid) {
        this.intoperationid = intoperationid == null ? null : intoperationid.trim();
    }

    public Date getDateoperationtime() {
        return dateoperationtime;
    }

    public void setDateoperationtime(Date dateoperationtime) {
        this.dateoperationtime = dateoperationtime;
    }

    public Integer getIntuserid() {
        return intuserid;
    }

    public void setIntuserid(Integer intuserid) {
        this.intuserid = intuserid;
    }
}