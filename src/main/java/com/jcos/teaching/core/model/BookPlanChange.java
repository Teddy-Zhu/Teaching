package com.jcos.teaching.core.model;

import java.util.Date;

public class BookPlanChange {
    private Integer intbookchangeid;

    private Integer intplanid;

    private Integer intincreasestudent;

    private Integer intdecreasestudent;

    private Integer intincreaseteacher;

    private Integer intdecreaseteacher;

    private String strchangereason;

    private Date datechangetime;

    public Integer getIntbookchangeid() {
        return intbookchangeid;
    }

    public void setIntbookchangeid(Integer intbookchangeid) {
        this.intbookchangeid = intbookchangeid;
    }

    public Integer getIntplanid() {
        return intplanid;
    }

    public void setIntplanid(Integer intplanid) {
        this.intplanid = intplanid;
    }

    public Integer getIntincreasestudent() {
        return intincreasestudent;
    }

    public void setIntincreasestudent(Integer intincreasestudent) {
        this.intincreasestudent = intincreasestudent;
    }

    public Integer getIntdecreasestudent() {
        return intdecreasestudent;
    }

    public void setIntdecreasestudent(Integer intdecreasestudent) {
        this.intdecreasestudent = intdecreasestudent;
    }

    public Integer getIntincreaseteacher() {
        return intincreaseteacher;
    }

    public void setIntincreaseteacher(Integer intincreaseteacher) {
        this.intincreaseteacher = intincreaseteacher;
    }

    public Integer getIntdecreaseteacher() {
        return intdecreaseteacher;
    }

    public void setIntdecreaseteacher(Integer intdecreaseteacher) {
        this.intdecreaseteacher = intdecreaseteacher;
    }

    public String getStrchangereason() {
        return strchangereason;
    }

    public void setStrchangereason(String strchangereason) {
        this.strchangereason = strchangereason == null ? null : strchangereason.trim();
    }

    public Date getDatechangetime() {
        return datechangetime;
    }

    public void setDatechangetime(Date datechangetime) {
        this.datechangetime = datechangetime;
    }
}