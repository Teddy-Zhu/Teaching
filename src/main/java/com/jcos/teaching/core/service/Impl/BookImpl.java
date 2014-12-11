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
	public List<Book> getAllBooks() {
		return bookDao.queryBooks();
	}

}
