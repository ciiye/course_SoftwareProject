package com.temp.admin.dto.list;

import com.temp.common.model.BaseListDTO;

import java.util.Date;

public class CheckListDTO extends BaseListDTO {
    private Integer id;
    private String name;
    private String status;
    private String student;
    private String teacher;

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStatus() {
        return this.status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getStudent() {
        return this.student;
    }

    public void setStudent(String student) {
        this.student = student;
    }

    public String getTeacher() {
        return this.teacher;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }
}