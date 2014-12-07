package com.jcos.teaching.core.model;

public class User {
    private Integer intid;

    private String username;

    private String password;

    private String strname;

    private Integer strtypeid;

    private String strphone;

    private String strmail;

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

    public Integer getStrtypeid() {
        return strtypeid;
    }

    public void setStrtypeid(Integer strtypeid) {
        this.strtypeid = strtypeid;
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
}