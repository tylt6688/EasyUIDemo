package com.example.demo.service;


import com.example.demo.dao.SubjectDao;
import com.example.demo.model.Subject;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class SubjectService {
    @Resource
    private SubjectDao subjectDao;

    public List<Subject> selectAll(){
        return subjectDao.selectAll();
    }

    public List<Subject> selectOwner(){
        return subjectDao.selectOwner();
    }

    public void insertOne(String subjectname,String studylicense){
         subjectDao.insertOne(subjectname,studylicense);
    }
}
