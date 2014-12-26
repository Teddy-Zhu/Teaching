package com.jcos.teaching.core.model;

public class Power {
    private Integer intpowerid;

    private Integer intusertypeid;

    private Integer allowlogin;

    private Integer allowaddbook;

    private Integer allowrmbook;

    private Integer alloweditbook;

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

    public Integer getAllowlogin() {
        return allowlogin;
    }

    public void setAllowlogin(Integer allowlogin) {
        this.allowlogin = allowlogin;
    }

    public Integer getAllowaddbook() {
        return allowaddbook;
    }

    public void setAllowaddbook(Integer allowaddbook) {
        this.allowaddbook = allowaddbook;
    }

    public Integer getAllowrmbook() {
        return allowrmbook;
    }

    public void setAllowrmbook(Integer allowrmbook) {
        this.allowrmbook = allowrmbook;
    }

    public Integer getAlloweditbook() {
        return alloweditbook;
    }

    public void setAlloweditbook(Integer alloweditbook) {
        this.alloweditbook = alloweditbook;
    }
}