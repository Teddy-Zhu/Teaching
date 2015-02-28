package com.jcos.teaching.core.model;

public class Power {
    private Integer intpowerid;

    private Integer intparentid;

    private String strname;

    private Integer intusertypeid;

	private String strauthname;

	private Integer intauthvalue;

	public Power() {
		super();
		this.intpowerid = 0;
		this.intparentid = 0;
		this.strname = "";
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

    public Integer getIntparentid() {
        return intparentid;
    }

    public void setIntparentid(Integer intparentid) {
        this.intparentid = intparentid;
    }

    public String getStrname() {
        return strname;
    }

    public void setStrname(String strname) {
        this.strname = strname == null ? null : strname.trim();
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