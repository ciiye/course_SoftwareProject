package com.temp.common.service;

import com.temp.admin.dto.TeacherDTO;
import com.temp.admin.dto.list.TeacherListDTO;
import com.temp.common.mapper.TeacherMapper;
import com.temp.common.model.entity.Teacher;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class TeacherService {

    @Autowired
    private TeacherMapper mapper;

    @Autowired
    private Mapper mapperTrans;

    public List<TeacherListDTO> getPageList(TeacherDTO container) {
        Teacher teacherSearch = mapperTrans.map(container, Teacher.class);
        Map<String, Object> map = new HashMap<>();
        map.put("teacher", teacherSearch);
        map.put("page", container.getCurrentPage());
        map.put("size", container.getLimit());
        List<Teacher> teacherList = mapper.queryPageList(map);
        List<TeacherListDTO> list = new ArrayList<>();
        for (Teacher teacher : teacherList) {
            TeacherListDTO dto = mapperTrans.map(teacher, TeacherListDTO.class);
            list.add(dto);
        }
        return list;
    }

    public Integer getTotal(TeacherDTO container) {
        Teacher teacherSearch = mapperTrans.map(container, Teacher.class);
        return mapper.queryCount(teacherSearch);
    }

    public Integer save(TeacherDTO container) {
        Teacher teacher;
        if (container.getId() != null) {
            teacher = mapper.queryOne(container.getId());
            if (teacher == null) {
                teacher = new Teacher();
            }
        } else {
            teacher = new Teacher();
        }
        teacher.setNumber(container.getNumber());
        teacher.setName(container.getName());
        teacher.setSex(container.getSex());
        teacher.setEmail(container.getEmail());
        teacher.setJob(container.getJob());
        if (container.getId() != null) {
            return mapper.update(teacher);
        } else {
            return mapper.add(teacher);
        }
    }

    public Integer delete(Integer id) {
        return mapper.delete(id);
    }
}