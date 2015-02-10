package com.jcos.teaching.core.service;

import java.util.List;

import com.jcos.teaching.core.model.Book;

public interface BookService {

	public List<Book> getAllBooks(Integer page, Integer rows);

	public boolean addnewbook(Book record);

	public int getBookTotal();

	public boolean deletebookbyId(Integer[] bookIds);

	//public boolean updatebookById(Book record);

	boolean updatebookByIds(List<Book> record);

	Integer authExistSupplierInUse(Integer[] supplierId);
}
