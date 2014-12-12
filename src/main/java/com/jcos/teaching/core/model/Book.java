package com.jcos.teaching.core.model;

import java.util.Date;

public class Book {
	private Integer intbookid;

	private String strbookname;

	private String strbookcoding;

	private String strbooksn;

	private Integer intbooktypeid;

	private String strprice;

	private String strpress;

	private String strauthor;

	private Double intpricediscount;

	private Integer intsupplierid;

	private Date dateaddtime;

	private BookType bookType;

	private Supplier supplier;

	public Book() {
		this.intbookid = 0;
		this.strbookname = "";
		this.strbookcoding = "";
		this.strbooksn = "";
		this.intbooktypeid = 0;
		this.strprice = "";
		this.strpress = "";
		this.strauthor = "";
		this.intpricediscount = 0.0;
		this.intsupplierid = 1;
		this.dateaddtime = new Date();
		this.bookType = new BookType();
		this.supplier = new Supplier();
	}

	public BookType getBookType() {
		return bookType;
	}

	public void setBookType(BookType bookType) {
		this.bookType = bookType;
	}

	public Supplier getSupplier() {
		return supplier;
	}

	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}

	public Integer getIntbookid() {
		return intbookid;
	}

	public void setIntbookid(Integer intbookid) {
		this.intbookid = intbookid;
	}

	public String getStrbookname() {
		return strbookname;
	}

	public void setStrbookname(String strbookname) {
		this.strbookname = strbookname == null ? null : strbookname.trim();
	}

	public String getStrbookcoding() {
		return strbookcoding;
	}

	public void setStrbookcoding(String strbookcoding) {
		this.strbookcoding = strbookcoding == null ? null : strbookcoding.trim();
	}

	public String getStrbooksn() {
		return strbooksn;
	}

	public void setStrbooksn(String strbooksn) {
		this.strbooksn = strbooksn == null ? null : strbooksn.trim();
	}

	public Integer getIntbooktypeid() {
		return intbooktypeid;
	}

	public void setIntbooktypeid(Integer intbooktypeid) {
		this.intbooktypeid = intbooktypeid;
	}

	public String getStrprice() {
		return strprice;
	}

	public void setStrprice(String strprice) {
		this.strprice = strprice == null ? null : strprice.trim();
	}

	public String getStrpress() {
		return strpress;
	}

	public void setStrpress(String strpress) {
		this.strpress = strpress == null ? null : strpress.trim();
	}

	public String getStrauthor() {
		return strauthor;
	}

	public void setStrauthor(String strauthor) {
		this.strauthor = strauthor == null ? null : strauthor.trim();
	}

	public Double getIntpricediscount() {
		return intpricediscount;
	}

	public void setIntpricediscount(Double intpricediscount) {
		this.intpricediscount = intpricediscount;
	}

	public Integer getIntsupplierid() {
		return intsupplierid;
	}

	public void setIntsupplierid(Integer intsupplierid) {
		this.intsupplierid = intsupplierid;
	}

	public Date getDateaddtime() {
		return dateaddtime;
	}

	public void setDateaddtime(Date dateaddtime) {
		this.dateaddtime = dateaddtime;
	}
}