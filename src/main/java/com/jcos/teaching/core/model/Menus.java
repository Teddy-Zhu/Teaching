package com.jcos.teaching.core.model;

public class Menus {
	private Integer intmenuid;

	private Integer intparentmenuid;

	private String strmenuvalue;

	private String strmenuname;

	private String strmenuiconclass;

	private String iconSkin;

	public Menus() {
		this.intmenuid = null;
		this.intparentmenuid = null;
		this.strmenuvalue = null;
		this.strmenuname = null;
		this.strmenuiconclass = null;
		this.iconSkin = null;
	}

	public String getIconSkin() {
		return strmenuiconclass.equals("fa") || strmenuiconclass.equals("") ? null : strmenuiconclass + " iconskin";
	}

	public void setIconSkin(String iconSkin) {
		this.iconSkin = iconSkin;
	}

	public Integer getIntmenuid() {
		return intmenuid;
	}

	public void setIntmenuid(Integer intmenuid) {
		this.intmenuid = intmenuid;
	}

	public Integer getIntparentmenuid() {
		return intparentmenuid;
	}

	public void setIntparentmenuid(Integer intparentmenuid) {
		this.intparentmenuid = intparentmenuid;
	}

	public String getStrmenuvalue() {
		return strmenuvalue;
	}

	public void setStrmenuvalue(String strmenuvalue) {
		this.strmenuvalue = strmenuvalue == null ? null : strmenuvalue.trim();
	}

	public String getStrmenuname() {
		return strmenuname;
	}

	public void setStrmenuname(String strmenuname) {
		this.strmenuname = strmenuname == null ? null : strmenuname.trim();
	}

	public String getStrmenuiconclass() {
		return strmenuiconclass;
	}

	public void setStrmenuiconclass(String strmenuiconclass) {
		this.strmenuiconclass = strmenuiconclass == null ? null : strmenuiconclass.trim();
	}
}