package com.example.demo.controller;

import com.example.demo.model.Subject;
import com.example.demo.service.SubjectService;
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
@RequestMapping("/subject/")
public class SubjectController {

    @Resource
    private SubjectService subjectService;

    @RequestMapping("subject")
    public ModelAndView subject(){
        return new ModelAndView("subject");
    }

    @ResponseBody
    @RequestMapping("selectAll")
    public List<Subject> selectAll(){
        return subjectService.selectAll();
    }

    @ResponseBody
    @RequestMapping("selectOwner")
    public List<Subject> selectOwner(){
        return subjectService.selectOwner();
    }

    @ResponseBody
    @RequestMapping("insertOne")
    public Object insertOne(@RequestParam String subjectname,@RequestParam String studylicense){
        System.out.println(subjectname+"#####"+studylicense);
        subjectService.insertOne(subjectname,studylicense);
        Map<String, Object> map = new HashMap<>();
        map.put("result", "添加成功");
        return map;
    }

}
