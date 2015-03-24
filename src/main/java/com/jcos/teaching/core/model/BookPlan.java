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

	private CourseType courseType;

	private BookPlanStatus bookPlanStatus;
	
	private User user;

	private Book book;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public CourseType getCourseType() {
		return courseType;
	}

	public void setCourseType(CourseType courseType) {
		this.courseType = courseType;
	}

	public BookPlanStatus getBookPlanStatus() {
		return bookPlanStatus;
	}

	public void setBookPlanStatus(BookPlanStatus bookPlanStatus) {
		this.bookPlanStatus = bookPlanStatus;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public BookPlan() {
		this.intplanid = null;
		this.strcoursename = null;
		this.intcoursetypeid = null;
		this.strclass = null;
		this.intstudcount = null;
		this.intteaccount = null;
		this.intbookid = null;
		this.intuserid = null;
		this.intplanstatusid = null;
		this.intfromyear = null;
		this.inttoyear = null;
		this.intterm = null;
		this.datecreatetime = null;
		this.strmark = "none";
	}

	public BookPlan(Integer intplanid, String strcoursename, Integer intcoursetypeid, String strclass, Integer intstudcount, Integer intteaccount, Integer intbookid, Integer intuserid,
			Integer intplanstatusid, Integer intfromyear, Integer inttoyear, Integer intterm, Date datecreatetime, String strmark) {
		super();
		this.intplanid = intplanid;
		this.strcoursename = strcoursename;
		this.intcoursetypeid = intcoursetypeid;
		this.strclass = strclass;
		this.intstudcount = intstudcount;
		this.intteaccount = intteaccount;
		this.intbookid = intbookid;
		this.intuserid = intuserid;
		this.intplanstatusid = intplanstatusid;
		this.intfromyear = intfromyear;
		this.inttoyear = inttoyear;
		this.intterm = intterm;
		this.datecreatetime = datecreatetime;
		this.strmark = strmark;
	}

	public BookPlan(Integer intplanid, String strcoursename, Integer intcoursetypeid, String strclass, Integer intstudcount, Integer intteaccount, Integer intbookid, Integer intuserid,
			Integer intplanstatusid, Integer intfromyear, Integer inttoyear, Integer intterm, Date datecreatetime, String strmark, CourseType courseType, BookPlanStatus bookPlanStatus, Book book) {
		super();
		this.intplanid = intplanid;
		this.strcoursename = strcoursename;
		this.intcoursetypeid = intcoursetypeid;
		this.strclass = strclass;
		this.intstudcount = intstudcount;
		this.intteaccount = intteaccount;
		this.intbookid = intbookid;
		this.intuserid = intuserid;
		this.intplanstatusid = intplanstatusid;
		this.intfromyear = intfromyear;
		this.inttoyear = inttoyear;
		this.intterm = intterm;
		this.datecreatetime = datecreatetime;
		this.strmark = strmark;
		this.courseType = courseType;
		this.bookPlanStatus = bookPlanStatus;
		this.book = book;
	}

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