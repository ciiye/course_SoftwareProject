package com.temp.common.service;

import com.temp.admin.dto.CourseDTO;
import com.temp.admin.dto.list.CourseListDTO;
import com.temp.common.mapper.CourseMapper;
import com.temp.common.model.entity.Course;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CourseService {

    @Autowired
    private CourseMapper mapper;

    @Autowired
    private Mapper mapperTrans;

    public List<CourseListDTO> getPageList(CourseDTO container) {
        Course courseSearch = mapperTrans.map(container, Course.class);
        Map<String, Object> map = new HashMap<>();
        map.put("course", courseSearch);
        map.put("page", container.getCurrentPage());
        map.put("size", container.getLimit());
        List<Course> courseList = mapper.queryPageList(map);
        List<CourseListDTO> list = new ArrayList<>();
        for (Course course : courseList) {
            CourseListDTO dto = mapperTrans.map(course, CourseListDTO.class);
            list.add(dto);
        }
        return list;
    }

    public Integer getTotal(CourseDTO container) {
        Course courseSearch = mapperTrans.map(container, Course.class);
        return mapper.queryCount(courseSearch);
    }

    public Integer save(CourseDTO container) {
        Course course;
        if (container.getId() != null) {
            course = mapper.queryOne(container.getId());
            if (course == null) {
                course = new Course();
            }
        } else {
            course = new Course();
        }
        course.setNumber(container.getNumber());
        course.setName(container.getName());
        course.setStart(container.getStart());
        course.setWeek(container.getWeek());
        course.setGrade(container.getGrade());
        course.setTeacher(container.getTeacher());
        if (container.getId() != null) {
            return mapper.update(course);
        } else {
            return mapper.add(course);
        }
    }

    public Integer delete(Integer id) {
        return mapper.delete(id);
    }
}