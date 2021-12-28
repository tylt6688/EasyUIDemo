package com.example.demo.service;

import com.example.demo.dao.StudentDao;
import com.example.demo.model.Student;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class StudentService {
    @Resource
    private StudentDao studentDao;

    public List<Student> selectAll() {
        return studentDao.selectAll();
    }

    public void add(Student student) {
        studentDao.add(student);
    }

    public List<Student> select(Student student) {
        return studentDao.select(student);
    }

    public List<Student> selectName(String queryname) {
        return studentDao.selectName(queryname);
    }

    public void update(Student student) {
        studentDao.update(student);
    }

    public void deleteById(Student student) {
        studentDao.deleteById(student);
    }

    public void delete(String[] ids) {
        studentDao.delete(ids);

    }
}
