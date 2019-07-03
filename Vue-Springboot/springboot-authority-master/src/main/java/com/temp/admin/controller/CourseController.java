package com.temp.admin.controller;


import com.temp.admin.dto.CourseDTO;
import com.temp.common.model.ResponseData;
import com.temp.common.service.CourseService;
import com.temp.common.util.FormatUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@Api(description = "课程管理模块")
@RestController("adminCourseController")
@RequestMapping("/admin/course")
public class CourseController {

    @Autowired
    private CourseService service;

    @ApiOperation(value = "课程信息列表", notes = "根据参数查询课程信息")
    @RequestMapping(value = "/list", method = { RequestMethod.POST })
    public ResponseData list(@RequestBody CourseDTO container) {
        Map<String, Object> map = new HashMap<>();
        map.put("list", service.getPageList(container));
        map.put("total", service.getTotal(container));
        return FormatUtil.success(map);
    }

    @ApiOperation(value = "新增或修改课程列表", notes = "根据ID确定是否存在课程信息，进行新增或修改")
    @RequestMapping(value = "/save", method = { RequestMethod.POST })
    public ResponseData save(@RequestBody CourseDTO container) {
        return FormatUtil.success(service.save(container));
    }

    @ApiOperation(value = "删除课程信息", notes = "根据ID删除课程信息")
    @RequestMapping(value = "/del", method = { RequestMethod.DELETE })
    public ResponseData delete(@RequestBody CourseDTO container) {
        if (service.delete(container.getId()) > 0) {
            return FormatUtil.success();
        }
        return FormatUtil.fail();
    }
}