package com.example.demo.dao;

import com.example.demo.model.Subject;

import java.util.List;

public interface SubjectDao {

    List<Subject> selectAll();

    List<Subject> selectOwner();

    void insertOne(String subjectname,String studylicense);
}
