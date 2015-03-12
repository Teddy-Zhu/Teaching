package com.jcos.teaching.core.model;

import java.util.Date;

public class BookPlanLog {
	private Integer intplanlogid;

	private Integer intplanid;

	private Integer intoperateid;

	private Integer intuserid;

	private Date datecreatetime;

	public BookPlanLog(Integer intplanlogid, Integer intplanid, Integer intoperateid, Integer intuserid, Date datecreatetime) {
		super();
		this.intplanlogid = intplanlogid;
		this.intplanid = intplanid;
		this.intoperateid = intoperateid;
		this.intuserid = intuserid;
		this.datecreatetime = datecreatetime;
	}

	public BookPlanLog() {
		this.intplanlogid = null;
		this.intplanid = null;
		this.intoperateid = null;
		this.intuserid = null;
		this.datecreatetime = null;
	}

	public Integer getIntplanlogid() {
		return intplanlogid;
	}

	public void setIntplanlogid(Integer intplanlogid) {
		this.intplanlogid = intplanlogid;
	}

	public Integer getIntplanid() {
		return intplanid;
	}

	public void setIntplanid(Integer intplanid) {
		this.intplanid = intplanid;
	}

	public Integer getIntoperateid() {
		return intoperateid;
	}

	public void setIntoperateid(Integer intoperateid) {
		this.intoperateid = intoperateid;
	}

	public Integer getIntuserid() {
		return intuserid;
	}

	public void setIntuserid(Integer intuserid) {
		this.intuserid = intuserid;
	}

	public Date getDatecreatetime() {
		return datecreatetime;
	}

	public void setDatecreatetime(Date datecreatetime) {
		this.datecreatetime = datecreatetime;
	}
}