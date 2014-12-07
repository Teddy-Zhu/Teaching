package com.jcos.teaching.core.model;

public class ForType {
    private Integer intforid;

    private String strusename;

    private Integer intuserid;

    public Integer getIntforid() {
        return intforid;
    }

    public void setIntforid(Integer intforid) {
        this.intforid = intforid;
    }

    public String getStrusename() {
        return strusename;
    }

    public void setStrusename(String strusename) {
        this.strusename = strusename == null ? null : strusename.trim();
    }

    public Integer getIntuserid() {
        return intuserid;
    }

    public void setIntuserid(Integer intuserid) {
        this.intuserid = intuserid;
    }
}