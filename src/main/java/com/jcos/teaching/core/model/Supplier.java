package com.jcos.teaching.core.model;

public class Supplier {
	private Integer intsupplierid;

	private String intcoding;

	private String strname;

	private String straddress;

	private String strcompanyphone;

	private String strhandlepersonname;

	private String strhandlephone;

	private String strcontactpersonname;

	private String strcontactpersonphone;

	public Supplier() {
		this.intsupplierid = 0;
		this.intcoding = "";
		this.strname = "";
		this.straddress = "";
		this.strcompanyphone = "";
		this.strhandlepersonname = "";
		this.strhandlephone = "";
		this.strcontactpersonname = "";
		this.strcontactpersonphone = "";
	}

	public Integer getIntsupplierid() {
		return intsupplierid;
	}

	public void setIntsupplierid(Integer intsupplierid) {
		this.intsupplierid = intsupplierid;
	}

	public String getIntcoding() {
		return intcoding;
	}

	public void setIntcoding(String intcoding) {
		this.intcoding = intcoding == null ? null : intcoding.trim();
	}

	public String getStrname() {
		return strname;
	}

	public void setStrname(String strname) {
		this.strname = strname == null ? null : strname.trim();
	}

	public String getStraddress() {
		return straddress;
	}

	public void setStraddress(String straddress) {
		this.straddress = straddress == null ? null : straddress.trim();
	}

	public String getStrcompanyphone() {
		return strcompanyphone;
	}

	public void setStrcompanyphone(String strcompanyphone) {
		this.strcompanyphone = strcompanyphone == null ? null : strcompanyphone.trim();
	}

	public String getStrhandlepersonname() {
		return strhandlepersonname;
	}

	public void setStrhandlepersonname(String strhandlepersonname) {
		this.strhandlepersonname = strhandlepersonname == null ? null : strhandlepersonname.trim();
	}

	public String getStrhandlephone() {
		return strhandlephone;
	}

	public void setStrhandlephone(String strhandlephone) {
		this.strhandlephone = strhandlephone == null ? null : strhandlephone.trim();
	}

	public String getStrcontactpersonname() {
		return strcontactpersonname;
	}

	public void setStrcontactpersonname(String strcontactpersonname) {
		this.strcontactpersonname = strcontactpersonname == null ? null : strcontactpersonname.trim();
	}

	public String getStrcontactpersonphone() {
		return strcontactpersonphone;
	}

	public void setStrcontactpersonphone(String strcontactpersonphone) {
		this.strcontactpersonphone = strcontactpersonphone == null ? null : strcontactpersonphone.trim();
	}
}