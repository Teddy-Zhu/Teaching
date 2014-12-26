package com.jcos.teaching.core.service.Impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jcos.teaching.core.dao.BookMapper;
import com.jcos.teaching.core.model.Book;
import com.jcos.teaching.core.service.BookService;

@Service
public class BookImpl implements BookService {

	@Inject
	private BookMapper bookDao;

	@Override
	public List<Book> getAllBooks(Integer page, Integer rows) {
		return bookDao.queryBooks(rows * (page - 1), rows);
	}

	@Override
	public int addnewbook(Book record) {
		return bookDao.insertSelective(record);
	}

	@Override
	public int getBookTotal() {
		return bookDao.queryBookTotal();
	}
}
