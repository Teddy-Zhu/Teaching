package com.jcos.teaching.core.model;

import java.util.Date;

public class Book {
	private Integer intbookid;

	private String strbookname;

	private String strbookcoding;

	private String strbooksn;

	private Integer intbooktypeid;

	private Double strprice;

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
		this.strprice = 0.0;
		this.strpress = "";
		this.strauthor = "";
		this.intpricediscount = 0.0;
		this.intsupplierid = 1;
		this.dateaddtime = new Date();
		this.bookType = new BookType();
		this.supplier = new Supplier();
	}

	public Book(String strbookname, String strbookcoding, String strbooksn, Integer intbooktypeid, Double strprice, String strpress, String strauthor, Double intpricediscount, Integer intsupplierid,
			Date dateaddtime) {
		super();
		this.strbookname = strbookname;
		this.strbookcoding = strbookcoding;
		this.strbooksn = strbooksn;
		this.intbooktypeid = intbooktypeid;
		this.strprice = strprice;
		this.strpress = strpress;
		this.strauthor = strauthor;
		this.intpricediscount = intpricediscount;
		this.intsupplierid = intsupplierid;
		this.dateaddtime = dateaddtime;
	}

	public Book(Integer intbookid, String strbookname, String strbookcoding, String strbooksn, Integer intbooktypeid, Double strprice, String strpress, String strauthor, Double intpricediscount,
			Integer intsupplierid, Date dateaddtime) {
		super();
		this.intbookid = intbookid;
		this.strbookname = strbookname;
		this.strbookcoding = strbookcoding;
		this.strbooksn = strbooksn;
		this.intbooktypeid = intbooktypeid;
		this.strprice = strprice;
		this.strpress = strpress;
		this.strauthor = strauthor;
		this.intpricediscount = intpricediscount;
		this.intsupplierid = intsupplierid;
		this.dateaddtime = dateaddtime;
	}

	public Book(String Name) {
		this.intbookid = null;
		this.strbookname = Name;
		this.strbookcoding = null;
		this.strbooksn = null;
		this.intbooktypeid = null;
		this.strprice = null;
		this.strpress = null;
		this.strauthor = null;
		this.intpricediscount = null;
		this.intsupplierid = null;
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

	public Double getStrprice() {
		return strprice;
	}

	public void setStrprice(Double strprice) {
		this.strprice = strprice;
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