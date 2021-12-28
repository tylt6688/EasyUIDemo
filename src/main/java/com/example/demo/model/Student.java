package com.example.demo.model;

public class Student {
    private Long id;
    private String name;
    private Integer age;
    private String major;
    private String studylicense;
    private String studyclass;
    String queryName;

    public String getStudyclass() {
        return studyclass;
    }

    public void setStudyclass(String studyclass) {
        this.studyclass = studyclass;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getStudylicense() {
        return studylicense;
    }

    public void setStudylicense(String studylicense) {
        this.studylicense = studylicense;
    }

    public String getQueryName() {
        return queryName;
    }

    public void setQueryName(String queryName) {
        this.queryName = queryName;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
        queryName = "%" + name + "%";
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }
}


