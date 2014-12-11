package com.jcos.teaching.core.model;

import java.util.Date;

public class BookOut {
    private Integer intbookoutid;

    private Integer intuserid;

    private Integer intforid;

    private Date dateout;

    private Integer intoutcount;

    private Integer intstudentid;

    private String intstudentname;

    private Integer intsex;

    private Integer intclassid;

    private Date dateouttime;

    public Integer getIntbookoutid() {
        return intbookoutid;
    }

    public void setIntbookoutid(Integer intbookoutid) {
        this.intbookoutid = intbookoutid;
    }

    public Integer getIntuserid() {
        return intuserid;
    }

    public void setIntuserid(Integer intuserid) {
        this.intuserid = intuserid;
    }

    public Integer getIntforid() {
        return intforid;
    }

    public void setIntforid(Integer intforid) {
        this.intforid = intforid;
    }

    public Date getDateout() {
        return dateout;
    }

    public void setDateout(Date dateout) {
        this.dateout = dateout;
    }

    public Integer getIntoutcount() {
        return intoutcount;
    }

    public void setIntoutcount(Integer intoutcount) {
        this.intoutcount = intoutcount;
    }

    public Integer getIntstudentid() {
        return intstudentid;
    }

    public void setIntstudentid(Integer intstudentid) {
        this.intstudentid = intstudentid;
    }

    public String getIntstudentname() {
        return intstudentname;
    }

    public void setIntstudentname(String intstudentname) {
        this.intstudentname = intstudentname == null ? null : intstudentname.trim();
    }

    public Integer getIntsex() {
        return intsex;
    }

    public void setIntsex(Integer intsex) {
        this.intsex = intsex;
    }

    public Integer getIntclassid() {
        return intclassid;
    }

    public void setIntclassid(Integer intclassid) {
        this.intclassid = intclassid;
    }

    public Date getDateouttime() {
        return dateouttime;
    }

    public void setDateouttime(Date dateouttime) {
        this.dateouttime = dateouttime;
    }
}