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
	public boolean addnewbook(Book record) {
		if (bookDao.insertSelective(record) == 1)
			return true;
		else
			return false;
	}

	@Override
	public int getBookTotal() {
		return bookDao.queryBookTotal();
	}

	@Override
	public boolean deletebookbyId(Integer[] bookIds) {
		for (Integer id : bookIds) {
			if (bookDao.deleteByPrimaryKey(id) != 1)
				return false;

		}
		return true;
	}

	@Override
	public boolean updatebookByIds(List<Book> record) {
		for (Book book : record) {
			if (bookDao.updateByPrimaryKey(book) != 1) {
				return false;
			}
		}
		return true;
	}

}
