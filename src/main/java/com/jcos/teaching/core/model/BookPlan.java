package com.jcos.teaching.core.model;

import java.util.Date;

public class BookPlan {
    private Integer intplanid;

    private String strcourseid;

    private String strclass;

    private Integer intcountall;

    private Integer intstudcount;

    private Integer intteaccount;

    private Integer intorderallcount;

    private Integer intbookid;

    private Integer intuserid;

    private String strmark;

    private Integer intplanstatusid;

    private Integer intyear;

    private Date dateaddtime;

    public Integer getIntplanid() {
        return intplanid;
    }

    public void setIntplanid(Integer intplanid) {
        this.intplanid = intplanid;
    }

    public String getStrcourseid() {
        return strcourseid;
    }

    public void setStrcourseid(String strcourseid) {
        this.strcourseid = strcourseid == null ? null : strcourseid.trim();
    }

    public String getStrclass() {
        return strclass;
    }

    public void setStrclass(String strclass) {
        this.strclass = strclass == null ? null : strclass.trim();
    }

    public Integer getIntcountall() {
        return intcountall;
    }

    public void setIntcountall(Integer intcountall) {
        this.intcountall = intcountall;
    }

    public Integer getIntstudcount() {
        return intstudcount;
    }

    public void setIntstudcount(Integer intstudcount) {
        this.intstudcount = intstudcount;
    }

    public Integer getIntteaccount() {
        return intteaccount;
    }

    public void setIntteaccount(Integer intteaccount) {
        this.intteaccount = intteaccount;
    }

    public Integer getIntorderallcount() {
        return intorderallcount;
    }

    public void setIntorderallcount(Integer intorderallcount) {
        this.intorderallcount = intorderallcount;
    }

    public Integer getIntbookid() {
        return intbookid;
    }

    public void setIntbookid(Integer intbookid) {
        this.intbookid = intbookid;
    }

    public Integer getIntuserid() {
        return intuserid;
    }

    public void setIntuserid(Integer intuserid) {
        this.intuserid = intuserid;
    }

    public String getStrmark() {
        return strmark;
    }

    public void setStrmark(String strmark) {
        this.strmark = strmark == null ? null : strmark.trim();
    }

    public Integer getIntplanstatusid() {
        return intplanstatusid;
    }

    public void setIntplanstatusid(Integer intplanstatusid) {
        this.intplanstatusid = intplanstatusid;
    }

    public Integer getIntyear() {
        return intyear;
    }

    public void setIntyear(Integer intyear) {
        this.intyear = intyear;
    }

    public Date getDateaddtime() {
        return dateaddtime;
    }

    public void setDateaddtime(Date dateaddtime) {
        this.dateaddtime = dateaddtime;
    }
}