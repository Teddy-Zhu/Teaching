package com.jcos.teaching.core.model;

import java.util.Date;

public class User {
	private Integer intid;

	private String username;

	private String password;

	private String strname;

	private Integer inttypeid;

	private Integer intuserdepartment;

	private String strstunum;

	private String strphone;

	private String strmail;

	private Date dateregtime;

	private UserType userType;

	
	public UserType getUserType() {
		return userType;
	}

	public void setUserType(UserType userType) {
		this.userType = userType;
	}

	public Integer getIntid() {
		return intid;
	}

	public void setIntid(Integer intid) {
		this.intid = intid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username == null ? null : username.trim();
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password == null ? null : password.trim();
	}

	public String getStrname() {
		return strname;
	}

	public void setStrname(String strname) {
		this.strname = strname == null ? null : strname.trim();
	}

	public Integer getInttypeid() {
		return inttypeid;
	}

	public void setInttypeid(Integer inttypeid) {
		this.inttypeid = inttypeid;
	}

	public Integer getIntuserdepartment() {
		return intuserdepartment;
	}

	public void setIntuserdepartment(Integer intuserdepartment) {
		this.intuserdepartment = intuserdepartment;
	}

	public String getStrstunum() {
		return strstunum;
	}

	public void setStrstunum(String strstunum) {
		this.strstunum = strstunum == null ? null : strstunum.trim();
	}

	public String getStrphone() {
		return strphone;
	}

	public void setStrphone(String strphone) {
		this.strphone = strphone == null ? null : strphone.trim();
	}

	public String getStrmail() {
		return strmail;
	}

	public void setStrmail(String strmail) {
		this.strmail = strmail == null ? null : strmail.trim();
	}

	public Date getDateregtime() {
		return dateregtime;
	}

	public void setDateregtime(Date dateregtime) {
		this.dateregtime = dateregtime;
	}
}