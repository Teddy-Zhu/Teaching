package com.jcos.teaching.core.model;

public class CourseType {
    private Integer intcoursetypeid;

    private String strcoursename;

    public Integer getIntcoursetypeid() {
        return intcoursetypeid;
    }

    public void setIntcoursetypeid(Integer intcoursetypeid) {
        this.intcoursetypeid = intcoursetypeid;
    }

    public String getStrcoursename() {
        return strcoursename;
    }

    public void setStrcoursename(String strcoursename) {
        this.strcoursename = strcoursename == null ? null : strcoursename.trim();
    }
}