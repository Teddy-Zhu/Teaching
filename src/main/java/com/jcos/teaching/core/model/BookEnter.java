package com.jcos.teaching.core.model;

import java.util.Date;

public class BookEnter {
    private Integer intbookenterid;

    private Integer intbookid;

    private Integer intuserid;

    private String intcount;

    private Date dateenter;

    private String struseyear;

    public Integer getIntbookenterid() {
        return intbookenterid;
    }

    public void setIntbookenterid(Integer intbookenterid) {
        this.intbookenterid = intbookenterid;
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

    public String getIntcount() {
        return intcount;
    }

    public void setIntcount(String intcount) {
        this.intcount = intcount == null ? null : intcount.trim();
    }

    public Date getDateenter() {
        return dateenter;
    }

    public void setDateenter(Date dateenter) {
        this.dateenter = dateenter;
    }

    public String getStruseyear() {
        return struseyear;
    }

    public void setStruseyear(String struseyear) {
        this.struseyear = struseyear == null ? null : struseyear.trim();
    }
}