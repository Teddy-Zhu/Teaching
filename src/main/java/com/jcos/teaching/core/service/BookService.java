package com.jcos.teaching.core.service;

import java.util.List;

import com.jcos.teaching.core.model.Book;

public interface BookService {

	public boolean addnewbook(Book record);

	public boolean deletebookbyId(Integer[] bookIds);

	// public boolean updatebookById(Book record);

	boolean updatebookByIds(List<Book> record);

	Integer authExistSupplierInUse(Integer[] supplierId);

	boolean authBookType(int id);

	List<Book> getAllBooks(Book record, Integer page, Integer rows);

	int getBookTotal(Book record);

	boolean authBook(int id);
}
