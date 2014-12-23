package com.jcos.teaching.core.service.Impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jcos.teaching.core.dao.BookTypeMapper;
import com.jcos.teaching.core.model.BookType;
import com.jcos.teaching.core.service.BookTypeService;

@Service
public class BookTypeImpl implements BookTypeService {
	@Inject
	private BookTypeMapper bookTypeDao;

	@Override
	public List<BookType> getAllBookType() {
		return bookTypeDao.queryBookType();
	}

}
