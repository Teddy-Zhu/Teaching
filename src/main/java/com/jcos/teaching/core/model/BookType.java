package com.jcos.teaching.core.model;

public class BookType {
	private Integer intbooktypeid;

	private String strbooktypename;

	public BookType() {
		this.intbooktypeid = 0;
		this.strbooktypename = "";
	}

	public Integer getIntbooktypeid() {
		return intbooktypeid;
	}

	public void setIntbooktypeid(Integer intbooktypeid) {
		this.intbooktypeid = intbooktypeid;
	}

	public String getStrbooktypename() {
		return strbooktypename;
	}

	public void setStrbooktypename(String strbooktypename) {
		this.strbooktypename = strbooktypename == null ? null : strbooktypename.trim();
	}
}