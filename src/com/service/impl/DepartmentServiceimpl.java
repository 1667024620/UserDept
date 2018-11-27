package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.DepartmentMapper;
import com.pojo.Department;
import com.service.DepartmentService;
@Service
public class DepartmentServiceimpl implements DepartmentService {
	@Autowired
	private DepartmentMapper departmentMapper;

	@Override
	public List<Department> selectAll() {
		// TODO Auto-generated method stub
		return departmentMapper.selectAll();
	}
}
