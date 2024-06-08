package com.example.entity;

public class DepartSalary {
    private Integer Dno;
    private Integer averSalary;

    public DepartSalary() {
    }

    public DepartSalary(Integer dno, Integer averSalary) {
        Dno = dno;
        this.averSalary = averSalary;
    }

    public Integer getDno() {
        return Dno;
    }

    public void setDno(Integer dno) {
        Dno = dno;
    }

    public Integer getAverSalary() {
        return averSalary;
    }

    public void setAverSalary(Integer averSalary) {
        this.averSalary = averSalary;
    }
}
