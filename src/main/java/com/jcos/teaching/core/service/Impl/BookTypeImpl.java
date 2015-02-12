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

	@Override
	public boolean authBookTypeById(Integer id) {
		BookType type = bookTypeDao.selectByPrimaryKey(id);
		if (type != null && type.getIntbooktypeid() == id) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateBookType(BookType record) {
		Integer i = bookTypeDao.updateByPrimaryKey(record);
		if (i != 1) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public boolean insertBookType(BookType record) {
		Integer i = bookTypeDao.insertSelective(record);
		if (i != 1) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public boolean deleteBookType(Integer id) {
		Integer i = bookTypeDao.deleteByPrimaryKey(id);
		if (i != 1) {
			return false;
		} else {
			return true;
		}
	}
}
