package com.jcos.teaching.core.model;

public class CourseType {
    private Integer intcoursetypeid;

    private String strcoursetypename;

    public Integer getIntcoursetypeid() {
        return intcoursetypeid;
    }

    public void setIntcoursetypeid(Integer intcoursetypeid) {
        this.intcoursetypeid = intcoursetypeid;
    }

    public String getStrcoursetypename() {
        return strcoursetypename;
    }

    public void setStrcoursetypename(String strcoursetypename) {
        this.strcoursetypename = strcoursetypename == null ? null : strcoursetypename.trim();
    }
}