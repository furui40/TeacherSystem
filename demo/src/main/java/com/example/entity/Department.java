package com.example.entity;

import java.util.Date;

public class Department {
    private String dname;
    private Integer DNO;
    private String mgrssn;
    private Date mgrdate;
    private String equipment;

    public Department() {
    }

    public Department(String dname, Integer DNO, String mgrssn, Date mgrdate, String equipment) {
        this.dname = dname;
        this.DNO = DNO;
        this.mgrssn = mgrssn;
        this.mgrdate = mgrdate;
        this.equipment = equipment;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    public Integer getDNO() {
        return DNO;
    }

    public void setDNO(Integer DNO) {
        this.DNO = DNO;
    }

    public String getMgrssn() {
        return mgrssn;
    }

    public void setMgrssn(String mgrssn) {
        this.mgrssn = mgrssn;
    }

    public Date getMgrdate() {
        return mgrdate;
    }

    public void setMgrdate(Date mgrdate) {
        this.mgrdate = mgrdate;
    }

    public String getEquipment() {
        return equipment;
    }

    public void setEquipment(String equipment) {
        this.equipment = equipment;
    }
}
