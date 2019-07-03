package com.temp.common.service;


import com.temp.admin.dto.CheckDTO;
import com.temp.admin.dto.list.CheckListDTO;
import com.temp.common.mapper.CheckMapper;
import com.temp.common.model.entity.Check;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CheckService {

    @Autowired
    private CheckMapper mapper;

    @Autowired
    private Mapper mapperTrans;

    public List<CheckListDTO> getPageList(CheckDTO container) {
        Check checkSearch = mapperTrans.map(container, Check.class);
        Map<String, Object> map = new HashMap<>();
        map.put("check", checkSearch);
        map.put("page", container.getCurrentPage());
        map.put("size", container.getLimit());
        List<Check> checkList = mapper.queryPageList(map);
        List<CheckListDTO> list = new ArrayList<>();
        for (Check check : checkList) {
            CheckListDTO dto = mapperTrans.map(check, CheckListDTO.class);
            list.add(dto);
        }
        return list;
    }

    public Integer getTotal(CheckDTO container) {
        Check checkSearch = mapperTrans.map(container, Check.class);
        return mapper.queryCount(checkSearch);
    }

    public Integer save(CheckDTO container) {
        Check check;
        if (container.getId() != null) {
            check = mapper.queryOne(container.getId());
            if (check == null) {
                check = new Check();
            }
        } else {
            check = new Check();
        }
        check.setName(container.getName());
        check.setStatus(container.getStatus());
        check.setStudent(container.getStudent());
        check.setTeacher(container.getTeacher());
        if (container.getId() != null) {
            return mapper.update(check);
        } else {
            return mapper.add(check);
        }
    }

    public Integer delete(Integer id) {
        return mapper.delete(id);
    }
}