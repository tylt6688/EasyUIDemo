package com.example.demo.model;

public class Subject {

    private int id;
    private String subjectname;
    private String studylicense;
    private String name;
    private String studyclass;


    public String getStudyclass() {
        return studyclass;
    }

    public void setStudyclass(String studyclass) {
        this.studyclass = studyclass;
    }

    public String getSubjectname() {
        return subjectname;
    }

    public void setSubjectname(String subjectname) {
        this.subjectname = subjectname;
    }

    public String getStudylicense() {
        return studylicense;
    }

    public void setStudylicense(String studylicense) {
        this.studylicense = studylicense;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
