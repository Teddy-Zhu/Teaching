package com.jcos.teaching.core.model;

public class Power {
	private Integer intpowerid;

	private Integer intusertypeid;

	private String strauthname;

	private Integer intauthvalue;

	public Power() {
		super();
		this.intpowerid = 0;
		this.intusertypeid = 0;
		this.strauthname = "";
		this.intauthvalue = 0;
	}

	public Integer getIntpowerid() {
		return intpowerid;
	}

	public void setIntpowerid(Integer intpowerid) {
		this.intpowerid = intpowerid;
	}

	public Integer getIntusertypeid() {
		return intusertypeid;
	}

	public void setIntusertypeid(Integer intusertypeid) {
		this.intusertypeid = intusertypeid;
	}

	public String getStrauthname() {
		return strauthname;
	}

	public void setStrauthname(String strauthname) {
		this.strauthname = strauthname == null ? null : strauthname.trim();
	}

	public Integer getIntauthvalue() {
		return intauthvalue;
	}

	public void setIntauthvalue(Integer intauthvalue) {
		this.intauthvalue = intauthvalue;
	}
}