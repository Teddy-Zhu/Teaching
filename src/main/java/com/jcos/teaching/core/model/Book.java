package com.jcos.teaching.core.model;

public class Book {
    private Integer intbookid;

    private String strbookcoding;

    private String strbooksn;

    private Integer intbooktypeid;

    private String strprice;

    private String strpress;

    private String strauthor;

    private Integer intpricediscount;

    private Integer intsupplierid;

    public Integer getIntbookid() {
        return intbookid;
    }

    public void setIntbookid(Integer intbookid) {
        this.intbookid = intbookid;
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

    public Integer getIntpricediscount() {
        return intpricediscount;
    }

    public void setIntpricediscount(Integer intpricediscount) {
        this.intpricediscount = intpricediscount;
    }

    public Integer getIntsupplierid() {
        return intsupplierid;
    }

    public void setIntsupplierid(Integer intsupplierid) {
        this.intsupplierid = intsupplierid;
    }
}