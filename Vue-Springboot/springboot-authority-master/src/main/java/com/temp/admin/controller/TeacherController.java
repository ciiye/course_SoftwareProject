package com.temp.admin.controller;

import com.temp.admin.dto.TeacherDTO;
import com.temp.common.model.ResponseData;
import com.temp.common.service.TeacherService;
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

@Api(description = "教师管理模块")
@RestController("adminTeacherController")
@RequestMapping("/admin/teacher")
public class TeacherController {

    @Autowired
    private TeacherService service;

    @ApiOperation(value = "教师信息列表", notes = "根据参数查询教师信息")
    @RequestMapping(value = "/list", method = { RequestMethod.POST })
    public ResponseData list(@RequestBody TeacherDTO container) {
        Map<String, Object> map = new HashMap<>();
        map.put("list", service.getPageList(container));
        map.put("total", service.getTotal(container));
        return FormatUtil.success(map);
    }

    @ApiOperation(value = "新增或修改教师列表", notes = "根据ID确定是否存在教师信息，进行新增或修改")
    @RequestMapping(value = "/save", method = { RequestMethod.POST })
    public ResponseData save(@RequestBody TeacherDTO container) {
        return FormatUtil.success(service.save(container));
    }

    @ApiOperation(value = "删除教师信息", notes = "根据ID删除教师信息")
    @RequestMapping(value = "/del", method = { RequestMethod.DELETE })
    public ResponseData delete(@RequestBody TeacherDTO container) {
        if (service.delete(container.getId()) > 0) {
            return FormatUtil.success();
        }
        return FormatUtil.fail();
    }
}