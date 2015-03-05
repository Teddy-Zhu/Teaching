package com.jcos.teaching.core.service.Impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jcos.teaching.core.dao.CourseTypeMapper;
import com.jcos.teaching.core.model.CourseType;
import com.jcos.teaching.core.service.CourseTypeService;

@Service
public class CourseTypeImpl implements CourseTypeService {

	@Inject
	private CourseTypeMapper courseTypeDao;
	
	@Override
	public List<CourseType> getAllCourseType(){
		return courseTypeDao.selectAllCourseType();
	}
}
