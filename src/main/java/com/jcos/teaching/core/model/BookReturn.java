package com.jcos.teaching.core.model;

import java.util.Date;

public class BookReturn {
    private Integer intbookreturnid;

    private Integer intuserid;

    private Integer intforid;

    private Integer intreturncount;

    private Date datereturntime;

    private Integer intoperationpersionid;

    public Integer getIntbookreturnid() {
        return intbookreturnid;
    }

    public void setIntbookreturnid(Integer intbookreturnid) {
        this.intbookreturnid = intbookreturnid;
    }

    public Integer getIntuserid() {
        return intuserid;
    }

    public void setIntuserid(Integer intuserid) {
        this.intuserid = intuserid;
    }

    public Integer getIntforid() {
        return intforid;
    }

    public void setIntforid(Integer intforid) {
        this.intforid = intforid;
    }

    public Integer getIntreturncount() {
        return intreturncount;
    }

    public void setIntreturncount(Integer intreturncount) {
        this.intreturncount = intreturncount;
    }

    public Date getDatereturntime() {
        return datereturntime;
    }

    public void setDatereturntime(Date datereturntime) {
        this.datereturntime = datereturntime;
    }

    public Integer getIntoperationpersionid() {
        return intoperationpersionid;
    }

    public void setIntoperationpersionid(Integer intoperationpersionid) {
        this.intoperationpersionid = intoperationpersionid;
    }
}