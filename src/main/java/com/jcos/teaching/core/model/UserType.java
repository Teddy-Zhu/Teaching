package com.jcos.teaching.core.model;

public class UserType {
	private Integer intidentityid;

	private String strname;

	private Integer intallowreg;

	public UserType() {
		this.intidentityid = 0;
		this.strname = "";
		this.intallowreg = 0;
	}

	public Integer getIntidentityid() {
		return intidentityid;
	}

	public void setIntidentityid(Integer intidentityid) {
		this.intidentityid = intidentityid;
	}

	public String getStrname() {
		return strname;
	}

	public void setStrname(String strname) {
		this.strname = strname == null ? null : strname.trim();
	}

	public Integer getIntallowreg() {
		return intallowreg;
	}

	public void setIntallowreg(Integer intallowreg) {
		this.intallowreg = intallowreg;
	}
}