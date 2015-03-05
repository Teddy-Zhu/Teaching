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
	public List<Book> getAllBooks(Book record, Integer page, Integer rows) {
		return bookDao.queryBooks(record, rows * (page - 1), rows);
	}

	@Override
	public boolean addnewbook(Book record) {
		if (bookDao.insertSelective(record) == 1)
			return true;
		else
			return false;
	}

	@Override
	public int getBookTotal(Book record) {
		return bookDao.queryBookTotal(record);
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

	@Override
	public Integer authExistSupplierInUse(Integer[] supplierId) {
		for (Integer i : supplierId) {
			Integer ret = bookDao.authSupplierById(i);
			if (ret > 0)
				return i;
		}
		return 0;
	}

	@Override
	public boolean authBookType(int id) {
		Integer i = bookDao.authBookType(id);
		if (i != 0) {
			return false;
		} else {
			return true;
		}
	}

}
