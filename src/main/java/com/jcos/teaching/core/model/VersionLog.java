package com.jcos.teaching.core.model;

import java.util.Date;

public class VersionLog {
    private Integer intid;

    private String strfunversion;

    private String strbuildversion;

    private String strversion;

    private String strupdatecomment;

    private Date dateupdatetime;

    public Integer getIntid() {
        return intid;
    }

    public void setIntid(Integer intid) {
        this.intid = intid;
    }

    public String getStrfunversion() {
        return strfunversion;
    }

    public void setStrfunversion(String strfunversion) {
        this.strfunversion = strfunversion == null ? null : strfunversion.trim();
    }

    public String getStrbuildversion() {
        return strbuildversion;
    }

    public void setStrbuildversion(String strbuildversion) {
        this.strbuildversion = strbuildversion == null ? null : strbuildversion.trim();
    }

    public String getStrversion() {
        return strversion;
    }

    public void setStrversion(String strversion) {
        this.strversion = strversion == null ? null : strversion.trim();
    }

    public String getStrupdatecomment() {
        return strupdatecomment;
    }

    public void setStrupdatecomment(String strupdatecomment) {
        this.strupdatecomment = strupdatecomment == null ? null : strupdatecomment.trim();
    }

    public Date getDateupdatetime() {
        return dateupdatetime;
    }

    public void setDateupdatetime(Date dateupdatetime) {
        this.dateupdatetime = dateupdatetime;
    }
}