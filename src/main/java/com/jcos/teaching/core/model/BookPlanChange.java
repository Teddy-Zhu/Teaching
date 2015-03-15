package com.jcos.teaching.core.model;

import java.util.Date;

public class BookPlanChange {
    private Integer intbookchangeid;

    private Integer intplanid;

    private Integer intbookplanlogid;

    private Integer intstudent;

    private Integer intteacher;

    private String strchangereason;

    private Date datechangetime;

    
    public BookPlanChange() {
		this.intbookchangeid = -1;
		this.intplanid = -1;
		this.intbookplanlogid = -1;
		this.intstudent = 0;
		this.intteacher = 0;
		this.strchangereason = "";
		this.datechangetime = null;
	}

	public BookPlanChange(Integer intbookchangeid, Integer intplanid, Integer intbookplanlogid, Integer intstudent, Integer intteacher, String strchangereason, Date datechangetime) {
		super();
		this.intbookchangeid = intbookchangeid;
		this.intplanid = intplanid;
		this.intbookplanlogid = intbookplanlogid;
		this.intstudent = intstudent;
		this.intteacher = intteacher;
		this.strchangereason = strchangereason;
		this.datechangetime = datechangetime;
	}

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

    public Integer getIntbookplanlogid() {
        return intbookplanlogid;
    }

    public void setIntbookplanlogid(Integer intbookplanlogid) {
        this.intbookplanlogid = intbookplanlogid;
    }

    public Integer getIntstudent() {
        return intstudent;
    }

    public void setIntstudent(Integer intstudent) {
        this.intstudent = intstudent;
    }

    public Integer getIntteacher() {
        return intteacher;
    }

    public void setIntteacher(Integer intteacher) {
        this.intteacher = intteacher;
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