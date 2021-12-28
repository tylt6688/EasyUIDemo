package com.example.demo.dao;

import com.example.demo.model.Student;

import java.util.List;

public interface StudentDao {
    List<Student> selectAll();

    List<Student> selectName(String queryname);

    void add(Student student);

    List<Student> select(Student student);

    void update(Student student);

    void deleteById(Student student);

    void delete(String[] ids);


}
