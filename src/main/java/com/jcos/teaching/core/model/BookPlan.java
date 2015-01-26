package com.jcos.teaching.core.model;

public class BookPlan {
    private Integer intplanid;

    private Integer intcourseid;

    private String strclass;

    private Integer intcountall;

    private Integer intstudcount;

    private Integer intteaccount;

    private Integer intorderallcount;

    private Integer intbookid;

    private String strmark;

    public Integer getIntplanid() {
        return intplanid;
    }

    public void setIntplanid(Integer intplanid) {
        this.intplanid = intplanid;
    }

    public Integer getIntcourseid() {
        return intcourseid;
    }

    public void setIntcourseid(Integer intcourseid) {
        this.intcourseid = intcourseid;
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

    public String getStrmark() {
        return strmark;
    }

    public void setStrmark(String strmark) {
        this.strmark = strmark == null ? null : strmark.trim();
    }
}