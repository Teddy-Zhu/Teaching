package com.jcos.teaching.core.model;

import java.util.Date;

public class BookPlanChange {
	private Integer intbookchangeid;

	private Integer intplanid;

	private Integer intstudent;

	private Integer intteacher;

	private String strchangereason;

	private Date datechangetime;

	public BookPlanChange() {
		this.intbookchangeid = null;
		this.intplanid = null;
		this.intstudent = null;
		this.intteacher = null;
		this.strchangereason = null;
		this.datechangetime = null;
	}

	public BookPlanChange(Integer intbookchangeid, Integer intplanid, Integer intstudent, Integer intteacher, String strchangereason, Date datechangetime) {
		super();
		this.intbookchangeid = intbookchangeid;
		this.intplanid = intplanid;
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