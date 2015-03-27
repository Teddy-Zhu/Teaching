package com.jcos.teaching.core.model;

import java.util.Date;

public class BookPlanLog {
	private Integer intplanlogid;

	private Integer intplanid;

	private Integer intoperateid;

	private Integer intuserid;

	private Date datecreatetime;

	private BookPlan bookPlan;

	private Operation operation;

	private BookPlanChange bookPlanChange;

	private User user;

	public BookPlanLog() {
		this.intplanlogid = null;
		this.intplanid = null;
		this.intoperateid = null;
		this.intuserid = null;
		this.datecreatetime = null;
		this.bookPlan = null;
		this.operation = null;
		this.bookPlanChange = null;
		this.user = null;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public BookPlanChange getBookPlanChange() {
		return bookPlanChange;
	}

	public void setBookPlanChange(BookPlanChange bookPlanChange) {
		this.bookPlanChange = bookPlanChange;
	}

	public BookPlan getBookPlan() {
		return bookPlan;
	}

	public void setBookPlan(BookPlan bookPlan) {
		this.bookPlan = bookPlan;
	}

	public Operation getOperation() {
		return operation;
	}

	public void setOperation(Operation operation) {
		this.operation = operation;
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