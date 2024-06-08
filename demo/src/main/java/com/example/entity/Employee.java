package com.example.entity;

import java.sql.Date;

public class Employee {
    private String name;
    private String essn;
    private String address;
    private Integer salary;
    private String superssn;
    private Integer dno;

    public Employee() {

    }

    public Employee(String name, String essn, String address, Integer salary, String superssn, Integer dno) {
        this.name = name;
        this.essn = essn;
        this.address = address;
        this.salary = salary;
        this.superssn = superssn;
        this.dno = dno;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEssn() {
        return essn;
    }

    public void setEssn(String essn) {
        this.essn = essn;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getSalary() {
        return salary;
    }

    public void setSalary(Integer salary) {
        this.salary = salary;
    }

    public String getSuperssn() {
        return superssn;
    }

    public void setSuperssn(String superssn) {
        this.superssn = superssn;
    }

    public Integer getDno() {
        return dno;
    }

    public void setDno(Integer dno) {
        this.dno = dno;
    }
}
