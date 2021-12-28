package com.example.demo.controller;

import com.example.demo.model.Student;
import com.example.demo.service.StudentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/student/")
public class StudentController {

    @Resource
    private StudentService studentService;

    @RequestMapping("list")
    public ModelAndView list() {
        return new ModelAndView("index");
    }

    @ResponseBody
    @RequestMapping("getList")
    public List<Student> getList() {
        return studentService.selectAll();

    }

    @ResponseBody
    @RequestMapping("add")
    public Object add(Student student) {
        studentService.add(student);
        Map<String, String> map = new HashMap<>();
        map.put("result", "添加成功");
        return map;
    }

    //查询学生
    @ResponseBody
    @RequestMapping("query")
    public Object query(Student student) {
        List<Student> students = studentService.select(student);
        Map<String, Object> map = new HashMap<>();
        map.put("result", students);
        return map;

    }

    //根据驾校姓名查询学生
    @ResponseBody
    @RequestMapping("queryname")
    public Object queryname(@RequestParam String queryname) {
        List<Student> students = studentService.selectName(queryname);
        Map<String, Object> map = new HashMap<>();
        map.put("result", students);
        return map;

    }


    @ResponseBody
    @RequestMapping("update")
    public Object update(Student student){
        studentService.update(student);
        Map<String, Object> map = new HashMap<>();
        map.put("result", "更新成功");
        return map;
    }

    @ResponseBody
    @RequestMapping("deleteById")
    public Object deleteById(Student student){
        studentService.deleteById(student);
        Map<String, Object> map = new HashMap<>();
        map.put("result", "删除成功");
        return map;

    }


    @ResponseBody
    @RequestMapping("delete")
   public Object delete(String ids){
        studentService.delete(ids.split(","));
        Map<String, Object> map = new HashMap<>();
        map.put("result", "批删除成功");
        return map;
    }




}
