package com.jcos.teaching.core.model;

import java.util.Date;

public class BookPlan {
    private Integer intplanid;

    private String strcoursename;

    private Integer intcoursetypeid;

    private String strclass;

    private Integer intstudcount;

    private Integer intteaccount;

    private Integer intbookid;

    private Integer intuserid;

    private Integer intplanstatusid;

    private Integer intfromyear;

    private Integer inttoyear;

    private Integer intterm;

    private Date datecreatetime;

    private String strmark;

    public Integer getIntplanid() {
        return intplanid;
    }

    public void setIntplanid(Integer intplanid) {
        this.intplanid = intplanid;
    }

    public String getStrcoursename() {
        return strcoursename;
    }

    public void setStrcoursename(String strcoursename) {
        this.strcoursename = strcoursename == null ? null : strcoursename.trim();
    }

    public Integer getIntcoursetypeid() {
        return intcoursetypeid;
    }

    public void setIntcoursetypeid(Integer intcoursetypeid) {
        this.intcoursetypeid = intcoursetypeid;
    }

    public String getStrclass() {
        return strclass;
    }

    public void setStrclass(String strclass) {
        this.strclass = strclass == null ? null : strclass.trim();
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

    public Integer getIntplanstatusid() {
        return intplanstatusid;
    }

    public void setIntplanstatusid(Integer intplanstatusid) {
        this.intplanstatusid = intplanstatusid;
    }

    public Integer getIntfromyear() {
        return intfromyear;
    }

    public void setIntfromyear(Integer intfromyear) {
        this.intfromyear = intfromyear;
    }

    public Integer getInttoyear() {
        return inttoyear;
    }

    public void setInttoyear(Integer inttoyear) {
        this.inttoyear = inttoyear;
    }

    public Integer getIntterm() {
        return intterm;
    }

    public void setIntterm(Integer intterm) {
        this.intterm = intterm;
    }

    public Date getDatecreatetime() {
        return datecreatetime;
    }

    public void setDatecreatetime(Date datecreatetime) {
        this.datecreatetime = datecreatetime;
    }

    public String getStrmark() {
        return strmark;
    }

    public void setStrmark(String strmark) {
        this.strmark = strmark == null ? null : strmark.trim();
    }
}